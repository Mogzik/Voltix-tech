<<<<<<< HEAD
import { BrowserRouter, Routes, Route, Link } from "react-router-dom";
import { CartProvider } from "./context/CartContext";
=======
import { BrowserRouter, Routes, Route } from "react-router-dom";
>>>>>>> 579bcffa0f24b16cbd6a04bcd1df70b75b6abf46

import Products from "./pages/Products";
import Cart from "./pages/Cart";
import Checkout from "./pages/Checkout";
import Admin from "./pages/Admin";
import Navbar from "./components/Navbar";
 
export default function App() {
  return (
    <CartProvider>
      <BrowserRouter>
<<<<<<< HEAD
   
=======
>>>>>>> 579bcffa0f24b16cbd6a04bcd1df70b75b6abf46
        <Navbar />
        <Routes>
          <Route path="/products" element={<Products />} />
          <Route path="/cart" element={<Cart />} />
          <Route path="/checkout" element={<Checkout />} />
          <Route path="/admin" element={<Admin />} />
        </Routes>
      </BrowserRouter>
    </CartProvider>
  );
}