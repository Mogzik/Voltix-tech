import { useContext } from "react";
import { CartContext } from "../context/CartContext";
import { Link } from "react-router-dom";
 
export default function Cart() {
  const { cart, removeFromCart, updateQuantity } = useContext(CartContext);
 
  const totalPrice = cart.reduce(
    (sum, item) => sum + item.price * item.quantity,
    0
  );
 
  return (
    <div style={{ padding: "20px" }}>
      <h1>Koszyk</h1>
 
      {cart.length === 0 ? (
        <p>Koszyk jest pusty</p>
      ) : (
        <>
          {cart.map((item) => (
            <div
              key={item.id}
              style={{
                border: "1px solid gray",
                padding: "10px",
                marginBottom: "10px",
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
              }}
            >
              <div>
                <h3>{item.name}</h3>
                <p>Cena: {item.price} zł</p>
              </div>
 
              <div>
                <button onClick={() => updateQuantity(item.id, item.quantity - 1)}>
                  -
                </button>
                <span style={{ margin: "0 10px" }}>{item.quantity}</span>
                <button onClick={() => updateQuantity(item.id, item.quantity + 1)}>
                  +
                </button>
              </div>
 
              <button onClick={() => removeFromCart(item.id)}>Usuń</button>
            </div>
          ))}
 
          <h2>Łączna cena: {totalPrice} zł</h2>
          <Link to="/checkout">
            <button>Przejdź do płatności</button>
          </Link>
        </>
      )}
    </div>
  );
}