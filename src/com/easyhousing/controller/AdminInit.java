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
import com.easyhousing.dao.BuildingDealDao;
import com.easyhousing.dao.BuildingInfoDao;
import com.easyhousing.dao.BuildingPicDao;
import com.easyhousing.dao.RentHouseDao;
import com.easyhousing.dao.RentHouseDealDao;
import com.easyhousing.model.Agent;
import com.easyhousing.model.BuildingDeal;
import com.easyhousing.model.BuildingInfo;
import com.easyhousing.model.BuildingPic;
import com.easyhousing.model.RentHouse;
import com.easyhousing.model.RentHouseDeal;
import com.easyhousing.model.User;
import com.easyhousing.service.UserService;

/**
 * 
 * @author 王辰辰
 * 控制各个界面的跳转初始化
 */

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
	
	@Autowired
	private BuildingInfoDao buildingInfoDao;
	
	@Autowired
	private BuildingDealDao buildingDealDao;
	
	//主页面跳转
	@RequestMapping(value="homeinit.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView homeinit(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		//获取用户数量，租房数量，楼盘数量，租房成交数量
		List<User> userList = userService.selectAllUser();
		session.setAttribute("userListSize", userList.size());
		
		List<BuildingDeal> buildingDealList = buildingDealDao.selectAll();
		session.setAttribute("buildingDealListSize", buildingDealList.size());
		
		List<RentHouseDeal> rentHouseDealList = rentHouseDealDao.selectAll();
		session.setAttribute("rentHouseDealListSize", rentHouseDealList.size());
		
		List<RentHouse> rentHouseList = rentHouseDao.selectAllRentHouse();
		session.setAttribute("rentHouseListSize", rentHouseList.size());
		
		modelAndView.setViewName("SystemUser/home");
		return modelAndView;
	}

	//管理用户界面跳转
	@RequestMapping(value="managerUserinit.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView managerUserinit(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		List<User> userList = userService.selectAllUser();
		session.setAttribute("userList", userList);
		
		modelAndView.setViewName("SystemUser/managerUser");
		return modelAndView;
	}
	
	//获取租房界面跳转
	@RequestMapping(value="managerRentHouseinit.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView managerRentHouseinit(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		List<RentHouse> rentHouseList = rentHouseDao.selectAllRentHouse();
		session.setAttribute("rentHouseList", rentHouseList);
		
		modelAndView.setViewName("SystemUser/managerRent");
		return modelAndView;
	}
	
	@RequestMapping(value="managerCheckRentHouseinit.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView managerCheckRentHouseinit(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		List<RentHouse> rentHouseList = rentHouseDao.selectAllRentHouse();
		session.setAttribute("rentHouseList", rentHouseList);
		
		modelAndView.setViewName("SystemUser/managerCheck");
		return modelAndView;
	}
	
	//租房记录的管理跳转
	@RequestMapping(value="managerRentHouseDealinit.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView managerRentHouseDealinit(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		List<RentHouseDeal> rentHouseDealList = rentHouseDealDao.selectAll();
		session.setAttribute("rentHouseDealList", rentHouseDealList);
		
		modelAndView.setViewName("SystemUser/managerRentHistory");
		return modelAndView;
	}
	
	//经纪人管理跳转
	@RequestMapping(value="managerAgentinit.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView managerAgentlinit(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		List<Agent> agentList = agentDao.selectAll();
		session.setAttribute("agentList", agentList);
		
		modelAndView.setViewName("SystemUser/managerAgent");
		return modelAndView;
	}
	
	//楼盘图片跳转
	@RequestMapping(value="managerBuildingPicInit.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView managerBuildingPicInit(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		List<BuildingPic> buildingPicList = buildingPicDao.selectAll();
		session.setAttribute("buildingPicList", buildingPicList);
		
		modelAndView.setViewName("SystemUser/managerBuildingPic");
		return modelAndView;
	}
	
	//楼盘管理跳转
	@RequestMapping(value="managerBuildinginit.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView managerBuildingInit(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		List<BuildingInfo> buildingInfoList = buildingInfoDao.selectAll();
		session.setAttribute("buildingInfoList", buildingInfoList);
		System.err.println("ctbb1");
		for(BuildingInfo iBuildingInfo : buildingInfoList) {
			System.err.println("ctbb");
			System.err.println(iBuildingInfo.getBuildingAddress());
		}
		
		modelAndView.setViewName("SystemUser/managerBuilding");
		return modelAndView;
	}
	
	//楼盘交易记录跳转
	@RequestMapping(value="managerBuildingDealinit.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView managerBuildingDealinit(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		List<BuildingDeal> buildingDealList = buildingDealDao.selectAll();
		session.setAttribute("buildingDealList", buildingDealList);
		
		modelAndView.setViewName("SystemUser/managerBuildingHistory");
		return modelAndView;
	}
}
