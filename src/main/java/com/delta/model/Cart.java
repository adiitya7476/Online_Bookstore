package com.delta.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Cart {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToMany(mappedBy = "cart", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<CartItem> cartItems = new ArrayList<>();  

    @OneToOne
    @JoinColumn(name = "user_id")  
    private User user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cart(int id, List<CartItem> cartItems, User user) {
		super();
		this.id = id;
		this.cartItems = cartItems;
		this.user = user;
	}

	@Override
	public String toString() {
		return "Cart [id=" + id + ", cartItems=" + cartItems + ", user=" + user + "]";
	}
    
    
	 public void addCartItem(CartItem cartItem) {
	        cartItems.add(cartItem);
	        cartItem.setCart(this);
	    }
}
