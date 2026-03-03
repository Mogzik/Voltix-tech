import { useContext } from "react";
import { CartContext } from "../context/CartContext";
 
export default function ProductCard({ product }) {
  const { addToCart } = useContext(CartContext);
 
  return (
    <div className="product-card">
      <h3>{product.name}</h3>
      <p>{product.price} zł</p>
      <button onClick={() => addToCart(product)}>Dodaj do koszyka</button>
    </div>
  );
}