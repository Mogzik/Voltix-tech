import { Link } from "react-router-dom";
import { useState, useEffect } from "react";
import PromotionDay from "../components/PromotionDay";

const HITS_STORAGE_KEY = "hitsOfWeek";

export default function Home() {
  const [products, setProducts] = useState([]);
  const [hits, setHits] = useState([]);

  useEffect(() => {
    fetch("http://localhost:3001/components")
      .then(r => r.json())
      .then(data => {
        setProducts(data);
        loadOrRandomizeHits(data);
      })
      .catch(console.error);
  }, []);

  // Wczytaj hity z localStorage lub wylosuj nowe
  const loadOrRandomizeHits = (productsList) => {
    const stored = localStorage.getItem(HITS_STORAGE_KEY);
    
    if (stored) {
      try {
        const { hits, timestamp } = JSON.parse(stored);
        const elapsed = Math.floor((Date.now() - timestamp) / 1000);
        const remaining = Math.max(0, 10 * 60 - elapsed);
        
        // Jeśli minęło więcej niż 10 minut, wylosuj nowe
        if (remaining === 0) {
          randomizeHits(productsList);
        } else {
          setHits(hits);
        }
      } catch (error) {
        console.error("Błąd wczytywania hitów:", error);
        randomizeHits(productsList);
      }
    } else {
      randomizeHits(productsList);
    }
  };

  // Losuj 9 produktów do hitów
  const randomizeHits = (productsList) => {
    const shuffled = [...productsList].sort(() => Math.random() - 0.5);
    const newHits = shuffled.slice(0, 9);
    setHits(newHits);
    
    // Zapisz do localStorage
    localStorage.setItem(HITS_STORAGE_KEY, JSON.stringify({
      hits: newHits,
      timestamp: Date.now()
    }));
  };

  // Zmiana hitów co 10 minut
  useEffect(() => {
    if (products.length === 0) return;
    
    const interval = setInterval(() => {
      randomizeHits(products);
    }, 10 * 60 * 1000); // 10 minut

    return () => clearInterval(interval);
  }, [products]);

  const categories = Array.from(new Set(products.map(p => p.category)));
  const categoryImages = categories.reduce((acc, cat) => {
    const match = products.find(p => p.category === cat);
    acc[cat] = match ? match.image : `https://via.placeholder.com/200x150?text=${cat}`;
    return acc;
  }, {});

  return (
    <div className="home">
      <section className="hero">
        <div className="hero-content">
          <h1>Voltix Tech - Sklep Komputerowy</h1>
          <p>Odkryj najnowsze technologie i najlepsze oferty!</p>
          <Link to="/products">
            <button className="hero-button">Zobacz produkty</button>
          </Link>
        </div>
      </section>

      <section className="categories">
        <h2>Kategorie</h2>
        <div className="categories-wrapper">
          <button className="cat-arrow left" onClick={() => {
              const el = document.querySelector('.categories-scroll');
              if (el) el.scrollBy({ left: -200, behavior: 'smooth' });
            }}>&lt;</button>
          <div className="categories-scroll" ref={el => { /* keep ref for future */ }}>
            {categories.map(cat => (
              <Link key={cat} to="/products" state={{ category: cat }}>
                <div className="category-card">
                  <img src={categoryImages[cat]} alt={cat} />
                  <h3>{cat}</h3>
                </div>
              </Link>
            ))}
          </div>
          <button className="cat-arrow right" onClick={() => {
              const el = document.querySelector('.categories-scroll');
              if (el) el.scrollBy({ left: 200, behavior: 'smooth' });
            }}>&gt;</button>
        </div>
      </section>

      <section className="promo-and-hits">
        <PromotionDay />
        <div className="hits">
          <h2>Hity tygodnia</h2>
          <div className="hits-grid">
            {hits.map(p => (
              <div key={p.id} className="product-card">
                <img src={p.image} alt={p.name} />
                <h4>{p.name}</h4>
                <p className="price">{p.price} zł</p>
              </div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
}