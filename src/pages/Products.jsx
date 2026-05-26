import { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import ProductCard from "../components/ProductCard";
import ProductFilter from "../components/ProductFilter";
 
export default function Products() {
  const [products, setProducts] = useState([]);
  const [search, setSearch] = useState("");
  const [brand, setBrand] = useState("");
  const [categoryFilter, setCategoryFilter] = useState("");
  const [minPrice, setMinPrice] = useState("");
  const [maxPrice, setMaxPrice] = useState("");
  const [sort, setSort] = useState('none');
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
    const price = Number(p.price);
    const matchesMin = minPrice === "" || isNaN(minPrice) ? true : price >= Number(minPrice);
    const matchesMax = maxPrice === "" || isNaN(maxPrice) ? true : price <= Number(maxPrice);
    return matchesSearch && matchesBrand && matchesCategory && matchesMin && matchesMax;
  });
 
  // Apply sorting to filtered results
  const sorted = [...filtered];
  if (sort === 'price-asc') sorted.sort((a, b) => Number(a.price) - Number(b.price));
  if (sort === 'price-desc') sorted.sort((a, b) => Number(b.price) - Number(a.price));

  const groupedProducts = sorted.reduce((groups, product) => {
    groups[product.category] = groups[product.category] || [];
    groups[product.category].push(product);
    return groups;
  }, {});
 
  return (
    <div className="products-page">
      <h1 style={{color:"white"}}>Katalog produktów</h1>
      <ProductFilter
        setSearch={setSearch}
        setBrand={setBrand}
        setCategory={setCategoryFilter}
        setMinPrice={setMinPrice}
        setMaxPrice={setMaxPrice}
        setSort={setSort}
        brands={brands}
        categories={categories}
      />

      {filtered.length === 0 ? (
        <p className="no-results">Brak produktów spełniających kryteria.</p>
      ) : (
        Object.entries(groupedProducts).map(([category, items]) => (
          <section key={category} className="category-group">
            <h2 className={`category-title ${category === 'Podzespoły' ? 'podzespoly' : ''}`}>
              {category} <span className="count">({items.length})</span>
            </h2>
            <div className="products-grid">
              {items.map(p => <ProductCard key={p.id} product={p} />)}
            </div>
          </section>
        ))
      )}
    </div>
  );
}