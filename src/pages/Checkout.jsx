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
  const [cardExpiry, setCardExpiry] = useState("");
  const [cardCVV, setCardCVV] = useState("");
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [loading, setLoading] = useState(false);

  const totalPrice = cart.reduce((sum, item) => sum + item.price * item.quantity, 0);

  // Format card number input (add spaces every 4 digits)
  const handleCardNumberChange = (e) => {
    const value = e.target.value.replace(/\s/g, "");
    if (/^\d*$/.test(value) && value.length <= 16) {
      const formatted = value.replace(/(\d{4})(?=\d)/g, "$1 ");
      setCardNumber(formatted);
    }
  };

  // Format expiry date (MM/YY)
  const handleExpiryChange = (e) => {
    const value = e.target.value.replace(/\D/g, "");
    if (value.length <= 4) {
      if (value.length >= 2) {
        setCardExpiry(value.slice(0, 2) + "/" + value.slice(2));
      } else {
        setCardExpiry(value);
      }
    }
  };

  // Format CVV input (numbers only, max 4)
  const handleCVVChange = (e) => {
    const value = e.target.value.replace(/\D/g, "");
    if (value.length <= 3) {
      setCardCVV(value);
    }
  };

  async function pay() {
    if (!user) {
      alert("Musisz być zalogowany, aby dokończyć płatność!");
      navigate("/login");
      return;
    }

    // Validation
    if (!firstName.trim() || !lastName.trim()) {
      alert("Proszę wpisać imię i nazwisko.");
      return;
    }

    if (!cardNumber.replace(/\s/g, "").trim() || cardNumber.replace(/\s/g, "").length !== 16) {
      alert("Proszę wpisać prawidłowy numer karty (16 cyfr).");
      return;
    }

    if (!cardExpiry.trim() || cardExpiry.length !== 5) {
      alert("Proszę wpisać datę ważności (MM/YY).");
      return;
    }

    if (!cardCVV.trim() || cardCVV.length !== 3) {
      alert("Proszę wpisać prawidłowy kod CVV (3 cyfry).");
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
          cardNumber: cardNumber.replace(/\s/g, ""),
          cardExpiry: cardExpiry,
          cardCVV: cardCVV,
          firstName: firstName,
          lastName: lastName
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
      setCardExpiry("");
      setCardCVV("");
      setFirstName("");
      setLastName("");
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
    <div className="checkout-container">
      <h1 className="checkout-title">Płatność testowa</h1>
      <p className="checkout-user-info">Zalogowany jako: <strong>{user.email}</strong></p>
      <p className="checkout-total">Razem do zapłaty: <strong>{totalPrice.toFixed(2)} zł</strong></p>
      
      <div className="payment-form-container">
        <div className="payment-form">
          <h3>Dane karty kredytowej</h3>
          
          <div className="form-row-full">
            <label>Numer karty</label>
            <input 
              className="form-input card-number" 
              placeholder="1234 5678 9012 3456" 
              value={cardNumber}
              onChange={handleCardNumberChange}
              maxLength="19"
              disabled={loading}
            />
          </div>

          <div className="form-row">
            <div className="form-col">
              <label>Data ważności</label>
              <input 
                className="form-input" 
                placeholder="MM/YY" 
                value={cardExpiry}
                onChange={handleExpiryChange}
                maxLength="5"
                disabled={loading}
              />
            </div>
            <div className="form-col">
              <label>CVV</label>
              <input 
                className="form-input" 
                placeholder="123" 
                value={cardCVV}
                onChange={handleCVVChange}
                maxLength="4"
                disabled={loading}
                type="password"
              />
            </div>
          </div>

          <div className="form-row-full" style={{marginTop: '1.5rem'}}>
            <h3>Dane osobowe</h3>
          </div>

          <div className="form-row">
            <div className="form-col">
              <label>Imię</label>
              <input 
                className="form-input" 
                placeholder="Jan" 
                value={firstName}
                onChange={(e) => setFirstName(e.target.value)}
                disabled={loading}
              />
            </div>
            <div className="form-col">
              <label>Nazwisko</label>
              <input 
                className="form-input" 
                placeholder="Kowalski" 
                value={lastName}
                onChange={(e) => setLastName(e.target.value)}
                disabled={loading}
              />
            </div>
          </div>
        </div>
      </div>

      <button className="checkout" onClick={pay} disabled={loading}>
        {loading ? "Przetwarzanie..." : "Zapłać"}
      </button>
    </div>
  );
}