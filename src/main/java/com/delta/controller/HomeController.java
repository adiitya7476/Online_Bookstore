	package com.delta.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.delta.model.Books;
import com.delta.model.User;
import com.delta.repository.BookRepo;
import com.delta.repository.OrderRepo;
import com.delta.repository.UserRepo;

@Controller
public class HomeController {
	
	@Autowired
	private UserRepo urepo;
	
	@Autowired
	private BookRepo brepo;
	
	@Autowired
	private OrderRepo orepo;
	
	
	@RequestMapping("/")
	public String index()
	{
		return "index.jsp";
	}
	
	@RequestMapping("/register")
	public String register(@ModelAttribute User ob, Model m)
	{
		User present = urepo.findByUsername(ob.getUsername());
		if(present == null)
		{
			urepo.save(ob);
			m.addAttribute("done", "yes");
			return "login.jsp";
		}
		else
		{
			m.addAttribute("error", "Username already exists. Try another");
			return "register.jsp";
		}
	}
	@RequestMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, Model m, HttpServletRequest req)
	{
		if(username.equals("admin") && password.equals("admin"))
		{
			return "adminHome.jsp";
		}
		User ob = urepo.findByUsername(username);
		if(ob!=null && username.equals(ob.getUsername()) && password.equals(ob.getPassword()))
		{
			HttpSession session = req.getSession();
            session.setAttribute("user", ob.getFirst());
            session.setAttribute("username", ob.getUsername());
            session.setAttribute("userObj", ob);
			m.addAttribute("firstName",ob.getFirst());
			List<Books> al = brepo.findTopDiscountedBooks();
			m.addAttribute("discBook", al);
			return "userHome.jsp";
		}
		else
		{
			m.addAttribute("failed", true);
			return "login.jsp";
		}
	}
	@RequestMapping("/users")
	public String userFetch(Model m)
	{
		List<User> al = urepo.findAll();
		m.addAttribute("userData", al);
		return "users.jsp";
	}
	@RequestMapping("/data")
	public String data(Model m)
	{
		int ucount = urepo.countTotalUsers();
		int bookCount = brepo.countTotalBooks();
		long orderCount = orepo.count();
		long stock = brepo.getTotalStock();
		m.addAttribute("users",ucount);
		m.addAttribute("book", bookCount);
		m.addAttribute("orders", orderCount);
		m.addAttribute("stock", stock);
		return "dashboard.jsp";

	}
	
	@RequestMapping("{id}")
	public String userUpdate(@PathVariable int id, Model m)
	{
		User ob = urepo.getById(id);
		m.addAttribute("udata",ob);
		return "userUpdate.jsp";
	}
	@RequestMapping("/update")
	public String update(@ModelAttribute User ob, @RequestParam int id)
	{
		User user = urepo.findById(id).orElse(null);
		if(user!=null)
		{
			user.setFirst(ob.getFirst());
			user.setLast(ob.getLast());
			user.setEmail(ob.getEmail());
			user.setAddress(ob.getAddress());
			user.setUsername(ob.getUsername());
			user.setPassword(ob.getPassword());
			user.setNumber(ob.getNumber());
			
			urepo.save(user);
			
		}
		return "redirect:/users";
	}
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable int id)
	{
		urepo.deleteById(id);
		return "redirect:/users";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req )
	{
		HttpSession ss = req.getSession();
		ss.invalidate();
		return "login.jsp";
	}
	
	@RequestMapping("/withname")
	public String getfirstname(HttpServletRequest req, Model m)
	{
		HttpSession ss= req.getSession();
		List<Books> li = brepo.findTopDiscountedBooks();
		String uname = (String) ss.getAttribute("user");
		m.addAttribute("discBook", li);
		if(uname!=null) {
			m.addAttribute("firstName", uname);
		}
		return "forward:/userHome.jsp";
	}
}
