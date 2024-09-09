package com.delta.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.delta.model.User;
import java.util.List;


public interface UserRepo extends JpaRepository<User, Integer>{
	public User findByUsername(String username);
	
	@Query("SELECT COUNT(u) FROM User u")
	int countTotalUsers();

	
}
