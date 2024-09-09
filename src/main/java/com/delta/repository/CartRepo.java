package com.delta.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.delta.model.Cart;
import com.delta.model.User;

public interface CartRepo extends JpaRepository<Cart, Integer> {

	Cart findByUser(User user);
}
