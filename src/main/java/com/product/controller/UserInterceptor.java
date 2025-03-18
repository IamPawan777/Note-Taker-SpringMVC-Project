package com.product.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.product.dao.UserDao;
import com.product.entity.Notes;
import com.product.entity.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/")
public class UserInterceptor {
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping("/add_notes")
	public String showAddProduct() {
		return  "add_notes";
	}
	
	@RequestMapping("/edit")
	public String showEdit(@RequestParam("id") int id, Model model) {
		Notes n = userDao.getNotesById(id);
		model.addAttribute("notes", n);
		return  "edit";
	}
	
	@RequestMapping(path = "/update_notes", method = RequestMethod.POST)
	public String updateNotes(@ModelAttribute Notes n, HttpSession session) {
		User user = (User)session.getAttribute("userObj");
		n.setUser(user);
		n.setDate(LocalDateTime.now().toString());
		userDao.updateNotes(n);
		session.setAttribute("msg", "Notes Update successfully");
		return "redirect:/user/view_notes";
	}
	
	@RequestMapping("/view_notes")
	public String showViewProduct(Model model, HttpSession session) {
		User user = (User)session.getAttribute("userObj");
		List<Notes> notes = userDao.getNotesByUser(user);
		model.addAttribute("list", notes);
		return  "view_notes";
	}
	
	@RequestMapping("/logout")
	public String showLogout(HttpSession session) {
		session.removeAttribute("userObj");
		session.setAttribute("msg", "Logout Successfully");
		return "redirect:/login";
	}
	
	@RequestMapping(path = "/saveNotes", method = RequestMethod.POST)
	public String saveNotes(@ModelAttribute Notes notes, HttpSession session) {
		User user = (User)session.getAttribute("userObj");
		notes.setDate(LocalDateTime.now().toString());
		notes.setUser(user);
		userDao.saveNotes(notes);
		session.setAttribute("msg", "Notes added successfully");
		return "redirect:/user/add_notes";	
	}
	
	@RequestMapping("/deleteNotes")
	public String deleteNote(@RequestParam("id") int id, HttpSession session) { 
		userDao.deleteNotes(id);
		session.setAttribute("msg", "Delete Notes Successfully.");
		return "redirect:/user/view_notes";
	}
	
}
