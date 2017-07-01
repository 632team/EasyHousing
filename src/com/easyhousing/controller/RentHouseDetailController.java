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
import com.easyhousing.service.RentHousePicUrlService;
import com.easyhousing.service.RentHouseSearch;

@Controller
public class RentHouseDetailController {
	
	@Autowired
	private RentHouseSearch rentHouseSearch;
	
	@Autowired
	private RentHousePicUrlService rentHousePicUrlService;
	
	@RequestMapping(value="rentHouseDetail.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView rentHouseDetail(HttpServletRequest request) {
		Cookie[] cookie = request.getCookies();
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();
		int rentHouseId = 0;
		for(Cookie iCookie : cookie) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("rentHouseId")) {
				rentHouseId = Integer.parseInt(value);
			}
		}
		RentHouse rentHouse = rentHouseSearch.searchRentHouseById(rentHouseId);
		session.setAttribute("rentHouseId", rentHouseId);
		System.err.println(rentHouse.getRentHouseId());
		
		List<String> rentHousePicList = rentHousePicUrlService.searchRentHousePicByRentHouseId(rentHouseId);
		if(rentHousePicList == null) {
			System.err.println("ctbb");
		}
		else {
			System.err.println("????");
			for(String iString : rentHousePicList) {
				System.err.println(iString);
			}
		}
		session.setAttribute("rentHouse", rentHouse);
		session.setAttribute("rentHousePicList", rentHousePicList);
		modelAndView.setViewName("rentDetail");
		return modelAndView;
	}
}
