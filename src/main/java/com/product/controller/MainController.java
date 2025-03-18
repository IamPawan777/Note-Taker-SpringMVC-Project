package com.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.product.dao.UserDao;
import com.product.entity.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
		@Autowired
		private UserDao userDao;

		// first loding page
		@RequestMapping("/")
		public String showHome() {
			return "index";
		}
		
		@RequestMapping("/index")
		public String showIndex(Model model) {
			model.addAttribute("title", "Home Page");
			return "index";
		}
		
		@RequestMapping("/login")
		public String showLogin() {
			return "login";
		}
		
		@RequestMapping("/register")
		public String showRegister() {
			return "register";
		}
		
//		@RequestMapping("/add_notes")
//		public String showAddProduct() {
//			return  "add_notes";
//		}
//		
//		@RequestMapping("/edit")
//		public String showEdit() {
//			return  "edit";
//		}
//		
//		@RequestMapping("/view_notes")
//		public String showViewProduct() {
//			return  "view_notes";
//		}
		
		@RequestMapping(path = "/registerUser", method = RequestMethod.POST)
		public String registerUser(@ModelAttribute User user, HttpSession session){
			System.out.println(user);
			
			userDao.createUser(user);
			session.setAttribute("msg", "Register Successfully");
			
			return "redirect:/register";
		}
		
		@RequestMapping(path = "/loginUser", method = RequestMethod.POST)
		public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session) {
			User user = userDao.login(email, password);
			if(user != null) {
				session.setAttribute("userObj", user);
				return "redirect:/index";
			}
			else {
				session.setAttribute("msg", "Invalid Credential");
				return "redirect:/login";
			}
		}
		
		
		
		
		
		
}
