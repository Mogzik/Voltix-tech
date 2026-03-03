import { useContext } from "react";
import { CartContext } from "../context/CartContext";
<<<<<<< HEAD
import "./Checkout.css";

=======
 
>>>>>>> 579bcffa0f24b16cbd6a04bcd1df70b75b6abf46
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
<<<<<<< HEAD
      <input className="checkout" placeholder="Numer karty" />
      <button className="checkout" onClick={pay}>Zapłać</button>
=======
      <input placeholder="Numer karty" />
      <button onClick={pay}>Zapłać</button>
>>>>>>> 579bcffa0f24b16cbd6a04bcd1df70b75b6abf46
    </div>
  );
}