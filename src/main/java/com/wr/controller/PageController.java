package com.wr.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.tomcat.util.http.RequestUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/page")
public class PageController {
	
	@RequestMapping(value = "/mainpage", method = RequestMethod.GET)
	public String mainDo(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "ErorrPage";
		}
		String role = (String) session.getAttribute("role");
		switch (role) {
		case "admin":
			return "redirect:admin";
			
		case "groupmember":
			return "redirect:gmember";
			
		case "groupleader":
			return "redirect:gleader";

		case "teacher":
			return "redirect:teacher";
		case "secretary":
			return "redirect:secretary";
		default:
			break;
		}
		return "ErorrPage";
			
	}
	
	@RequestMapping(value = "/gmember")
	public String group_member() {

		return "GroupMember";
	}
	
	@RequestMapping(value = "/gleader")
	public String group_leader() {

		return "GroupLeader";
	}
	
	@RequestMapping(value = "/teacher")
	public String teacher() {

		return "Boss";
	}
	
	@RequestMapping(value = "/admin")
	public String admin() {

		return "Admin";
	}
	
	@RequestMapping(value = "/secretary")
	public String secretary() {

		return "Secretary";
	}
	
	@RequestMapping(value = "/writereport")
	public String writereport() {
		return "WriteReport";  
	}
	
	@RequestMapping(value="/writesign")
	public String checksign() {
		return "WriteSign";
	}
	
	@RequestMapping(value = "/signcollect")
	public String signcollect() {
		return "SignCollect";
	}
	
	@RequestMapping(value = "/reportcollect")
	public String reportcollect() {
		return "RepCollect";
	}
	
	@RequestMapping(value = "/signinput")
	public String signinput() {
		return "SignInput";
	}
	
	@RequestMapping(value = "/usermanage")
	public String uesrmanager() {
		return "UserManage";
	}
	
	@RequestMapping(value = "/datamanage")
	public String datamanager() {
		return "DataManage";
	}
	
	@RequestMapping(value = "/changepw")
	public String changePW() {
		return "ChangePW";
	}
	
	@RequestMapping(value = "/systemcontrol")
	public String systemControl() {
		return "SystemControl";
	}
	
	@RequestMapping(value = "/reportsearch")
	public String reportSearch() {
		return "RepSearch";
	}
	
	@RequestMapping(value = "/reportreview")
	public String reportReview() {
		return "RepReview";
	}
	
	@RequestMapping(value = "/signreview")
	public String signReview() {
		return "SignReview";
	}
	
	@RequestMapping(value = "/summaryexport")
	public String summaryExport() {
		return "SummaryExport";
	}
	
	@RequestMapping(value = "/meetingrecord")
	public String meetingRecord() {
		return "MeetingRecord";
	}
	
	@RequestMapping(value = "/notification")
	public String notification() {
		return "Notification";
	}
	
	@RequestMapping(value = "/personalinfo")
	public String personalInfo() {
		return "PersonalInfo";
	}
	
	
}
