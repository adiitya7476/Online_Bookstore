package com.delta.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Books {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String title;
	private String author;
	private String publisher;
	private String category;
	private int year;
	private double price;
	@Column(length = 2000)
	private String description;
	private int stock;
	
	private String imageUrl;
	
	private int discount = 0;
	
	
	
	
	
	public int getId() {
		return id;
	}





	public void setId(int id) {
		this.id = id;
	}





	public String getTitle() {
		return title;
	}





	public void setTitle(String title) {
		this.title = title;
	}





	public String getAuthor() {
		return author;
	}





	public void setAuthor(String author) {
		this.author = author;
	}





	public String getPublisher() {
		return publisher;
	}





	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}





	public String getCategory() {
		return category;
	}





	public void setCategory(String category) {
		this.category = category;
	}





	public int getYear() {
		return year;
	}





	public void setYear(int year) {
		this.year = year;
	}





	public double getPrice() {
		return price;
	}





	public void setPrice(double price) {
		this.price = price;
	}





	public String getDescription() {
		return description;
	}





	public void setDescription(String description) {
		this.description = description;
	}





	public int getStock() {
		return stock;
	}





	public void setStock(int stock) {
		this.stock = stock;
	}





	public String getImageUrl() {
		return imageUrl;
	}





	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}





	public int getDiscount() {
		return discount;
	}





	public void setDiscount(int discount) {
		this.discount = discount;
	}



	

	@Override
	public String toString() {
		return "Books [id=" + id + ", title=" + title + ", author=" + author + ", publisher=" + publisher
				+ ", category=" + category + ", year=" + year + ", price=" + price + ", description=" + description
				+ ", stock=" + stock + ", imageUrl=" + imageUrl + ", discount=" + discount + "]";
	}





	public Books(int id, String title, String author, String publisher, String category, int year, double price,
			String description, int stock, String imageUrl, int discount) {
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.category = category;
		this.year = year;
		this.price = price;
		this.description = description;
		this.stock = stock;
		this.imageUrl = imageUrl;
		this.discount = discount;
	}



	

	public Books() {
		super();
		// TODO Auto-generated constructor stub
	}





	public double getDiscountedPrice() {
        return price * (1 - (discount / 100.0));
    }
	
	
}
