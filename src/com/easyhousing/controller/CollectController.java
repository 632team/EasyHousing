package com.easyhousing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.model.User;
import com.easyhousing.service.RentHouseCollect;

@Controller
public class CollectController {
	
	@Autowired
	private RentHouseCollect rentHouseCollect;

	@RequestMapping(value="rentHouseCollect.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView collect(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		int rentHouseId = (Integer)session.getAttribute("rentHouseId");
		User user = (User)session.getAttribute("user");
		int userId = user.getUserId();
		rentHouseCollect.insert(userId, rentHouseId);
		session.setAttribute("haveRent", 1);
		modelAndView.setViewName("rentDetail");
		return modelAndView;
	}
	
	@RequestMapping(value="calcelRentHouseCollect.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView cancelCollect(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		int rentHouseId = (Integer)session.getAttribute("rentHouseId");
		User user = (User)session.getAttribute("user");
		int userId = user.getUserId();
		rentHouseCollect.delete(userId, rentHouseId);
		session.setAttribute("haveRent", 0);
		modelAndView.setViewName("rentDetail");
		return modelAndView;
	}
}
