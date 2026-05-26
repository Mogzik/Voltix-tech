import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";

const API_URL = "http://localhost:3001";

export default function Register() {
  const navigate = useNavigate();
  const [email, setEmail] = useState("");
  const [name, setName] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const [loading, setLoading] = useState(false);
  const [passwordError, setPasswordError] = useState("");

  async function handleSubmit(event) {
    event.preventDefault();
    setError("");
    setSuccess("");
    setLoading(true);
    // Validate password meets policy: min 8 chars, at least one lowercase, one uppercase, one special char
    const pwdPolicy = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9]).{8,}$/;
    if (!pwdPolicy.test(password)) {
      setPasswordError('Hasło musi mieć min. 8 znaków, zawierać małą i dużą literę oraz co najmniej jeden znak specjalny.');
      setError('Hasło nie spełnia wymagań.');
      setLoading(false);
      return;
    }
    setPasswordError("");
    try {
      // Client-side pre-check if email already exists
      const checkRes = await fetch(`${API_URL}/users?email=${encodeURIComponent(email)}`);
      if (checkRes.ok) {
        const checkData = await checkRes.json();
        if (checkData.exists) {
          setError('Konto z tym adresem e-mail już istnieje.');
          setLoading(false);
          return;
        }
      }

      const response = await fetch(`${API_URL}/register`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password, name })
      });

      const data = await response.json();
      if (!response.ok) {
        setError(data.error || "Wystąpił błąd podczas rejestracji.");
        setLoading(false);
        return;
      }

      setSuccess("Rejestracja zakończona powodzeniem. Możesz się teraz zalogować.");
      setTimeout(() => navigate("/login"), 1200);
    } catch (err) {
      setError("Nie można połączyć się z serwerem.");
      console.error(err);
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="auth-page">
      <h1>Rejestracja</h1>
      <form onSubmit={handleSubmit} className="auth-form">
        <label>
          Email
          <input
            type="email"
            value={email}
            onChange={(event) => setEmail(event.target.value)}
            required
          />
        </label>
        <label>
          Imię
          <input
            type="text"
            value={name}
            onChange={(event) => setName(event.target.value)}
          />
        </label>
        <label>
          Hasło
          <input
            type="password"
            value={password}
            onChange={(event) => setPassword(event.target.value)}
            required
          />
        </label>
        {passwordError && <p className="auth-error">{passwordError}</p>}
        <button type="submit" disabled={loading}>
          {loading ? "Rejestracja..." : "Zarejestruj się"}
        </button>
        {error && <p className="auth-error">{error}</p>}
        {success && <p className="auth-success">{success}</p>}
      </form>
      <p>
        Masz już konto? <Link to="/login">Zaloguj się</Link>
      </p>
    </div>
  );
}
