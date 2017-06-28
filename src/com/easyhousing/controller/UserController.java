package com.easyhousing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.model.User;
import com.easyhousing.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="login.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login(User u) {
		ModelAndView modelAndView = new ModelAndView();
		if (u.getUsername() == null && u.getUserPassword() == null) {
			modelAndView.setViewName("logIn");
			return modelAndView;
		}
		User user = userService.login(u);
		if (user == null) {
			modelAndView.addObject("message", "登录失败，用户名或密码错误！");
			modelAndView.setViewName("logIn");
		}
		else {
			//modelAndView.addObject("message", ");
			modelAndView.setViewName("logIn");
		}
		return modelAndView;
	}
	
	@RequestMapping(value="register.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView register(User u) {
		ModelAndView modelAndView = new ModelAndView();
		String username = u.getName();
		
		if(username == null || username.length() < 5) {
			modelAndView.addObject("failuremessage", "用户名至少为五位！");
			modelAndView.setViewName("register");
			return modelAndView;
		}
		
		boolean ok = true;
		for(int i = 0; i < username.length(); i++) {
			if(username.charAt(i) >= 'a' && username.charAt(i) <= 'z') continue;
			if(username.charAt(i) >= 'A' && username.charAt(i) <= 'Z') continue;
			if(username.charAt(i) >= '0' && username.charAt(i) <= '9') continue;
			ok = false; break;
		}
		if(!ok) {
			modelAndView.addObject("failuremessage", "密码只由大小字母及数字组成！");
			modelAndView.setViewName("register");
			return modelAndView;
		}
		
		User user = userService.login(u);
		if (user == null) {
			userService.insertUser(u);
			//modelAndView.addObject("successmessage", "注册成功！");
			modelAndView.setViewName("register");
			return modelAndView;
		}
		else {
			modelAndView.addObject("failuremessage", "注册失败，已存在用户名！");
			modelAndView.setViewName("register");
			return modelAndView;
		}
	}
	
	
}
