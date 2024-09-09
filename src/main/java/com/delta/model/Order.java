package com.delta.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "orders")
public class Order {

	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<OrderItem> orderItems = new ArrayList<>();
    
	@ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "order_date")
    private Date orderDate;
    
    private String deliveryAddress;
    
    private double totalPrice;
    
    private String paymentMode;
    
    private String status = "Order Placed";
    
    private String transactionId = "NA";

	@Override
	public String toString() {
		return "Order [id=" + id + ", user=" + user + ", cartItems=" + ", orderDate=" + orderDate
				+ ", deliveryAddress=" + deliveryAddress + ", totalPrice=" + totalPrice + ", paymentMode=" + paymentMode
				+ ", status=" + status + ", transactionId=" + transactionId + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public List<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(int id, User user, List<CartItem> cartItems, Date orderDate, String deliveryAddress, double totalPrice,
			String paymentMode, String status, String transactionId) {
		super();
		this.id = id;
		this.user = user;
		this.orderDate = orderDate;
		this.deliveryAddress = deliveryAddress;
		this.totalPrice = totalPrice;
		this.paymentMode = paymentMode;
		this.status = status;
		this.transactionId = transactionId;
	}
    
    
}
