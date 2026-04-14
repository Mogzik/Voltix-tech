import { Link } from "react-router-dom";
import logo from "../logo.png";

export default function Navbar() {
  return (
    <header className="header">
      <div className="header-inner">
        <img src={logo} alt="Logo" className="header-logo" />
        <Link className="header-link" to="/">Home</Link>
        <Link className="header-link" to="/products">Produkty</Link>
        <Link className="header-link" to="/cart">Koszyk</Link>
        <Link className="header-link" to="/checkout">Płatność</Link>
        <Link className="header-link" to="/admin">Admin</Link>
      </div>
    </header>
  );
}