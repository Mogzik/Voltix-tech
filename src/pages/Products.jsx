import { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import ProductCard from "../components/ProductCard";
import ProductFilter from "../components/ProductFilter";
 
export default function Products() {
  const [products, setProducts] = useState([]);
  const [search, setSearch] = useState("");
  const [brand, setBrand] = useState("");
  const [categoryFilter, setCategoryFilter] = useState("");
  const location = useLocation();
  const locationCategory = location.state?.category;
 
  useEffect(() => {
    fetch('http://localhost:3001/components')
      .then(res => res.json())
      .then(data => setProducts(data))
      .catch(err => console.error('Error fetching products:', err));
  }, []);
 
  const brands = Array.from(new Set(products.map(p => p.brand))).sort();
  const categories = Array.from(new Set(products.map(p => p.category))).sort();
 
  const filtered = products.filter(p => {
    const matchesSearch = !search || p.name.toLowerCase().includes(search.toLowerCase());
    const matchesBrand = !brand || p.brand === brand;
    const matchesCategory = (!categoryFilter || p.category === categoryFilter) && (!locationCategory || p.category === locationCategory);
    return matchesSearch && matchesBrand && matchesCategory;
  });
 
  const groupedProducts = filtered.reduce((groups, product) => {
    groups[product.category] = groups[product.category] || [];
    groups[product.category].push(product);
    return groups;
  }, {});
 
  return (
    <div className="products-page">
      <h1>Katalog produktów</h1>
      <ProductFilter
        setSearch={setSearch}
        setBrand={setBrand}
        setCategory={setCategoryFilter}
        brands={brands}
        categories={categories}
      />

      {filtered.length === 0 ? (
        <p className="no-results">Brak produktów spełniających kryteria.</p>
      ) : (
        Object.entries(groupedProducts).map(([category, items]) => (
          <section key={category} className="category-group">
            <h2>{category} ({items.length})</h2>
            <div className="products-grid">
              {items.map(p => <ProductCard key={p.id} product={p} />)}
            </div>
          </section>
        ))
      )}
    </div>
  );
}