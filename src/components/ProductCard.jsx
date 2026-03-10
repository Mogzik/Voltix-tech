import { useContext } from "react";
import { CartContext } from "../context/CartContext";
 
export default function ProductCard({ product }) {
  const { addToCart } = useContext(CartContext);
 
  return (
    <div className="product-card">
      <img src={product.image} alt={product.name} />
      <h3>{product.name}</h3>
      <p className="price">{product.price} zł</p>
      <div className="specs-container">
        <div className="specs">
          {Object.entries(product.specs).slice(0, 3).map(([key, value]) => (
            <p key={key}><strong>{key}:</strong> {value}</p>
          ))}
        </div>
      </div>
      <button onClick={() => addToCart(product)}>Dodaj do koszyka</button>
    </div>
  );
}