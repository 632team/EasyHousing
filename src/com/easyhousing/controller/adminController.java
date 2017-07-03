package com.easyhousing.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.dao.AdministratorDao;
import com.easyhousing.model.Administrator;


@Controller
public class adminController {
	
	@Autowired
	private AdministratorDao administratorDao;
	
	@RequestMapping(value="adminLogin.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login(Administrator u, HttpSession httpSession) {
		ModelAndView modelAndView = new ModelAndView();
		if (u.getAdministratorName() == null && u.getAdministratorPassword() == null) {
			modelAndView.setViewName("logIn");
			return modelAndView;
		}
		Administrator adminuser = administratorDao.selectAdministrator(u);
		if (adminuser == null) {
			modelAndView.addObject("message", "登录失败，用户名或密码错误！");
			modelAndView.setViewName("logIn");
		}
		else {
			//modelAndView.addObject("message", ");
			httpSession.setAttribute("adminuser", adminuser);
			modelAndView.setViewName("SystemUser/homepage");
		}
		return modelAndView;
	}
}
