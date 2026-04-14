import "./ProductFilter.css";

export default function ProductFilter({ setSearch, setBrand, setCategory }) {
  return (
    <div className="filters">
      <input type="search" className="filter-input" placeholder="Szukaj..." onChange={e => setSearch(e.target.value)} />
      <select className="filter-select" onChange={e => setBrand(e.target.value)}>
        <option value="">Marka</option>
        <option value="Intel">Intel</option>
        <option value="AMD">AMD</option>
        <option value="Samsung">Samsung</option>
        <option value="Logitech">Logitech</option>
        <option value="Razer">Razer</option>
        <option value="Apple">Apple</option>
        <option value="Sony">Sony</option>
      </select>
      <select className="filter-select" onChange={e => setCategory(e.target.value)}>
        <option value="">Kategoria</option>
        <option value="Laptopy">Laptopy</option>
        <option value="Podzespoły">Podzespoły</option>
        <option value="Monitory">Monitory</option>
        <option value="Akcesoria">Akcesoria</option>
        <option value="Smartfony">Smartfony</option>
        <option value="Konsolki">Konsolki</option>
      </select>
    </div>
  );
}