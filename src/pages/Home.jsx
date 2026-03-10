import { Link } from "react-router-dom";
import { useState, useEffect } from "react";

export default function Home() {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    fetch("http://localhost:3001/components")
      .then(r => r.json())
      .then(data => setProducts(data))
      .catch(console.error);
  }, []);

  const categories = Array.from(new Set(products.map(p => p.category)));
  const categoryImages = categories.reduce((acc, cat) => {
    const match = products.find(p => p.category === cat);
    acc[cat] = match ? match.image : `https://via.placeholder.com/200x150?text=${cat}`;
    return acc;
  }, {});

  const featured = products.slice(0, 3);
  const promotions = products.filter(p => p.price < 1000).slice(0, 3);
  // hits of week could be highest price or arbitrary
  const hits = products.slice(0, 4);

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
        <div className="promo-box">
          <h3>un.Box</h3>
          <p>Losuj i oszczędzaj – codziennie aż 3 produkty w super obniżce</p>
          <p>Sprawdź, co możesz wylosować</p>
          <img src="https://via.placeholder.com/200x150?text=Promocja" alt="promo" />
        </div>
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