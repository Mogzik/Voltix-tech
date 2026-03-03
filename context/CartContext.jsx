import { createContext, useState, useEffect } from "react";
 
// Tworzymy kontekst
export const CartContext = createContext();
 
// Provider – udostępnia koszyk całej aplikacji
export function CartProvider({ children }) {
  // Stan koszyka (wczytanie z localStorage)
  const [cart, setCart] = useState(() => {
    const savedCart = localStorage.getItem("cart");
    return savedCart ? JSON.parse(savedCart) : [];
  });
 
  // Zapisywanie koszyka do localStorage
  useEffect(() => {
    localStorage.setItem("cart", JSON.stringify(cart));
  }, [cart]);
 
  // Dodanie produktu do koszyka
  function addToCart(product) {
    setCart((prev) => [...prev, { ...product, quantity: 1 }]);
  }
 
  // Usunięcie produktu
  function removeFromCart(id) {
    setCart((prev) => prev.filter((item) => item.id !== id));
  }
 
  // Zmiana ilości produktu
  function updateQuantity(id, qty) {
    setCart((prev) =>
      prev.map((item) =>
        item.id === id ? { ...item, quantity: qty } : item
      )
    );
  }
 
  // Wyczyszczenie koszyka
  function clearCart() {
    setCart([]);
  }
 
  return (
    <CartContext.Provider
      value={{
        cart,
        addToCart,
        removeFromCart,
        updateQuantity,
        clearCart,
      }}
    >
      {children}
    </CartContext.Provider>
  );
}
 