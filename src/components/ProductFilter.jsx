import "./ProductFilter.css";

export default function ProductFilter({ setSearch, setBrand, setCategory, setMinPrice, setMaxPrice, setSort, brands = [], categories = [] }) {
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

      <input
        type="number"
        className="filter-input price-input"
        placeholder="Min cena"
        min="0"
        onChange={e => {
          const v = e.target.value;
          setMinPrice(v === "" ? "" : Number(v));
        }}
      />

      <input
        type="number"
        className="filter-input price-input"
        placeholder="Max cena"
        min="0"
        onChange={e => {
          const v = e.target.value;
          setMaxPrice(v === "" ? "" : Number(v));
        }}
      />

      <select className="filter-select" onChange={e => setSort && setSort(e.target.value)}>
        <option value="none">Sortuj</option>
        <option value="price-asc">Cena: najniższa → najwyższa</option>
        <option value="price-desc">Cena: najwyższa → najniższa</option>
      </select>
    </div>
  );
}
