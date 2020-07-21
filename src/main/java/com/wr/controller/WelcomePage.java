package com.wr.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class WelcomePage {
	@RequestMapping(value = "")
	public String welcome(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		response.sendRedirect("loginpage");
		return "redirect:/loginpage";
	}
}
