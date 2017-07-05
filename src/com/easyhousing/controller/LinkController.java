package com.easyhousing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 
 * @author 王辰辰
 * 前期用于跳转的代码，已经不用了
 */

@Controller
public class LinkController {
	
	@RequestMapping(value="linkLogin.do", method={RequestMethod.GET,RequestMethod.POST})
	public String linkLogin() {
		return "logIn";
	}
	
	@RequestMapping(value="linkRegister.do", method={RequestMethod.GET,RequestMethod.POST})
	public String linkRegister() {
		return "register";
	}
	
	@RequestMapping(value="linkHomePage.do", method={RequestMethod.GET,RequestMethod.POST})
	public String linkHomePage() {
		return "homepage";
	}
	
	@RequestMapping(value="linkRentWindow.do", method={RequestMethod.GET,RequestMethod.POST})
	public String linkRentWindow() {
		return "rentWindow";
	}
	
}
