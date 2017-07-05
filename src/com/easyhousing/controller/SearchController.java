package com.easyhousing.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SearchController {
	
	@RequestMapping(value="globalSearch.do", method={RequestMethod.GET,RequestMethod.POST})
	public String search(HttpServletRequest request) {
		System.err.println(request.getParameter("which"));
		return "logIn";
	}
}
