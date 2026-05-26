import { useEffect, useState } from "react";
import "../styles/PromotionDay.css";

const STORAGE_KEY = "promotionDay";

export default function PromotionDay() {
  const [product, setProduct] = useState(null);
  const [discount, setDiscount] = useState(0);
  const [timeLeft, setTimeLeft] = useState(600);
  const [priceReduction, setPriceReduction] = useState(0);
  const [quantity, setQuantity] = useState(5);
  const [allProducts, setAllProducts] = useState([]);

  // Pobierz produkty z API
  useEffect(() => {
    fetch("http://localhost:3001/components")
      .then(r => r.json())
      .then(data => {
        setAllProducts(data);
        loadOrSelectProduct(data);
      })
      .catch(console.error);
  }, []);

  // Wczytaj produkt z localStorage lub wybierz nowy
  const loadOrSelectProduct = (products) => {
    const stored = localStorage.getItem(STORAGE_KEY);
    
    if (stored) {
      try {
        const { product, discount, priceReduction, quantity, timestamp } = JSON.parse(stored);
        const elapsed = Math.floor((Date.now() - timestamp) / 1000);
        const remaining = Math.max(0, 600 - elapsed);
        
        // Jeśli minęło więcej niż 10 minut, wybierz nowy produkt
        if (remaining === 0) {
          selectRandomProduct(products);
        } else {
          setProduct(product);
          setDiscount(discount);
          setPriceReduction(priceReduction);
          setQuantity(parseInt(quantity) || 5);
          setTimeLeft(remaining);
          console.log("Loaded quantity:", parseInt(quantity));
        }
      } catch (error) {
        console.error("Błąd wczytywania z localStorage:", error);
        selectRandomProduct(products);
      }
    } else {
      selectRandomProduct(products);
    }
  };

  // Funkcja wyboru losowego produktu
  const selectRandomProduct = (products) => {
    if (products.length === 0) return;
    const randomProduct = products[Math.floor(Math.random() * products.length)];
    const randomDiscount = Math.floor(Math.random() * 41) + 10; // 10-50%
    const randomQuantity = Math.floor(Math.random() * 96) + 5; // 5-100 sztuk
    const reduction = Math.round((randomProduct.price * randomDiscount) / 100);
    
    console.log("Random quantity selected:", randomQuantity);
    
    setProduct(randomProduct);
    setDiscount(randomDiscount);
    setPriceReduction(reduction);
    setQuantity(randomQuantity);
    setTimeLeft(600); // 10 minut = 600 sekund
    
    // Zapisz do localStorage
    localStorage.setItem(STORAGE_KEY, JSON.stringify({
      product: randomProduct,
      discount: randomDiscount,
      priceReduction: reduction,
      quantity: randomQuantity,
      timestamp: Date.now()
    }));
  };

  // Interwał 10 minut do zmiany produktu
  useEffect(() => {
    if (allProducts.length === 0) return;
    
    const interval = setInterval(() => {
      selectRandomProduct(allProducts);
    }, 10 * 60 * 1000); // 10 minut

    return () => clearInterval(interval);
  }, [allProducts]);

  // Timer odliczający czas do następnego produktu
  useEffect(() => {
    const timer = setInterval(() => {
      setTimeLeft(t => {
        const newTime = t > 0 ? t - 1 : 600;
        return newTime;
      });
    }, 1000);

    return () => clearInterval(timer);
  }, []);

  // Formatowanie czasu mm:ss
  const formatTime = (seconds) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins}:${secs < 10 ? "0" : ""}${secs}`;
  };

  // Dodaj do koszyka i zmniejsz ilość
  const handleAddToCart = () => {
    if (quantity > 0) {
      const newQuantity = quantity - 1;
      setQuantity(newQuantity);
      
      // Aktualizuj localStorage
      const stored = localStorage.getItem(STORAGE_KEY);
      if (stored) {
        const data = JSON.parse(stored);
        data.quantity = newQuantity;
        localStorage.setItem(STORAGE_KEY, JSON.stringify(data));
      }
      
      // TODO: Dodaj produkt do koszyka w CartContext
      console.log("Dodano produkt do koszyka. Pozostało sztuk:", newQuantity);
    }
  };

  if (!product) {
    return <div className="promotion-day-skeleton">Ładowanie...</div>;
  }

  const discountedPrice = product.price - priceReduction;

  return (
    <div className="promotion-day">
      <div className="promo-header">
        <h2>Promocja Dnia</h2>
      </div>
      
      <div className="promo-content">
        <div className="promo-image-container">
          <img 
            src={product.image} 
            alt={product.name}
            className="promo-image"
            onError={(e) => {
              e.target.src = "https://via.placeholder.com/300x300?text=Produkt";
            }}
          />
          <div className="discount-badge">-{discount}%</div>
        </div>

        <div className="promo-info">
          <h3 className="product-name">{product.name}</h3>
          <p className="product-brand">{product.brand}</p>
          
          <div className="price-section">
            <div className="price-row">
              <span className="original-price">{product.price} zł</span>
              <span className="new-price">{discountedPrice} zł</span>
            </div>
            <div className="savings-box">
              <p className="savings-label">Oszczędzasz:</p>
              <p className="savings-amount">
                <strong>{priceReduction} zł</strong>
              </p>
            </div>
          </div>

          <div className="timer-container">
            <p className="timer-label">Zmiana produktu za:</p>
            <p className="timer">{formatTime(timeLeft)}</p>
          </div>

          <div className="quantity-container">
            <p className="quantity-label">Pozostało sztuk: <strong className="quantity-amount">{quantity} </strong></p>
          </div>

          <button className="promo-button" onClick={handleAddToCart}>Dodaj do koszyka</button>
        </div>
      </div>
    </div>
  );
}