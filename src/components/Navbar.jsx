import { Link } from "react-router-dom";
 
export default function Navbar() {
  return (
    <nav>
      <Link to="/">Home</Link>
      <Link to="/products">Produkty</Link>
      <Link to="/cart">Koszyk</Link>
      <Link to="/admin">Admin</Link>
    </nav>
  );
}