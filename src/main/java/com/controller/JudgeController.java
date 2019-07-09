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

import com.dao.JudgeDao;
import com.entity.Fields;
import com.entity.JudgeRating;
import com.entity.ReportDetails;
import com.entity.Role;
import com.entity.User;

@Controller
@RequestMapping("Judge")
public class JudgeController {
	private int r_id;
	
	@Autowired
	private JudgeDao judgeDao;
	
	//Show Home Page
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			int user_id = ((User) session.getAttribute("user")).getUser_id();
			List<Fields> fieldList = judgeDao.getJudgeFields(user_id);
			if(fieldList.isEmpty()) {
				session.setAttribute("ctrl", true);
				return "JudgeHome";
			}else {
				session.setAttribute("ctrl", false);
				return "JudgeHome";
			}
		}else {
			return "redirect:../index";
		}
	}
	
	//------------------------------------------------------------------------------------
	
	//Show My Reports Page
	@RequestMapping(value = "/myReports", method = RequestMethod.GET)
	public String myReportsFrom(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			return "JudgeMyReports";
		}else {
			return "redirect:../index";
		}
	}
	
	//List my reports
	@RequestMapping(value = "/listReports", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> myReportsList(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		int user_id = ((User) session.getAttribute("user")).getUser_id();
		List<ReportDetails> reportList = judgeDao.listReportsForJudge(user_id);
		map.put("data", reportList);
		return map;
	}
	
	//Show set opinion page
	@RequestMapping(value = "/setOpinion", params="id", method = RequestMethod.GET)
	public String setOpinionPage(@RequestParam(value = "id") int report_id, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			this.r_id = report_id;
			return "JudgeReportDetails";
		}else {
			return "redirect:../index";
		}
		
	}
	
	//Show details for one selected report 
	@RequestMapping(value = "/getReport", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> showReportDetails() {
		Map<String, Object> map = new HashMap<String, Object>();
		ReportDetails reportDetails = judgeDao.findReportById(this.r_id);
		if(reportDetails != null) {
			map.put("data", reportDetails);
			map.put("redirect", true);
			return map;
		}else {
			map.put("msg", "Something went wrong please try again!");
			map.put("redirect", false);
			return map;
		}
	}
	
	//Show opinions for one selected report 
	@RequestMapping(value = "/getOpinion", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> showOpinionDetails(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		int user_id = 0;
		if(session.getAttribute("user") != null) {
			user_id = ((User) session.getAttribute("user")).getUser_id();
		}
		JudgeRating judgeRating = judgeDao.getOpinionForOneJudge(this.r_id, user_id);
		if(judgeRating != null) {
			map.put("redirect", true);
			map.put("data", judgeRating);
		}else {
			map.put("redirect", false);
		}
		return map;
	}
	
	//Send result to OCC
	@RequestMapping(value = "/sendRate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> sendRate(JudgeRating judgeRating, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		int user_id = 0;
		if(session.getAttribute("user") != null) {
			user_id = ((User) session.getAttribute("user")).getUser_id();
		}
		judgeRating.setUser_id(user_id);
		judgeRating.setReport_id(this.r_id);
		judgeDao.sendJudgeRate(judgeRating);
		map.put("msg", "Your Rating Has Been Saved Successfully");
		return map;
	}
	
	//------------------------------------------------------------------------------------

	//Show My Fields Page
	@RequestMapping(value = "/myFields", method = RequestMethod.GET)
	public String myFieldsFrom(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			return "JudgeMyFields";
		}else {
			return "redirect:../index";
		}
	}
	
	//Get Fields For Judge
	@RequestMapping(value = "/getJudgeFields", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getJudgeFields(HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		int user_id = ((User) session.getAttribute("user")).getUser_id();
		List<Fields> fieldList = judgeDao.getJudgeFields(user_id);
		map.put("data", fieldList);
		return map;
	}
	
	//Get All Fields
	@RequestMapping(value = "/getAllFields", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getAllFields(){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Fields> fieldList = judgeDao.getAllFields();
		map.put("data", fieldList);
		return map;
	}
	
	//Delete Field
	@RequestMapping(value = "/deleteField", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteField(Fields fields, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		int user_id = ((User) session.getAttribute("user")).getUser_id();
		judgeDao.deleteField(fields.getField_id(), user_id);
		map.put("msg", "Field deleted successfully!");
		return map;
	}
	
	//Add Field
	@RequestMapping(value = "/addField", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> addField(Fields fields, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		int user_id = ((User) session.getAttribute("user")).getUser_id();
		judgeDao.addField(fields.getField_id(), user_id);
		map.put("msg", "Field added successfully!");
		return map;
	}
	
	//Delete Field
	@RequestMapping(value = "/deleteRole", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteRole(HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		int user_id = ((User) session.getAttribute("user")).getUser_id();
		judgeDao.deleteRole(user_id);
		session.removeAttribute("role");
		return map;
	}
	
	//Add Field
	@RequestMapping(value = "/addRole", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> addRole(HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		int user_id = ((User) session.getAttribute("user")).getUser_id();
		judgeDao.addRole(user_id);
		Role role = new Role();
		role.setRole_id(3);
		role.setRole_name("Author");
		session.setAttribute("role", role);
		return map;
	}
	
	//------------------------------------------------------------------------------------
	
	//Show Edit Profile Form Page
	@RequestMapping(value = "/editProfile", method = RequestMethod.GET)
	public String editProfileFrom(Model m, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			m.addAttribute("commandEdit", new User());
			return "JudgeEditProfile";
		}else {
			return "redirect:../index";
		}
	}
	
	//Do Edit Profile
	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public String doEditProfile(@ModelAttribute("commandEdit") User user, Model m, HttpSession session) {
		int user_id = ((User) session.getAttribute("user")).getUser_id();
		user.setUser_id(user_id);
		judgeDao.updateJudge(user);
		return "redirect:home?act=up";
	}
	
}
