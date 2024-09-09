package com.delta.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.delta.model.Books;
import com.delta.repository.BookRepo;

@Controller
public class BookController {

	 @PersistenceContext
	 private EntityManager entityManager;
	 
	@Autowired
	private BookRepo brepo;
	
	
	@Transactional
	@RequestMapping(value = "/addBook", method = RequestMethod.POST)
	public String addBook(
	        @RequestParam("title") String title,
	        @RequestParam("author") String author,
	        @RequestParam("category") String category,
	        @RequestParam("publisher") String publisher,
	        @RequestParam("year") int year,
	        @RequestParam("price") double price,
	        @RequestParam("description") String description,
	        @RequestParam("stock") int stock,
	        @RequestParam(value = "imageUrl", required = false) MultipartFile imageFile, // Handle image as MultipartFile
	        @RequestParam(value = "discount", defaultValue = "0") int discount,
	        RedirectAttributes redirectAttributes) {

	    try {
	        // Generate a unique filename
	        String fileName = UUID.randomUUID().toString() + "-" + imageFile.getOriginalFilename();
	        // Define the path to save the file
	        Path uploadDirPath = Paths.get("src/main/resources/static/images/");
	        Files.createDirectories(uploadDirPath); // Ensure the directory exists

	        // Define the file path
	        Path imageFilePath = uploadDirPath.resolve(fileName);

	        // Save the image to the directory using Files.copy
	        if (imageFile != null && !imageFile.isEmpty()) {
	            Files.copy(imageFile.getInputStream(), imageFilePath);
	        }

	        // Create a new book object
	        Books book = new Books();
	        book.setTitle(title);
	        book.setAuthor(author);
	        book.setCategory(category);
	        book.setPublisher(publisher);
	        book.setYear(year);
	        book.setPrice(price);
	        book.setDescription(description);
	        book.setStock(stock);

	        // Set image URL if provided
	        if (imageFile != null && !imageFile.isEmpty()) {
	            book.setImageUrl("/images/" + fileName); // Store the URL path
	        }

	        book.setDiscount(discount);

	        entityManager.persist(book);

	        return "redirect:/books";

	    } catch (IOException e) {
	        return "redirect:/books";
	    }
	}



	@RequestMapping("/books")
	public String fetch(Model m)
	{
		List<Books> al = brepo.findAll();
		m.addAttribute("bdata", al);
		return "viewBooks.jsp";
	}
	
	@RequestMapping("/upd")
    public String update(@RequestParam("id") int id, Model m) {
        Books ob = brepo.findById(id).orElse(null);
        m.addAttribute("books", ob);
        return "updateBook.jsp"; 
    }
	
	@Transactional
	@RequestMapping("/confirmUpdate")
	public String edit (
			@RequestParam("id") int id,
			@RequestParam("title") String title,
		    @RequestParam("author") String author,
		    @RequestParam("category") String category,
		    @RequestParam("publisher") String publisher,
		    @RequestParam("year") int year,
		    @RequestParam("price") double price,
		    @RequestParam("description") String description,
		    @RequestParam("stock") int stock,
		    @RequestParam(value = "imageUrl", required = false) MultipartFile imageFile, 
		    @RequestParam(value = "discount", defaultValue = "0") int discount,
		    RedirectAttributes redirectAttributes)
	{
		Books ob = brepo.findById(id).orElse(null);
		try {

			String fileName = UUID.randomUUID().toString() + "-" + imageFile.getOriginalFilename();

			Path uploadDirPath = Paths.get("src/main/resources/static/images/");
	        Files.createDirectories(uploadDirPath); 

	        Path imageFilePath = uploadDirPath.resolve(fileName);

	        if (imageFile != null && !imageFile.isEmpty()) {
	            Files.copy(imageFile.getInputStream(), imageFilePath);
	        }
	        
	        if(ob!=null)
			{
				ob.setAuthor(author);
				ob.setCategory(category);
				ob.setDescription(description);
				ob.setPrice(price);
				ob.setPublisher(publisher);
				ob.setStock(stock);
				ob.setTitle(title);
				ob.setYear(year);
				
				if (imageFile != null && !imageFile.isEmpty()) {
			            ob.setImageUrl("/images/" + fileName); // Store the URL path
			        }
				brepo.save(ob);
			}
		}catch (IOException e) {
	        return "redirect:/books";
	    }
		
		return "redirect:/books";
	}
	
	@RequestMapping("/delBook/{id}")
	public String delBook(@PathVariable int id)
	{
		brepo.deleteById(id);
		return "redirect:/books";
	}
	@RequestMapping("/getBooks")
	public String getBooks(Model m)
	{
		List<Books> al = brepo.findAll();
		m.addAttribute("books", al);
		return "fetchBooks.jsp";
	}
	
	@RequestMapping("/addDisc/{id}")
	public String addDiscount(@PathVariable("id") int id, @RequestParam("discount") int discount)
	{
		Books ob = brepo.findById(id).orElse(null);
		if(ob!=null)
		{
			ob.setDiscount(discount);
			brepo.save(ob);
		}
		
		return "redirect:/books";
	}
	
	@RequestMapping(value = "/viewSingleBook/{id}")
	public String viewSingleBook(@PathVariable("id") int id, Model model) {
	    Books ob = brepo.findById(id).orElse(null);
	    model.addAttribute("bk", ob);
	    return "forward:/viewSingle.jsp";
	   
	}

	@RequestMapping("/searchBooks")
	public String searchBooks(Model m, @RequestParam String category, @RequestParam String title)
	{
		if((title == null || title=="") && (category ==null || category ==""))
		{
			List<Books> ob = brepo.findAll();
			m.addAttribute("books", ob);
			return "fetchBooks.jsp";
		}
		else if((title != null || title!="") && (category ==null || category ==""))
		{
			List<Books> ob = brepo.findByTitleContainingIgnoreCase(title);
			m.addAttribute("books", ob);
			return "fetchBooks.jsp";
		}
		else if((title == null || title=="") && (category !=null || category !=""))
		{
			List<Books> ob = brepo.findByCategoryIgnoreCase(category);
			m.addAttribute("books", ob);
			return "fetchBooks.jsp";
		}
		else
		{
			List<Books> ob = brepo.findByTitleContainingIgnoreCaseOrCategoryIgnoreCase(title, category);
			m.addAttribute("books", ob);
			return "fetchBooks.jsp";
		}
	}

}
