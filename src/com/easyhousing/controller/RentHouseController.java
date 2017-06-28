package com.easyhousing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RentHouseController {
	
	@RequestMapping(value="rentHouse.do", method={RequestMethod.GET,RequestMethod.POST})
	public String rentHouse() {
		return "rentWindow";
	}
}
