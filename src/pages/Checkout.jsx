import { useContext } from "react";
import { CartContext } from "../context/CartContext";
 
export default function Checkout() {
  const { clearCart } = useContext(CartContext);
 
  function pay() {
    setTimeout(() => {
      alert("Płatność przyjęta!");
      clearCart();
    }, 2000);
  }
 
  return (
    <div>
      <h1>Płatność testowa</h1>
      <input placeholder="Numer karty" />
      <button onClick={pay}>Zapłać</button>
    </div>
  );
}