package com.delta.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.delta.model.Books;
import com.delta.model.Cart;
import com.delta.model.CartItem;
import com.delta.model.Order;
import com.delta.model.OrderItem;
import com.delta.model.User;
import com.delta.repository.BookRepo;
import com.delta.repository.CartItemRepo;
import com.delta.repository.CartRepo;
import com.delta.repository.OrderItemRepo;
import com.delta.repository.OrderRepo;

@Controller
public class OrderController {


	@Autowired
	private CartItemRepo cirepo;
	@Autowired
	private BookRepo brepo;
	@Autowired
	private CartRepo crepo;
	@Autowired
	private OrderRepo orepo;
	
	@Autowired
	private OrderItemRepo oirepo;
	
	@RequestMapping("/order/{id}")
	public String order(@PathVariable int id,Model m,HttpSession ss)
	{
		Cart cart = crepo.findById(id).get();
		List<CartItem> al = cart.getCartItems();
		User ob = cart.getUser();
		double total = 0;
		for(CartItem ci : al)
		{
			total += ci.getPrice()*ci.getQuantity();
		}
		m.addAttribute("item", al);
		m.addAttribute("user",ob);
		m.addAttribute("totalPrice", total);
		
		ss.setAttribute("orduser", ob);
		ss.setAttribute("ordItem", al);
		ss.setAttribute("ordPrice", total);
		ss.setAttribute("cartId", id);
		
		return"forward:/PlaceOrder.jsp";
		
	}
	
	 @RequestMapping("/placeOrder")
	    public String placeOrder(Model m, HttpSession session,
	                             @RequestParam String deliveryAddress,
	                             @RequestParam(value = "transactionId", required = false) String transactionId,
	                             @RequestParam String paymentMode) {

	        User user = (User) session.getAttribute("orduser");
	        
	        List<CartItem> al = (List<CartItem>) session.getAttribute("ordItem");
	        double totalPrice = (double) session.getAttribute("ordPrice");
	        Cart cart = crepo.findById((Integer) session.getAttribute("cartId")).orElse(null);
	        System.out.println(cart);
	        System.out.println("User : " + user);
	        System.out.println("Price : " + totalPrice);
	        
	        if (paymentMode.equals("upi") && (transactionId == null || transactionId.isEmpty())) {
	            m.addAttribute("error", "Transaction ID is required for UPI payments.");
	            return "forward:/order/"+session.getAttribute("cartId");  
	        }
	        
	        Order o = new Order();
	        o.setUser(user);
	        o.setDeliveryAddress(deliveryAddress);
	        o.setOrderDate(new Date());
	        o.setPaymentMode(paymentMode);
	        o.setStatus("Order Placed");
	        o.setTotalPrice(totalPrice);
	        o.setTransactionId(paymentMode.equals("upi")?transactionId:"NA");
	        
	        for(CartItem ci : al)
	        {
	        	OrderItem oi = new OrderItem();
	        	oi.setOrder(o);
	        	oi.setBookName(ci.getBookName());
	        	oi.setPrice(ci.getPrice());
	        	oi.setQuantity(ci.getQuantity());
	        	
	        	Books bk = brepo.findByTitle(oi.getBookName());
	        	bk.setStock(bk.getStock()-oi.getQuantity());
	        	brepo.save(bk);
	        	
	        	o.getOrderItems().add(oi);
	        	
	        	
	        }
	        orepo.save(o);
	      
	        crepo.delete(cart);
	        
	        return "OrderSucess.jsp"; 
	    }
	 
	 @RequestMapping("/orderdetails")
	 public String fetchOrderhistory(HttpSession session, Model m)
	 {
		 User user = (User) session.getAttribute("userObj");
		 List<Order> order = orepo.findByUser(user);
		 m.addAttribute("details", order);
		 return "OrderHistory.jsp";
	 }
	 
	 @RequestMapping("/adminOrder")
	 public String adminViewOrder(Model m)
	 {
		 List<Order> orders = orepo.findAll();
		 m.addAttribute("orders", orders);
		 return "OrderAdmin.jsp";
	 }
	 
	 @RequestMapping("/updateStatus/{id}")
	 public String updateStatus(@PathVariable int id,@RequestParam String status)
	 {
		 Order ob = orepo.findById(id).orElse(null);
		 if(ob!=null)
		 {
			 ob.setStatus(status);
		 }
		 orepo.save(ob);
		 return "redirect:/adminOrder";
	 }
}
