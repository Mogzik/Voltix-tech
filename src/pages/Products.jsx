import { useState } from "react";
import ProductCard from "../components/ProductCard";
import ProductFilter from "../components/ProductFilter";
 
const products = [
  { id: 1, name: "Laptop MSI", price: 3500, brand: "Intel" },
  { id: 2, name: "Ryzen 5 5600X", price: 800, brand: "AMD" }
];
 
export default function Products() {
  const [filter, setFilter] = useState("");
 
  const filtered = products.filter(p =>
    p.name.includes(filter) || p.brand.includes(filter)
  );
 
  return (
    <div>
      <h1>Katalog produktów</h1>
      <ProductFilter setFilter={setFilter} />
      {filtered.map(p => <ProductCard key={p.id} product={p} />)}
    </div>
  );
}