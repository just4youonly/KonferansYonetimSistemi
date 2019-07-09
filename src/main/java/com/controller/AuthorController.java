package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.AuthorDao;
import com.entity.JudgeRating;
import com.entity.ReportDetails;
import com.entity.User;

@Controller
@RequestMapping("Author")
public class AuthorController {
	private int r_id;
	
	@Autowired
	private AuthorDao authorDao;
	
	//Show Home Page
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			return "AuthorHome";
		}else {
			return "redirect:../index";
		}
	}
	
	//------------------------------------------------------------------------------------
	
	//Show Add Report Form page
	@RequestMapping(value = "/addReport", method = RequestMethod.GET)
	public String addReportForm(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			return "AuthorAddReport";
		}else {
			return "redirect:../index";
		}
	}
	
	// Save the report for Author
	@RequestMapping(value="/saveReport", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> saveReport(ReportDetails reportDetails, HttpSession session) {
		int user_id = ((User) session.getAttribute("user")).getUser_id();
		Map<String, Object> map = new HashMap<String, Object>();
		if(user_id != 0) {
			reportDetails.setUser_id(user_id);
			authorDao.saveReport(reportDetails);
			map.put("msg","Your report has been successfully registered!");
			map.put("redirect", true);
			return map;
		}else {
			map.put("msg","Something went wrong please try again!");
			map.put("redirect", false);
			return map;
		}
			
	}
	
	//------------------------------------------------------------------------------------
	
	//Show My Reports Form Page
	@RequestMapping(value = "/myReports", method = RequestMethod.GET)
	public String myReportsForm(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			return "AuthorMyReports";
		}else {
			return "redirect:../index";
		}
	}
		
	//List my reports
	@RequestMapping(value = "/listReports", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> myReportsList(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		int user_id = ((User) session.getAttribute("user")).getUser_id();
		List<ReportDetails> reportList = authorDao.listReportsForUser(user_id);
		map.put("data", reportList);
		return map;
	}
	
	//Show result page for author
	@RequestMapping(value = "/showResult", params="id", method = RequestMethod.GET)
	public String rateReportPage(@RequestParam(value = "id") int report_id, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			this.r_id = report_id;
			return "AuthorResultDetails";
		}else {
			return "redirect:../index";
		}
	}
	
	//Show opinions for one selected report 
	@RequestMapping(value = "/getOpinion", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> showOpinionDetails() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<JudgeRating> opinionList = authorDao.getOpinionList(this.r_id);
		map.put("data", opinionList);
		return map;
	}
	
	//------------------------------------------------------------------------------------
	
	//Show Edit Profile Form Page
	@RequestMapping(value = "/editProfile", method = RequestMethod.GET)
	public String editProfileFrom(Model m, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			m.addAttribute("commandEdit", new User());
			return "AuthorEditProfile";
		}else {
			return "redirect:../index";
		}
	}
	
	//Do Edit Profile
	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public String doEditProfile(@ModelAttribute("commandEdit") User user, Model m, HttpSession session) {
		int user_id = ((User) session.getAttribute("user")).getUser_id();
		user.setUser_id(user_id);
		authorDao.updateAuthor(user);
		return "redirect:home?act=up";
	}
	
}
