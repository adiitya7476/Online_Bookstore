package com.delta.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.delta.model.Books;

public interface BookRepo extends JpaRepository<Books, Integer>{
	
	@Query("SELECT COUNT(b) FROM Books b")
	int countTotalBooks();
	
	@Query("SELECT b FROM Books b ORDER BY b.discount DESC")
	List<Books> findTopDiscountedBooks();
	
    @Query("SELECT SUM(b.stock) FROM Books b")
    Long getTotalStock();
    
    Books findByTitle(String title);
    
    List<Books> findByTitleContainingIgnoreCase(String title);
    
    List<Books> findByCategoryIgnoreCase(String category);
    
    List<Books> findByTitleContainingIgnoreCaseOrCategoryIgnoreCase(String title, String category);
    
}
