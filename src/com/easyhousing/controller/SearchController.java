package com.easyhousing.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.easyhousing.dao.BuildingPicDao;
import com.easyhousing.dao.RentHousePicDao;
import com.easyhousing.model.BuildingInfo;
import com.easyhousing.model.RentHouse;
import com.easyhousing.service.BuildingSearch;
import com.easyhousing.service.RentHouseSearch;
/**
 * 搜索框控制
 */
@Controller
public class SearchController {
	
	@Autowired
	private BuildingSearch buildingSearch;
	
	@Autowired
	private BuildingPicDao buildingPicDao;
	
	@Autowired
	private RentHouseSearch rentHouseSearch;
	
	@Autowired
	private RentHousePicDao rentHousePicDao;
	
	// 首页、租房、新房以及详情页面的搜索框控制
	@RequestMapping(value="globalSearch.do", method={RequestMethod.GET,RequestMethod.POST})
	public String search(HttpServletRequest request) {
		String tag = request.getParameter("which"); // 得到搜索标签，是租房还是新房
		String content = request.getParameter("content"); // 得到搜索内容
		HttpSession session = request.getSession();
		
		if (tag.equals("新房")) {
			session.setAttribute("buildingAddress", content);
			String strlowPrice = (String)session.getAttribute("buildingLowPrice"); // 最低价
			String strhighPrice = (String)session.getAttribute("buildingHighPrice"); // 最高价
			String strclass1 = (String)session.getAttribute("buildingClass1"); // 搜索类别，class1对应区域选择处
			String strclass2 = (String)session.getAttribute("buildingClass2"); // 搜索类别：class2对应价格点击区域
			
			// 非空判定
			if(strlowPrice == null) {
				session.setAttribute("buildingLowPrice", "0");
			}
			if(strhighPrice == null) {
				session.setAttribute("buildingHighPrice", "1000000000");
			}

			if(strclass1 == null) {
				session.setAttribute("buildingClass1", "0"); // 0对应页面的“不限”区域
			}
			if(strclass2 == null) {
				session.setAttribute("buildingClass2", "11"); // 11对应价格的“不限”区域
			}
			
			String address = (String)session.getAttribute("buildingAddress");
			int lowPrice = Integer.parseInt((String)session.getAttribute("buildingLowPrice"));
			int highPrice = Integer.parseInt((String)session.getAttribute("buildingHighPrice"));
			
			List<BuildingInfo>list = buildingSearch.searchBuilding(address, lowPrice, highPrice);
			
			List<String> buildingPicList = new ArrayList<>();
			// 获取每个房屋对应的第一个图片作为显示
			for (BuildingInfo i: list) {
				List<String> t = buildingPicDao.selectBuildingPicByBuildingId(i.getBuildingId());
				if (t.size() == 0) {
					buildingPicList.add("");
				}
				else {
					buildingPicList.add(t.get(0));
					System.err.println(t.get(0));
				}
			}
			session.setAttribute("buildingPicList", buildingPicList);
			
			session.setAttribute("buildingList", list);
			session.setAttribute("buildingSt", 0); // 房屋的遍历开始下标，用于分页
			session.setAttribute("buildingListSize", list.size()); // 房屋个数，用于分页结尾标记
			for(BuildingInfo i : list) {
				System.err.println(i.getBuildingAddress());
				System.err.println(list.size());
			}
			
			return "building";
		}
		
		session.setAttribute("address", content);
		String strlowPrice = (String)session.getAttribute("lowPrice");
		String strhighPrice = (String)session.getAttribute("highPrice");
		String strlowRoomNum = (String)session.getAttribute("lowRoomNum");
		String strhighRoomNum = (String)session.getAttribute("highRoomNum");
		String strclass1 = (String)session.getAttribute("class1");
		String strclass2 = (String)session.getAttribute("class2");
		String strclass3 = (String)session.getAttribute("class3"); // 对应选择居室个数区域

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
		if(strclass1 == null) {
			session.setAttribute("class1", "0");
		}
		if(strclass2 == null) {
			session.setAttribute("class2", "11");
		}
		if(strclass3 == null) {
			session.setAttribute("class3", "21"); // 21为居室数量“不限”
		}
		String address = (String)session.getAttribute("address");
		int lowPrice = Integer.parseInt((String)session.getAttribute("lowPrice"));
		int highPrice = Integer.parseInt((String)session.getAttribute("highPrice"));
		int lowRoomNum = Integer.parseInt((String)session.getAttribute("lowRoomNum"));
		int highRoomNum = Integer.parseInt((String)session.getAttribute("highRoomNum"));
		List<RentHouse>list = rentHouseSearch.searchRentHouse(address, lowPrice, highPrice, lowRoomNum, highRoomNum);
		
		// 获取每个房屋对应的第一个图片作为显示
		List<String> rentHousePicList = new ArrayList<>();
		for (RentHouse i : list) {
			List<String> t = rentHousePicDao.selectRentHousePicByRentHouseId(i.getRentHouseId());
			if (t.size() == 0) {
				rentHousePicList.add("");
			}
			else rentHousePicList.add(t.get(0));
		}
		session.setAttribute("rentHousePicList", rentHousePicList);
		
		session.setAttribute("list", list);
		session.setAttribute("st", 0); // 房屋的遍历开始下标，用于分页
		session.setAttribute("listSize", list.size()); // 房屋个数，用于分页结尾标记
		for(RentHouse i : list) {
			System.err.println(i.getRentHouseAddress());
			System.err.println(list.size());
		}
		
		return "rentWindow";
	}
	
	// 地图搜索模块
	@RequestMapping(value="mapSearch.do", method={RequestMethod.GET,RequestMethod.POST})
	public String mapSearch(HttpServletRequest request) {

		HttpSession session = request.getSession();
		
		String address = "";
		int lowPrice = 0;
		int highPrice = 100000000;
		
		List<BuildingInfo>list = buildingSearch.searchBuilding(address, lowPrice, highPrice);
		
		List<String> buildingPicList = new ArrayList<>();
		// 获取每个房屋对应的第一个图片作为显示
		for (BuildingInfo i: list) {
			List<String> t = buildingPicDao.selectBuildingPicByBuildingId(i.getBuildingId());
			if (t.size() == 0) {
				buildingPicList.add("");
			}
			else {
				buildingPicList.add(t.get(0));
				System.err.println(t.get(0));
			}
		}
		session.setAttribute("mapBuildingPicList", buildingPicList);
		session.setAttribute("mapBuildingList", list);
		for(BuildingInfo i : list) {
			System.err.println(i.getBuildingAddress());
			System.err.println(list.size());
		}
		
		// 租房
		int lowRoomNum = 0;
		int highRoomNum = 100000;
		List<RentHouse> rlist = rentHouseSearch.searchRentHouse(address, lowPrice, highPrice, lowRoomNum, highRoomNum);
		
		// 获取每个房屋对应的第一个图片作为显示
		List<String> rentHousePicList = new ArrayList<>();
		for (RentHouse i : rlist) {
			List<String> t = rentHousePicDao.selectRentHousePicByRentHouseId(i.getRentHouseId());
			if (t.size() == 0) {
				rentHousePicList.add("");
			}
			else rentHousePicList.add(t.get(0));
		}
		session.setAttribute("mapRentHousePicList", rentHousePicList);
		session.setAttribute("mapRentHouseList", rlist);
		for(RentHouse i : rlist) {
			System.err.println(i.getRentHouseAddress());
			System.err.println(list.size());
		}
		
		return "mapHouse";
	}
}
