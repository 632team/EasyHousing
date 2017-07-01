package com.easyhousing.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.model.RentHouse;
import com.easyhousing.service.RentHouseSearch;

@Controller
public class RentHouseDetailController {
	
	@Autowired
	private RentHouseSearch rentHouseSearch;
	
	@RequestMapping(value="rentHouseDetail.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView rentHouseDetail(HttpServletRequest request) {
		Cookie[] cookie = request.getCookies();
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();
		List<RentHouse>list = (List<RentHouse>)session.getAttribute("list");
		int rentHouseId = -1;
		for(Cookie iCookie : cookie) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("rentHouseListId")) {
				rentHouseId = list.get(Integer.parseInt(value)).getRentHouseId();
			}
		}
		if(rentHouseId == -1) {
			rentHouseId = list.get(0).getRentHouseId();
		}
		RentHouse rentHouse = rentHouseSearch.searchRentHouseById(rentHouseId);
		session.setAttribute("rentHouse", rentHouse);
		modelAndView.setViewName("rentDetail");
		return modelAndView;
	}
}
