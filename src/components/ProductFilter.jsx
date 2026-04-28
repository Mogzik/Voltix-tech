import "./ProductFilter.css";

export default function ProductFilter({ setSearch, setBrand, setCategory, brands = [], categories = [] }) {
  return (
    <div className="filters">
      <input type="search" className="filter-input" placeholder="Szukaj..." onChange={e => setSearch(e.target.value)} />
      <select className="filter-select" onChange={e => setBrand(e.target.value)}>
        <option value="">Marka</option>
        {brands.map(brand => (
          <option key={brand} value={brand}>{brand}</option>
        ))}
      </select>
      <select className="filter-select" onChange={e => setCategory(e.target.value)}>
        <option value="">Kategoria</option>
        {categories.map(category => (
          <option key={category} value={category}>{category}</option>
        ))}
      </select>
    </div>
  );
}
