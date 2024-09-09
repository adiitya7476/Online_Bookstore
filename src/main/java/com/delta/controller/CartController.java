package com.delta.controller;

import java.util.ArrayList;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.delta.model.Books;
import com.delta.model.Cart;
import com.delta.model.CartItem;
import com.delta.model.User;
import com.delta.repository.BookRepo;
import com.delta.repository.CartItemRepo;
import com.delta.repository.CartRepo;
import com.delta.repository.UserRepo;

@Controller
public class CartController {

	@Autowired
	private CartRepo crepo;
	@Autowired
	private CartItemRepo cirepo;
	
	@Autowired
	private BookRepo brepo;
	
	@Autowired
	private UserRepo urepo;
	
	@RequestMapping("/cartReq/{id}")
	public String addCartReq(@PathVariable int id,Model m,HttpSession ss)
	{
		String username = (String) ss.getAttribute("username");
 		if(username == null)
 		{
 			return "redirect:/login.jsp";
 		}
 		
		Books ob = brepo.findById(id).get();
		m.addAttribute("book", ob);
		return "forward:/addToCart.jsp";
	}
	
	 	@Transactional
	    @RequestMapping("/addtocart")
	    public String addToCart(@RequestParam int id, @RequestParam int quantity, HttpSession session,Model m) {

	        Optional<Books> bookOpt = brepo.findById(id);
	        if (!bookOpt.isPresent()) {
	            return "redirect:/error.jsp";
	        }
	        Books book = bookOpt.get();
	        
	        
	        String username = (String) session.getAttribute("username");
	        User user = urepo.findByUsername(username);
	        
	        if (user == null) {
	            return "redirect:/login"; 
	        }

	        Cart cart = crepo.findByUser(user);
	        if (cart == null) {
	            cart = new Cart();
	            cart.setUser(user);
	            cart.setCartItems(new ArrayList<>());
	        }
	        
	        CartItem existingItem = cart.getCartItems().stream()
	            .filter(item -> item.getBookName().equals(book.getTitle()))
	            .findFirst()
	            .orElse(null);

	        int totalQuantity = (existingItem != null) ? existingItem.getQuantity() + quantity : quantity;

	        if (totalQuantity > book.getStock()) {
	            m.addAttribute("msg", "Please enter a quantity within the available stock. Available stock: " + book.getStock());
	            return "forward:/getBooks";
	        }
	        
	        if (existingItem != null) {
	        	existingItem.setPrice(book.getDiscountedPrice());
	            existingItem.setQuantity(existingItem.getQuantity() + quantity);
	            cirepo.save(existingItem);
	        } else {
	            CartItem newItem = new CartItem();
	            newItem.setBookName(book.getTitle());
	            newItem.setPrice(book.getDiscountedPrice());
	            newItem.setQuantity(quantity);
	            newItem.setCart(cart);
	            cart.getCartItems().add(newItem);
	            cirepo.save(newItem);
	        }
	        crepo.save(cart);
	        
	        return "/viewCart";
	    }
	 
	 	@RequestMapping("/viewCart")
	    public String viewCart(HttpSession session, Model model) {
	        String username = (String) session.getAttribute("username");
	        if (username == null) {
	            return "redirect:/login.jsp"; 
	        }
	        
	        User user = urepo.findByUsername(username);
	        if (user == null) {
	            return "redirect:/error.jsp";
	        }

	        Cart cart = crepo.findByUser(user);
	        if (cart != null) {
	            model.addAttribute("cart", cart);
	            model.addAttribute("message", "Cart is empty.");
	            return "cartView.jsp"; 
	        } else {
	            model.addAttribute("message", "Cart is empty.");
	            return "cartView.jsp"; 
	        }
	    }
	 	
	 	@RequestMapping("/removeItem/{id}")
	 	public String removeItem(@PathVariable int id)
	 	{
	 		cirepo.deleteById(id);
	 		return "redirect:/viewCart";
	 	}
	 	
	 	@RequestMapping("/changeQuan/{id}")
	 	public String changeQuantity(@PathVariable int id, @RequestParam int quantity)
	 	{
	 		CartItem ci = cirepo.findById(id).get();
	 		ci.setQuantity(quantity);
	 		cirepo.save(ci);
	 		return "redirect:/viewCart";
	 	}
	 
}
