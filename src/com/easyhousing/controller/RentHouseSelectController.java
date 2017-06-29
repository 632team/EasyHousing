package com.easyhousing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.model.RentHouse;
import com.easyhousing.service.RentHouseSearch;


@Controller
public class RentHouseSelectController {
	@Autowired
	private RentHouseSearch rentHouseSearch;
	
	@RequestMapping(value="rentHouseSelect.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView rentHouseSelect(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		String strAddress = (String)session.getAttribute("address");
		String strlowPrice = (String)session.getAttribute("lowPrice");
		String strhighPrice = (String)session.getAttribute("highPrice");
		String strlowRoomNum = (String)session.getAttribute("lowRoomNum");
		String strhighRoomNum = (String)session.getAttribute("highRoomNum");
		if(strAddress == null) {
			session.setAttribute("address", "");
		}
		if(strlowPrice == null) {
			session.setAttribute("lowPrice", "0");
		}
		if(strhighPrice == null) {
			session.setAttribute("highPrice", "1000000000");
		}
		if(strlowRoomNum == null) {
			session.setAttribute("lowRoomNum", "0");
		}
		if(strhighRoomNum == null) {
			session.setAttribute("highRoomNum", "1000000000");
		}
		String address = (String)session.getAttribute("address");
		int lowPrice = Integer.parseInt((String)session.getAttribute("lowPrice"));
		int highPrice = Integer.parseInt((String)session.getAttribute("highPrice"));
		int lowRoomNum = Integer.parseInt((String)session.getAttribute("lowRoomNum"));
		int highRoomNum = Integer.parseInt((String)session.getAttribute("highRoomNum"));
		List<RentHouse>list = rentHouseSearch.searchRentHouse(address, lowPrice, highPrice, lowRoomNum, highRoomNum);
		session.setAttribute("list", list);
		for(RentHouse i : list) {
			System.err.println(i.getRentHouseAddress());
		}
		modelAndView.setViewName("rentWindow");
		return modelAndView;
	}
		
}
