package com.controller;

import java.util.ArrayList;
import java.util.Arrays;
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

import com.dao.OCCDao;
import com.entity.JudgeRating;
import com.entity.Report;
import com.entity.ReportDetails;
import com.entity.User;

@Controller
@RequestMapping("OCC")
public class OCCController {
	private int r_id;
	
	@Autowired
	private OCCDao occDao;
	
	//Show Home Page
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			return "OCCHome";
		}else {
			return "redirect:../index";
		}
		
	}
	
	//------------------------------------------------------------------------------------
	
	//Show incoming reports Page
	@RequestMapping(value = "/incomingReports", method = RequestMethod.GET)
	public String incomingReports(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			return "OCCIncomingReports";
		}else {
			return "redirect:../index";
		}
		
	}
	
	//List reports sent from authors
	@RequestMapping(value = "/authorReports", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> authorReportsList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ReportDetails> reportList = occDao.listAuthorReports();
		map.put("data", reportList);
		return map;
	}
	
	//Show handle report page
	@RequestMapping(value = "/handleReport", params="id", method = RequestMethod.GET)
	public String handleReportPage(@RequestParam(value = "id") int report_id, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			this.r_id = report_id; 
			return "OCCJudge";
		}else {
			return "redirect:../index";
		}
		
	}
	
	//Show details for one selected report 
	@RequestMapping(value = "/getReport", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> showReportDetails() {
		Map<String, Object> map = new HashMap<String, Object>();
		ReportDetails reportDetails = occDao.findReportById(this.r_id);
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
	
	//Show judges for one selected report
	@RequestMapping(value = "/getJudge", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> showJudges(ReportDetails reportDetails){
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> rTopics = new ArrayList<String>(Arrays.asList(reportDetails.getReport_topics().split(",")));
		List<User> judges = occDao.findeJudgesByRTopics(rTopics, reportDetails.getUser_id());
		map.put("data", judges);
		if(judges.size() < 3) {
			map.put("redirect", false);
			map.put("msg", "There is not enough judges to judge this report.");
		}else {
			map.put("redirect", true);
		}
		return map;
	}
	
	//Send reports to the related judges
	@RequestMapping(value = "/sendToJudge", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> doSendToJudge(@RequestParam(value="judges[]") List<Integer> judges, Report report){
		Map<String, Object> map = new HashMap<String, Object>();
		report.setReport_id(this.r_id);
		occDao.sendToJudges(judges, report);
		map.put("msg", "Report has been sent to judges successfully!");
		return map;
	}
	
	//Terminate the report
	@RequestMapping(value = "terminateReport", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> doTerminate(){
		Map<String, Object> map = new HashMap<String, Object>();
		occDao.doTerminateReport(this.r_id);
		return map;
	}
	
	//------------------------------------------------------------------------------------
	
	//Show reports sent to judge Page
	@RequestMapping(value = "/sentReports", method = RequestMethod.GET)
	public String sentReports(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			return "OCCSentReports";
		}else {
			return "redirect:../index";
		}
		
	}
	
	//List reports sent to judges
	@RequestMapping(value = "/judgeReports", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> judgeReportsList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ReportDetails> reportList = occDao.listSentToJudge();
		map.put("data", reportList);
		return map;
	}
	
	//Show rate for one report 
	@RequestMapping(value = "/getJudgesRate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> showJudgeRate(Report report) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<JudgeRating> opinionList = occDao.getOpinionList(report.getReport_id());
		map.put("data", opinionList);
		return map;
	}
	
	//Show rate report page
	@RequestMapping(value = "/rateReport", params="id", method = RequestMethod.GET)
	public String rateReportPage(@RequestParam(value = "id") int report_id, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			this.r_id = report_id;
			return "OCCRateReport";
		}else {
			return "redirect:../index";
		}
	}
	
	//Show result for one selected report 
	@RequestMapping(value = "/getReportResult", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> showReportResult() {
		Map<String, Object> map = new HashMap<String, Object>();
		ReportDetails reportDetails = occDao.findReportById(this.r_id);
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
	public @ResponseBody Map<String, Object> showOpinionDetails() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<JudgeRating> opinionList = occDao.getOpinionList(this.r_id);
		map.put("data", opinionList);
		return map;
		
	}
	
	//Save the final result for the report and send it to the user
	@RequestMapping(value = "/doRate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> doRateForReport(Report report){
		Map<String, Object> map = new HashMap<String, Object>();
		report.setReport_id(this.r_id);
		occDao.saveRateForReport(report);
		map.put("msg", "The result has been registered successfully!");
		return map;
	}
	
	//------------------------------------------------------------------------------------
	
	//Show Edit Profile Form Page
	@RequestMapping(value = "/editProfile", method = RequestMethod.GET)
	public String editProfileFrom(Model m, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			m.addAttribute("commandEdit", new User());
			return "OCCEditProfile";
		}else {
			return "redirect:../index";
		}
	}
	
	//Do Edit Profile
	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public String doEditProfile(@ModelAttribute("commandEdit") User user, Model m, HttpSession session) {
		int user_id = ((User) session.getAttribute("user")).getUser_id();
		user.setUser_id(user_id);
		occDao.updateOCC(user);
		return "redirect:home?act=up";
	}
}
