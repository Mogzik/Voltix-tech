import { Link } from "react-router-dom";

export default function Navbar() {
  return (
    <header className="header">
      <div className="header-inner">
        <Link className="header-link" to="/">Home</Link>
        <Link className="header-link" to="/products">Produkty</Link>
        <Link className="header-link" to="/cart">Koszyk</Link>
        <Link className="header-link" to="/checkout">Płatność</Link>
        <Link className="header-link" to="/admin">Admin</Link>
      </div>
    </header>
  );
}