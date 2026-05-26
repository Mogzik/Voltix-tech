import { useState, useEffect } from "react";
import "./Admin.css";

const API_URL = "http://localhost:3001";

export default function Admin() {
  const [orders, setOrders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [deleting, setDeleting] = useState(null);

  useEffect(() => {
    fetchAllOrders();
  }, []);

  async function fetchAllOrders() {
    try {
      const response = await fetch(`${API_URL}/admin/orders`);
      const data = await response.json();
      setOrders(data);
      setLoading(false);
    } catch (error) {
      console.error('Error fetching orders:', error);
      setLoading(false);
    }
  }

  async function deleteOrder(orderId) {
    if (!window.confirm('Czy na pewno chcesz usunąć to zamówienie?')) {
      return;
    }

    setDeleting(orderId);
    try {
      const response = await fetch(`${API_URL}/admin/orders/${orderId}`, {
        method: 'DELETE'
      });

      if (response.ok) {
        setOrders(orders.filter(o => o.id !== orderId));
        alert('Zamówienie zostało usunięte.');
      } else {
        const data = await response.json();
        alert(`Błąd: ${data.error}`);
      }
    } catch (error) {
      console.error('Error deleting order:', error);
      alert('Błąd połączenia z serwerem.');
    } finally {
      setDeleting(null);
    }
  }

  if (loading) {
    return (
      <div className="admin-container">
        <h1>Panel Administratora</h1>
        <p style={{color: '#fff'}}>Ładowanie zamówień...</p>
      </div>
    );
  }

  return (
    <div className="admin-container">
      <h1>Panel Administratora</h1>
      
      <section className="admin-section">
        <h2>Wszystkie zamówienia ({orders.length})</h2>
        
        {orders.length === 0 ? (
          <p className="admin-empty">Brak zamówień w systemie.</p>
        ) : (
          <div className="orders-table">
            {orders.map(order => (
              <div key={order.id} className="order-card">
                <div className="order-header">
                  <div className="order-info">
                    <h3>Zamówienie #{order.id}</h3>
                    <p className="order-email">Email: {order.email}</p>
                    <p className="order-date">Data: {new Date(order.created_at).toLocaleString('pl-PL')}</p>
                  </div>
                  <div className="order-price">
                    <span className="price-label">Razem:</span>
                    <span className="price-value">{parseFloat(order.total_price).toFixed(2)} zł</span>
                  </div>
                </div>

                <div className="order-items">
                  <h4>Produkty:</h4>
                  <ul>
                    {order.items && order.items.map(item => (
                      <li key={item.id}>
                        {item.product_name} - {item.quantity}x - {parseFloat(item.product_price).toFixed(2)} zł
                      </li>
                    ))}
                  </ul>
                </div>

                <div className="order-actions">
                  <button 
                    className="delete-btn"
                    onClick={() => deleteOrder(order.id)}
                    disabled={deleting === order.id}
                  >
                    {deleting === order.id ? 'Usuwanie...' : 'Usuń zamówienie'}
                  </button>
                </div>
              </div>
            ))}
          </div>
        )}
      </section>
    </div>
  );
}