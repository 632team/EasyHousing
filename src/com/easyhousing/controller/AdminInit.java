package com.easyhousing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.dao.AgentDao;
import com.easyhousing.dao.BuildingPicDao;
import com.easyhousing.dao.RentHouseDao;
import com.easyhousing.dao.RentHouseDealDao;
import com.easyhousing.model.Agent;
import com.easyhousing.model.BuildingPic;
import com.easyhousing.model.RentHouse;
import com.easyhousing.model.RentHouseDeal;
import com.easyhousing.model.User;
import com.easyhousing.service.UserService;

@Controller
public class AdminInit {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RentHouseDao rentHouseDao;
	
	@Autowired
	private RentHouseDealDao rentHouseDealDao;
	
	@Autowired
	private AgentDao agentDao;
	
	@Autowired
	private BuildingPicDao buildingPicDao;

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
	
	@RequestMapping(value="managerRentHouseDealinit.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView managerRentHouseDealinit(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		List<RentHouseDeal> rentHouseDealList = rentHouseDealDao.selectAll();
		session.setAttribute("rentHouseDealList", rentHouseDealList);
		
		modelAndView.setViewName("SystemUser/managerRentHistory");
		return modelAndView;
	}
	
	@RequestMapping(value="managerAgentinit.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView managerAgentlinit(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		List<Agent> agentList = agentDao.selectAll();
		session.setAttribute("agentList", agentList);
		
		modelAndView.setViewName("SystemUser/managerAgent");
		return modelAndView;
	}
	@RequestMapping(value="managerBuildingPicInit.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView managerBuildingPicInit(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		List<BuildingPic> buildingPicList = buildingPicDao.selectAll();
		session.setAttribute("buildingPicList", buildingPicList);
		
		modelAndView.setViewName("SystemUser/managerBuildingPic");
		return modelAndView;
	}
}
