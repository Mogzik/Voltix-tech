import { useEffect, useState } from "react";
 
export default function PromotionDay() {
  const [time, setTime] = useState(3600);
 
  useEffect(() => {
    const timer = setInterval(() => setTime(t => t - 1), 1000);
    return () => clearInterval(timer);
  }, []);
 
  return (
    <div className="promo">
      <h2>Promocja dnia: Gaming Laptop -30%</h2>
      <p>Pozostały czas: {time}s</p>
    </div>
  );
}