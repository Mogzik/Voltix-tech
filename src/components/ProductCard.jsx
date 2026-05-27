import { useContext, useState } from "react";
import { CartContext } from "../context/CartContext";
 
export default function ProductCard({ product }) {
  const { addToCart } = useContext(CartContext);
  const [imageSrc, setImageSrc] = useState(product.image);
  const [showModal, setShowModal] = useState(false);

  const handleImageError = () => {
    setImageSrc("https://via.placeholder.com/400x300?text=No+Image");
  };

  const formatKey = (k) => {
    return k.replace(/_/g, ' ').replace(/\b\w/g, c => c.toUpperCase());
  }

  const parseSpecs = (specs) => {
    if (!specs) return null;
    if (typeof specs === 'object') return specs;
    try {
      return JSON.parse(specs);
    } catch {
      return specs;
    }
  };

  const specs = parseSpecs(product.specs);

  return (
    <>
      <div className="product-card" onClick={() => setShowModal(true)} style={{cursor: 'pointer'}}>
        <img src={imageSrc} alt={product.name} onError={handleImageError} />
        <h3>{product.name}</h3>
        <p className="price">{product.price} zł</p>
        <div className="specs-container">
          <div className="specs">
            {specs && Object.entries(specs).slice(0, 3).map(([key, value]) => (
              <p key={key}><strong>{formatKey(key)}:</strong> {value}</p>
            ))}
          </div>
        </div>
        <button onClick={(e) => { e.stopPropagation(); addToCart(product); }}>Dodaj do koszyka</button>
      </div>

      {showModal && (
        <div className="modal-overlay" onClick={() => setShowModal(false)}>
          <div className="modal" onClick={(e) => e.stopPropagation()}>
            <button className="modal-close" onClick={() => setShowModal(false)}>×</button>
            <div className="modal-image-wrapper">
              <img src={imageSrc} alt={product.name} onError={handleImageError} className="modal-image" />
            </div>
            <h3>{product.name} — Specyfikacja</h3>
            <div className="modal-content">
              {specs ? (
                <table className="specs-table">
                  <tbody>
                    {Object.entries(specs).map(([key, value]) => (
                      <tr key={key}>
                        <td className="spec-key">{formatKey(key)}</td>
                        <td className="spec-value">{String(value)}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              ) : (
                <p>Brak specyfikacji dla tego produktu.</p>
              )}
            </div>
          </div>
        </div>
      )}
    </>
  );
}