package com.easyhousing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.dao.RentHouseDao;
import com.easyhousing.model.RentHouse;
import com.easyhousing.model.User;
import com.easyhousing.service.UserService;

@Controller
public class AdminInit {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RentHouseDao rentHouseDao;
	

	@RequestMapping(value="managerUserinit.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView managerUserinit(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		List<User> userList = userService.selectAllUser();
		session.setAttribute("userList", userList);
		
		modelAndView.setViewName("SystemUser/managerUser");
		return modelAndView;
	}
	
	@RequestMapping(value="managerRentHouseinit.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView managerRentHouseinit(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		List<RentHouse> rentHouseList = rentHouseDao.selectAllRentHouse();
		session.setAttribute("rentHouseList", rentHouseList);
		
		modelAndView.setViewName("SystemUser/managerRent");
		return modelAndView;
	}
}
