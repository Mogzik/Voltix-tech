import { useContext, useState } from "react";
import { useNavigate } from "react-router-dom";
import { CartContext } from "../context/CartContext";
import { AuthContext } from "../context/AuthContext";
import "./Checkout.css";

const API_URL = "http://localhost:3001";

export default function Checkout() {
  const { cart, clearCart } = useContext(CartContext);
  const { user } = useContext(AuthContext);
  const navigate = useNavigate();
  const [cardNumber, setCardNumber] = useState("");
  const [loading, setLoading] = useState(false);

  const totalPrice = cart.reduce((sum, item) => sum + item.price * item.quantity, 0);

  async function pay() {
    if (!user) {
      alert("Musisz być zalogowany, aby dokończyć płatność!");
      navigate("/login");
      return;
    }

    if (!cardNumber.trim()) {
      alert("Proszę wpisać numer karty.");
      return;
    }

    setLoading(true);
    try {
      const response = await fetch(`${API_URL}/payment`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          userId: user.id,
          cartItems: cart,
          totalPrice: totalPrice,
          cardNumber: cardNumber
        })
      });

      const data = await response.json();
      if (!response.ok) {
        alert(`Błąd: ${data.error}`);
        setLoading(false);
        return;
      }

      alert(`Płatność przyjęta! ID zamówienia: ${data.orderId}`);
      clearCart();
      setCardNumber("");
      navigate("/");
    } catch (error) {
      alert("Błąd połączenia z serwerem.");
      console.error(error);
      setLoading(false);
    }
  }

  if (!user) {
    return (
      <div className="checkout-locked">
        <h1>Płatność</h1>
        <p className="checkout-message">
          Aby dokonać płatności, musisz być zalogowany.
        </p>
        <button className="checkout-login-btn" onClick={() => navigate("/login")}>
          Przejdź do logowania
        </button>
        <p>
          Nie masz konta?{" "}
          <button className="checkout-register-link" onClick={() => navigate("/register")}>
            Zarejestruj się
          </button>
        </p>
      </div>
    );
  }

  return (
    <div>
      <h1>Płatność testowa</h1>
      <p className="checkout-user-info">Zalogowany jako: <strong>{user.email}</strong></p>
      <p className="checkout-total">Razem do zapłaty: <strong>${totalPrice.toFixed(2)}</strong></p>
      <input 
        className="checkout1" 
        placeholder="Numer karty" 
        value={cardNumber}
        onChange={(e) => setCardNumber(e.target.value)}
        disabled={loading}
      />
      <button className="checkout" onClick={pay} disabled={loading}>
        {loading ? "Przetwarzanie..." : "Zapłać"}
      </button>
    </div>
  );
}