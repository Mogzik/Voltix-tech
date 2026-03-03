import { Link } from "react-router-dom";
<<<<<<< HEAD

export default function Navbar() {
  return (
    <header className="header">
      <div className="header-inner">
        <Link className="header-link" to="/products">Produkty</Link>
        <Link className="header-link" to="/cart">Koszyk</Link>
        <Link className="header-link" to="/checkout">Płatność</Link>
        <Link className="header-link" to="/admin">Admin</Link>
      </div>
    </header>
=======
 
export default function Navbar() {
  return (
    <nav>
      <Link to="/">Home</Link>
      <Link to="/products">Produkty</Link>
      <Link to="/cart">Koszyk</Link>
      <Link to="/admin">Admin</Link>
    </nav>
>>>>>>> 579bcffa0f24b16cbd6a04bcd1df70b75b6abf46
  );
}