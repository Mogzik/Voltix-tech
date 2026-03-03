export default function ProductFilter({ setFilter }) {
  return (
    <div className="filters">
      <input placeholder="Szukaj..." onChange={e => setFilter(e.target.value)} />
      <select onChange={e => setFilter(e.target.value)}>
        <option value="">Marka</option>
        <option value="Intel">Intel</option>
        <option value="AMD">AMD</option>
      </select>
    </div>
  );
}