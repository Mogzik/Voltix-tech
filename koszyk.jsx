// src/context/CartContext.jsx
import { createContext, useState, useEffect } from "react";
 
export const CartContext = createContext();
 
export function CartProvider({ children }) {
  const [cart, setCart] = useState(JSON.parse(localStorage.getItem("cart")) || []);
 
  useEffect(() => {
    localStorage.setItem("cart", JSON.stringify(cart));
  }, [cart]);
 
  function addToCart(product) {
    setCart([...cart, product]);
  }
 
  function clearCart() {
    setCart([]);
  }
 
  return (
    <CartContext.Provider value={{ cart, addToCart, clearCart }}>
      {children}
    </CartContext.Provider>
  );
}