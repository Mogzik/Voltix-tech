import { useContext, useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { AuthContext } from "../context/AuthContext";

const API_URL = "http://localhost:3001";

export default function Orders() {
  const { user } = useContext(AuthContext);
  const navigate = useNavigate();
  const [orders, setOrders] = useState([]);
  const [editingOrderId, setEditingOrderId] = useState(null);
  const [editedItems, setEditedItems] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  useEffect(() => {
    if (!user) return;
    fetchOrders();
  }, [user]);

  async function fetchOrders() {
    setError("");
    try {
      const response = await fetch(`${API_URL}/orders/${user.id}`);
      const data = await response.json();
      if (!response.ok) {
        setError(data.error || "Nie można pobrać zamówień.");
        return;
      }
      setOrders(data);
    } catch (err) {
      setError("Brak połączenia z serwerem.");
      console.error(err);
    }
  }

  function startEdit(order) {
    setEditingOrderId(order.id);
    setEditedItems(order.items.map(item => ({ ...item })));
  }

  function cancelEdit() {
    setEditingOrderId(null);
    setEditedItems([]);
  }

  function updateQuantity(itemId, newQty) {
    setEditedItems(prev => prev.map(item =>
      item.id === itemId ? { ...item, quantity: Math.max(0, Number(newQty)) } : item
    ));
  }

  function calculateTotal(items) {
    return items.reduce((sum, item) => sum + item.product_price * item.quantity, 0);
  }

  async function saveOrder(order) {
    setLoading(true);
    setError("");
    try {
      const itemsToSave = editedItems.filter(item => item.quantity > 0);
      const totalPrice = calculateTotal(itemsToSave);

      const response = await fetch(`${API_URL}/orders/${order.id}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          userId: user.id,
          items: itemsToSave,
          totalPrice
        })
      });

      const data = await response.json();
      if (!response.ok) {
        setError(data.error || "Nie udało się zaktualizować zamówienia.");
        setLoading(false);
        return;
      }

      await fetchOrders();
      setEditingOrderId(null);
      setEditedItems([]);
    } catch (err) {
      setError("Błąd połączenia z serwerem podczas zapisu.");
      console.error(err);
    } finally {
      setLoading(false);
    }
  }

  if (!user) {
    return (
      <div className="auth-page">
        <h1>Moje zamówienia</h1>
        <p>Aby zobaczyć i edytować zamówienia, musisz być zalogowany.</p>
        <button onClick={() => navigate("/login")} className="checkout-login-btn">
          Przejdź do logowania
        </button>
      </div>
    );
  }

  return (
    <div className="orders-page">
      <h1>Moje zamówienia</h1>
      {error && <p className="auth-error">{error}</p>}
      {!orders.length && !error && <p>Brak zamówień do wyświetlenia.</p>}

      {orders.map(order => {
        const editing = order.id === editingOrderId;
        const items = editing ? editedItems : order.items;
        const total = calculateTotal(items);

        return (
          <div key={order.id} className="order-card">
            <div className="order-header">
              <div>
                <strong>#Zamówienie {order.id}</strong>
                <p>Status: {order.status}</p>
                <p>Utworzone: {new Date(order.created_at).toLocaleString()}</p>
              </div>
              <div>
                {!editing ? (
                  <button className="checkout" onClick={() => startEdit(order)}>
                    Edytuj zamówienie
                  </button>
                ) : (
                  <>
                    <button className="checkout" onClick={() => saveOrder(order)} disabled={loading}>
                      {loading ? 'Zapisuję...' : 'Zapisz zmiany'}
                    </button>
                    <button className="checkout-login-btn" onClick={cancelEdit} disabled={loading}>
                      Anuluj
                    </button>
                  </>
                )}
              </div>
            </div>

            <div className="order-items">
              {items.length ? (
                items.map(item => (
                  <div key={item.id} className="order-item-row">
                    <div>
                      <p className="order-item-name">{item.product_name}</p>
                      <p className="order-item-meta">Cena: {item.product_price} zł</p>
                    </div>
                    <div className="order-item-actions">
                      {editing ? (
                        <input
                          type="number"
                          min="0"
                          value={item.quantity}
                          onChange={(e) => updateQuantity(item.id, e.target.value)}
                        />
                      ) : (
                        <p>Ilość: {item.quantity}</p>
                      )}
                    </div>
                  </div>
                ))
              ) : (
                <p>To zamówienie nie zawiera już produktów.</p>
              )}
            </div>

            <div className="order-summary">
              <p>Wartość: <strong>{total.toFixed(2)} zł</strong></p>
            </div>
          </div>
        );
      })}
    </div>
  );
}
