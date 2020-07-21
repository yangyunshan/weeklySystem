package com.wr.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wr.service.UserService;
import com.wr.utils.SystemTime;

@Controller
@RequestMapping("/loginpage")
public class LoginController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String login() {
		return "Login";
	}
	
	@RequestMapping(value = "/validate.do", method = RequestMethod.POST)
	@ResponseBody
	public String loginValidate(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		System.out.println(request.getContextPath());
		boolean isTrue = userService.login(username, password);
		SystemTime.fresh();
		if (isTrue == true) {
			String role = userService.getUser(username).getRole();
			request.getSession().setAttribute("isLogin", "yes");
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("role", role);
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping(value = "/logout.do")
	public String logOut(HttpServletResponse response, HttpSession session) throws IOException {
		  session.invalidate();
		  return "redirect:/";
	}
	
}
 