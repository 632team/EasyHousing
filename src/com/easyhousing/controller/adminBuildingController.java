package com.easyhousing.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.dao.BuildingDealDao;
import com.easyhousing.dao.BuildingInfoDao;
import com.easyhousing.model.BuildingDeal;
import com.easyhousing.model.BuildingInfo;
import com.easyhousing.model.RentHouse;


/**
 * 楼盘信息的增删改查，楼盘成交记录的增删改查
 */
@Controller
public class adminBuildingController {
	
	@Autowired
	private BuildingInfoDao buildingInfoDao;

	//增加楼盘信息 inputAddbuildingTimeHanded获取前端传来的时间
	@RequestMapping(value = "adminAddBuilding.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminAddBuilding(@RequestParam(value ="inputAddbuildingTimeHanded") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,HttpServletRequest request, BuildingInfo buildingInfo) throws IllegalStateException, IOException {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();

		//将时间设置进表单中
		buildingInfo.setBuildingTimeHanded(date);
		buildingInfoDao.insertBuildingInfo(buildingInfo);
		
		//重新获取楼盘列表
		List<BuildingInfo> buildingInfoList = buildingInfoDao.selectAll();
		session.setAttribute("buildingInfoList", buildingInfoList);
		
		modelAndView.setViewName("SystemUser/managerBuilding");
		return modelAndView;
	}
	
	//更新楼盘信息，inputUpdatebuildingTimeHanded获得时间
	@RequestMapping(value="adminUpdateBuilding.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminUpdateBuilding(@RequestParam(value ="inputUpdatebuildingTimeHanded") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,HttpServletRequest request, BuildingInfo buildingInfo) {
		
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		
		//设置表单时间
		buildingInfo.setBuildingTimeHanded(date);
		
		//获取要改变的楼盘id
		int updateBuildingId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("updateBuildingId")) {
				updateBuildingId = Integer.parseInt(value);
			}
		}
		
		//更改楼盘信息
		buildingInfo.setBuildingId(updateBuildingId);
		buildingInfoDao.updateBuildingInfo(buildingInfo);
		
		//重新获取楼盘信息
		List<BuildingInfo> buildingInfoList = buildingInfoDao.selectAll();
		session.setAttribute("buildingInfoList", buildingInfoList);
		
		modelAndView.setViewName("SystemUser/managerBuilding");
		return modelAndView;
	}
	
	//删除楼盘信息
	@RequestMapping(value="deleteBuildingAjax.do", method={RequestMethod.GET,RequestMethod.POST})
	public void deleteBuildingAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		
		//获取删除的楼盘id
		int deleteBuildingId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("deleteBuildingId")) {
				deleteBuildingId = Integer.parseInt(value);
			}
		}
		
		//删除要删除的楼盘信息
		BuildingInfo buildingInfo = new BuildingInfo();
		buildingInfo.setBuildingId(deleteBuildingId);
		buildingInfoDao.deleteBuildingInfo(buildingInfo);
		
		//重新获取楼盘列表
		List<BuildingInfo> buildingInfoList = buildingInfoDao.selectAll();
		session.setAttribute("buildingInfoList", buildingInfoList);
		
	}
	
	//删除选中的楼盘信息
	@RequestMapping(value="deleteBuildingPartAjax.do", method={RequestMethod.GET,RequestMethod.POST})
	public void deleteBuildingPartAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		
		//获取批量删除前端处理的字符
		String deleteBuildingPart = "";
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("deleteBuildingPart")) {
				deleteBuildingPart = value;
			}
		}
		
		//分解获得的字符
		System.err.println(deleteBuildingPart);
		String[] ids = deleteBuildingPart.split("\\.");
		
		BuildingInfo buildingInfo = new BuildingInfo();
		//删除
		for(String iString : ids) {
			if(iString == null) continue;
			if(iString == "") continue;
			System.err.println(iString);
			buildingInfo.setBuildingId(Integer.parseInt(iString));
			buildingInfoDao.deleteBuildingInfo(buildingInfo);
		}
	}
	
	@Autowired
	private BuildingDealDao buildingDealDao;
	
	//添加楼盘成交信息
	@RequestMapping(value = "adminAddBuildingDeal.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminAddBuildingDeal(@RequestParam(value ="addDealtime") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,HttpServletRequest request, BuildingDeal buildingDeal) throws IllegalStateException, IOException {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		//设置表单时间
		buildingDeal.setBuildingDealTime(date);
		buildingDealDao.insertBuildingDeal(buildingDeal);
		
		//更新楼盘信息列表
		List<BuildingDeal> buildingDealList = buildingDealDao.selectAll();
		session.setAttribute("buildingDealList", buildingDealList);
		
		modelAndView.setViewName("SystemUser/managerBuildingHistory");
		return modelAndView;
	}
	
	//更改楼盘成交信息
	@RequestMapping(value="adminUpdateBuildingDeal.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminUpdateBuildingDeal(@RequestParam(value ="updateDealtime") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,HttpServletRequest request, BuildingDeal buildingDeal) {
		
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		
		buildingDeal.setBuildingDealTime(date);
		
		//获取更新楼盘的id
		int updateBuildingDealId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("updateBuildingDealId")) {
				updateBuildingDealId = Integer.parseInt(value);
			}
		}
		
		//System.err.println(updateBuildingDealId);
		//更新
		
		buildingDeal.setBuildingDealId(updateBuildingDealId);
		buildingDealDao.updateBuildingDeal(buildingDeal);
		
		//更新楼盘信息列表
		List<BuildingDeal> buildingDealList = buildingDealDao.selectAll();
		session.setAttribute("buildingDealList", buildingDealList);
		
		modelAndView.setViewName("SystemUser/managerBuildingHistory");
		return modelAndView;
	}
	
	//删除楼盘成交信息
	@RequestMapping(value="deleteBuildingDealAjax.do", method={RequestMethod.GET,RequestMethod.POST})
	public void deleteBuildingDealAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		
		//获取删除的id
		int delBuildingDealId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("delBuildingDealId")) {
				delBuildingDealId = Integer.parseInt(value);
			}
		}
		
		//删除
		BuildingDeal buildingDeal = new BuildingDeal();
		buildingDeal.setBuildingDealId(delBuildingDealId);
		buildingDealDao.deleteBuildingDeal(buildingDeal);
		
		//System.err.println(delBuildingDealId);
		
		//更新楼盘信息列表
		List<BuildingDeal> buildingDealList = buildingDealDao.selectAll();
		session.setAttribute("buildingDealList", buildingDealList);
		
	}
	
	//删除批量楼盘成交信息
	@RequestMapping(value="deleteBuildingDealPartAjax.do", method={RequestMethod.GET,RequestMethod.POST})
	public void deleteBuildingDealPartAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		
		//获取删除的字符
		String deleteBuildingDealPart = "";
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("deleteBuildingDealPart")) {
				deleteBuildingDealPart = value;
			}
		}
		//System.err.println(deleteBuildingDealPart);
		//分割删除id
		String[] ids = deleteBuildingDealPart.split("\\.");
		
		BuildingDeal buildingDeal = new BuildingDeal();
		//删除
		for(String iString : ids) {
			if(iString == null) continue;
			if(iString == "") continue;
			System.err.println(iString);
			buildingDeal.setBuildingDealId(Integer.parseInt(iString));
			buildingDealDao.deleteBuildingDeal(buildingDeal);
		}
	}
	
}
