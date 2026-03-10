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
 
  const filtered = products.filter(p => {
    const matchesSearch = !search || p.name.toLowerCase().includes(search.toLowerCase());
    const matchesBrand = !brand || p.brand === brand;
    const matchesCategory = (!categoryFilter || p.category === categoryFilter) && (!locationCategory || p.category === locationCategory);
    return matchesSearch && matchesBrand && matchesCategory;
  });
 
  return (
    <div>
      <h1>Katalog produktów</h1>
      <ProductFilter setSearch={setSearch} setBrand={setBrand} setCategory={setCategoryFilter} />
      <div className="products-grid">
        {filtered.map(p => <ProductCard key={p.id} product={p} />)}
      </div>
    </div>
  );
}