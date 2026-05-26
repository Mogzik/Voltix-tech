import { createContext, useState, useEffect, useRef } from "react";

export const AuthContext = createContext();
const SESSION_TIMEOUT = 30 * 60 * 1000; // 30 minut
const ACTIVITY_EVENTS = ["mousemove", "mousedown", "keydown", "scroll", "touchstart"];

export function AuthProvider({ children }) {
  const [user, setUser] = useState(() => {
    const savedUser = localStorage.getItem("auth_user");
    return savedUser ? JSON.parse(savedUser) : null;
  });
  const timeoutRef = useRef(null);

  useEffect(() => {
    if (user) {
      localStorage.setItem("auth_user", JSON.stringify(user));
    } else {
      localStorage.removeItem("auth_user");
    }
  }, [user]);

  useEffect(() => {
    function clearLogoutTimer() {
      if (timeoutRef.current) {
        clearTimeout(timeoutRef.current);
        timeoutRef.current = null;
      }
    }

    function scheduleLogout(expiresAt) {
      clearLogoutTimer();
      const timeout = expiresAt - Date.now();
      if (timeout <= 0) {
        logout();
        return;
      }
      timeoutRef.current = setTimeout(logout, timeout);
    }

    function refreshSession() {
      if (!user) return;
      const updatedUser = { ...user, expiresAt: Date.now() + SESSION_TIMEOUT };
      setUser(updatedUser);
    }

    function handleActivity() {
      refreshSession();
    }

    if (user) {
      if (!user.expiresAt || Date.now() >= user.expiresAt) {
        logout();
      } else {
        scheduleLogout(user.expiresAt);
        ACTIVITY_EVENTS.forEach(eventName => window.addEventListener(eventName, handleActivity));
      }
    }

    return () => {
      clearLogoutTimer();
      ACTIVITY_EVENTS.forEach(eventName => window.removeEventListener(eventName, handleActivity));
    };
  }, [user]);

  function logout() {
    setUser(null);
  }

  function login(userData) {
    const userWithExpiry = { ...userData, expiresAt: Date.now() + SESSION_TIMEOUT };
    setUser(userWithExpiry);
  }

  return (
    <AuthContext.Provider value={{ user, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
}
