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
	
	//������ҳ
	@RequestMapping(value="login.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login(User u) {
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.login(u);
		if (user == null) {
			modelAndView.addObject("message", "��¼ʧ�ܣ��˺Ż����������");
			modelAndView.setViewName("logIn");
		}
		else {
			modelAndView.addObject("message", "��¼�ɹ���");
			modelAndView.setViewName("logIn");
		}
		return modelAndView;
	}
}
