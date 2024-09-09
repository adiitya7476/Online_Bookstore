package com.delta.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.delta.model.Order;
import com.delta.model.User;

public interface OrderRepo extends JpaRepository<Order, Integer> {

	List<Order> findByUser(User user);
}
