package com.delta.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.delta.model.CartItem;

public interface CartItemRepo extends JpaRepository<CartItem, Integer>{

}
