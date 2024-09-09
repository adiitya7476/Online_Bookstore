package com.delta.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {

	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
	private int id;
	private String first;
	private String last;
	
	@Column(unique = true, nullable = false)
	private String email;
	
	@Column(unique = true, nullable = false)
	private String username;
	@Column(nullable = false)
	private String password;
	

	private String number;
	private String address;
	
	
	//getter and setter starts

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirst() {
		return first;
	}

	public void setFirst(String first) {
		this.first = first;
	}

	public String getLast() {
		return last;
	}

	public void setLast(String last) {
		this.last = last;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}



	

	public User(int id, String first, String last, String email, String username, String password, String number,
			String address) {
		super();
		this.id = id;
		this.first = first;
		this.last = last;
		this.email = email;
		this.username = username;
		this.password = password;
		this.number = number;
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", first=" + first + ", last=" + last + ", email=" + email + ", username=" + username
				+ ", password=" + password + ", number=" + number + ", address=" + address + "]";
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}	
}
