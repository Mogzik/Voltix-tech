import { useContext } from "react";
import { Link } from "react-router-dom";
import { AuthContext } from "../context/AuthContext";
import logo from "../logo.png";

export default function Navbar() {
  const { user, logout } = useContext(AuthContext);

  return (
    <header className="header">
      <div className="header-inner">
        <div className="header-left">
          <img src={logo} alt="Logo" className="header-logo" />
          <Link className="header-link" to="/">Home</Link>
          <Link className="header-link" to="/products">Produkty</Link>
          <Link className="header-link" to="/cart">Koszyk</Link>
          {user && <Link className="header-link" to="/orders">Moje zamówienia</Link>}
        </div>
        <div className="header-right">
          {user ? (
            <button className="header-logout" type="button" onClick={logout}>Wyloguj</button>
          ) : (
            <Link className="header-link" to="/login">Zaloguj się</Link>
          )}
        </div>
      </div>
    </header>
  );
}