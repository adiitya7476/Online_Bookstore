package com.delta.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class OrderItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String bookName;

    private double price;

    private int quantity;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

	@Override
	public String toString() {
		return "OrderItem [id=" + id + ", bookName=" + bookName + ", price=" + price + ", quantity=" + quantity
				+ ", order=" + order + "]";
	}

	public OrderItem(int id, String bookName, double price, int quantity, Order order) {
		super();
		this.id = id;
		this.bookName = bookName;
		this.price = price;
		this.quantity = quantity;
		this.order = order;
	}

	public OrderItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
    
    
    
}
