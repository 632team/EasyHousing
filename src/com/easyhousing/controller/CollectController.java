package com.easyhousing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.easyhousing.model.User;

@Controller
public class CollectController {
	

	@RequestMapping(value="collect.do", method={RequestMethod.GET,RequestMethod.POST})
	public void collect(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int rentHouseId = (Integer)session.getAttribute("rentHouseId");
		User user = (User)session.getAttribute("user");
		int userId = user.getUserId();
	}
}
