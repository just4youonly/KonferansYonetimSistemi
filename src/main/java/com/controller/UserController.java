package com.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.UserDao;
import com.entity.Role;
import com.entity.User;

@Controller
public class UserController {

	@Autowired
	private UserDao userDao;
	
	//Home Page Mapping
	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public String index(Model m) {
		m.addAttribute("commandLogin", new User());
		return "index";
	}
	
	//------------------------------------------------------------------------------------
	
	//Login Page Handling
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginUser(@ModelAttribute("commandLogin") User user, Model model, HttpSession session) {
		int loggedRole_id = user.getRole_id();
		System.out.println(user.getUser_email());
		System.out.println(user.getUser_password());
		System.out.println(loggedRole_id);
		
		User u = userDao.loginUser(user);
		
		if(u == null) {
			model.addAttribute("err", "Login Failed! Please check your information.");
			System.out.println("Login Failed! Please check your information.");
			return "index";
		}else {
			return checkRole(model, loggedRole_id, u, session);
		}
	}
	
	//Check Which Page To Go To By Role Value
	public String checkRole(Model m, int loggedRole_id, User u, HttpSession session) {

		addUserSession(u, session);
		switch(loggedRole_id) {
			case 1:
				System.out.println("Logged in successfully!");
				return "redirect:OCC/home";
			case 2:
				Role role = userDao.checkUserRole(u, 3);
				if(role != null){
					session.setAttribute("role", role);
				}
				System.out.println("Logged in successfully!");
				return "redirect:Judge/home";
			case 3:
				Role role1 = userDao.checkUserRole(u, 2);
				if(role1 != null){
					session.setAttribute("role", role1);
				}
				System.out.println("Logged in successfully!");
				return "redirect:Author/home";
			default:
				System.out.println("Something went wrong, please try again!");
				return "index";
		}
	}
	
	private void addUserSession(User user, HttpSession session) {
		session.setAttribute("user", user);
	}
	
	//------------------------------------------------------------------------------------
	
	//Sign up Mapping
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signupForm(Model m) {
		m.addAttribute("commandSignup", new User());
		return "signup";
	}
	
	//Register Handling
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerUser(@ModelAttribute("commandSignup") User user, Model m){
		User u = userDao.findUserByEmail(user);
		if(u == null) {
			userDao.saveUser(user);
			return "redirect:index?act=reg";
		}else {
			m.addAttribute("err", "User already exists! Please check your email.");
			return "signup";
		}
	}
	
	//------------------------------------------------------------------------------------
	
	//Logout Mapping
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("role");
		session.invalidate();
		return "redirect:index?act=lo";
	}
}
