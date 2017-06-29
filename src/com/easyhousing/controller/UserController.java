package com.easyhousing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.easyhousing.model.Register;
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
	
	@RequestMapping(value = "register.do", method={RequestMethod.GET,RequestMethod.POST}, produces = "text/html; charset=utf-8")
    public ModelAndView register(HttpServletRequest request, Register u) {
		ModelAndView modelAndView = new ModelAndView();
		
		String username = u.getUsername();
		String userPassword = u.getUserPassword();
		String confirmPassword = u.getConfirmPassword();
		
		modelAndView.addObject("username", username);
		modelAndView.addObject("userPassword", userPassword);
		modelAndView.addObject("confirmPassword", confirmPassword);
		modelAndView.addObject("registerValidateCode", u.getRegisterValidateCode());
		
		String correctValidateCode = (String)request.getSession().getAttribute("validateCode");
		if(!correctValidateCode.equals(u.getRegisterValidateCode())) {
			modelAndView.addObject("failuremessage", "验证码错误！");
			modelAndView.setViewName("register");
			return modelAndView;
		}
		
		if(username == null || username.length() < 5) {
			modelAndView.addObject("failuremessage", "用户名至少为五位！");
			modelAndView.setViewName("register");
			return modelAndView;
		}
		
		if(userPassword == null || confirmPassword == null) {
			modelAndView.addObject("failuremessage", "请输入密码！");
			modelAndView.setViewName("register");
			return modelAndView;
		}
		
		if(!userPassword.equals(confirmPassword)) {
			modelAndView.addObject("failuremessage", "密码不一致！");
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
		
		User nowu = new User();
		nowu.setUsername(u.getUsername());
		nowu.setUserPassword(u.getUserPassword());
		nowu.setUserPhoto("www.baidu.com");
		
		User user = userService.login(nowu);
		if (user == null) {
			userService.insertUser(nowu);
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
