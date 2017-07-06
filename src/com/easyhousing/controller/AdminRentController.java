package com.easyhousing.controller;

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

import com.easyhousing.dao.RentHouseDao;
import com.easyhousing.dao.RentHouseDealDao;
import com.easyhousing.model.RentHouse;
import com.easyhousing.model.RentHouseDeal;

/**
 * 
 * @author 王辰辰
 * 租房增删改查
 */
@Controller
public class AdminRentController {

	@Autowired
	private RentHouseDao rentHouseDao;
	
	@Autowired
	private RentHouseDealDao rentHouseDealDao;
	
	//增加租房信息
	@RequestMapping(value="adminAddRentHouse.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminAddRentHouse(@RequestParam(value ="inputPublishTime1") @DateTimeFormat(pattern="yyyy-MM-dd") Date inputPublishTime,HttpServletRequest request, RentHouse rentHouse) {
		
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		//设置表单时间
		rentHouse.setRentHousePublishTime(inputPublishTime);
		System.err.println(inputPublishTime);
		
		rentHouseDao.insertRentHouse(rentHouse);
		
		List<RentHouse> rentHouseList = rentHouseDao.selectAllRentHouse();
		session.setAttribute("rentHouseList", rentHouseList);
		
		modelAndView.setViewName("SystemUser/managerRent");
		return modelAndView;
	}
	
	//更新租房
	@RequestMapping(value="adminUpdateRentHouse.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminUpdateRentHouse(@RequestParam(value ="inputPublishTime") @DateTimeFormat(pattern="yyyy-MM-dd") Date inputPublishTime,HttpServletRequest request, RentHouse rentHouse) {
		
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		
		rentHouse.setRentHousePublishTime(inputPublishTime);
		//System.err.println(inputPublishTime);
		//获取更新id
		int updateRentHouseId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("updateRentHouseId")) {
				updateRentHouseId = Integer.parseInt(value);
			}
		}
		//System.err.println(updateRentHouseId);
		//更新
		rentHouse.setRentHouseId(updateRentHouseId);
		rentHouseDao.updateRentHouse(rentHouse);
		
		List<RentHouse> rentHouseList = rentHouseDao.selectAllRentHouse();
		session.setAttribute("rentHouseList", rentHouseList);
		
		modelAndView.setViewName("SystemUser/managerRent");
		return modelAndView;
	}
	//删除租房信息
	@RequestMapping(value="deleteRentHouseAjax.do", method={RequestMethod.GET,RequestMethod.POST})
	public void deleteRentHouseAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		int delRentHouseId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("delRentHouseId")) {
				delRentHouseId = Integer.parseInt(value);
			}
		}
		
		RentHouse rentHouse = new RentHouse();
		rentHouse.setRentHouseId(delRentHouseId);
		rentHouseDao.deleteRentHouse(rentHouse);
		
		System.err.println(delRentHouseId);
		
		List<RentHouse> rentHouseList = rentHouseDao.selectAllRentHouse();
		session.setAttribute("rentHouseList", rentHouseList);
		
	}
	//批量删除租房信息
	@RequestMapping(value="deleteRentHousePartAjax.do", method={RequestMethod.GET,RequestMethod.POST})
	public void deleteRentHousePartAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		String deleteRentHousePart = "";
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("deleteRentHousePart")) {
				deleteRentHousePart = value;
			}
		}
		System.err.println(deleteRentHousePart);
		String[] ids = deleteRentHousePart.split("\\.");
		
		RentHouse rentHouse = new RentHouse();
		
		for(String iString : ids) {
			if(iString == null) continue;
			if(iString == "") continue;
			System.err.println(iString);
			rentHouse.setRentHouseId(Integer.parseInt(iString));
			rentHouseDao.deleteRentHouse(rentHouse);
		}
	}
	
	@RequestMapping(value="adminAddRentHouseDeal.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminAddRentHouseDeal(@RequestParam(value ="inputTime") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,HttpServletRequest request, RentHouseDeal rentHouseDeal) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		rentHouseDeal.setRentTime(date);
		
		System.err.println("ctbb");
		System.err.println(date);
		System.err.println(rentHouseDeal.getRentHouseDay());
		System.err.println(rentHouseDeal.getRentTime());
		
		rentHouseDealDao.insertRentHouseDeal(rentHouseDeal);
		
		List<RentHouseDeal> rentHouseDealList = rentHouseDealDao.selectAll();
		session.setAttribute("rentHouseDealList", rentHouseDealList);
		
		modelAndView.setViewName("SystemUser/managerRentHistory");
		return modelAndView;
	}
	
	@RequestMapping(value="adminUpdateRentHouseDeal.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminUpdateRentHouseDeal(@RequestParam(value ="inputUpdateTime") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,HttpServletRequest request, RentHouseDeal rentHouseDeal) {
		
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		
		int updateRentId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("updateRentId")) {
				updateRentId = Integer.parseInt(value);
			}
		}
		System.err.println(updateRentId);
		rentHouseDeal.setRentId(updateRentId);
		rentHouseDeal.setRentTime(date);
		rentHouseDealDao.updateRentHouseDeal(rentHouseDeal);
		
		List<RentHouseDeal> rentHouseDealList = rentHouseDealDao.selectAll();
		session.setAttribute("rentHouseDealList", rentHouseDealList);
		
		modelAndView.setViewName("SystemUser/managerRentHistory");
		return modelAndView;
	}
	
	@RequestMapping(value="deleteRentHouseDealAjax.do", method={RequestMethod.GET,RequestMethod.POST})
	public void deleteRentHouseDealAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		int delRentId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("delRentId")) {
				delRentId = Integer.parseInt(value);
			}
		}
		
		RentHouseDeal rentHouseDeal = new RentHouseDeal();
		rentHouseDeal.setRentId(delRentId);
		rentHouseDealDao.deleteRentHouseDeal(rentHouseDeal);
		
		System.err.println(delRentId);
		
		List<RentHouseDeal> rentHouseDealList = rentHouseDealDao.selectAll();
		session.setAttribute("rentHouseDealList", rentHouseDealList);
		
	}
	
	@RequestMapping(value="deleteRentHouseDealPartAjax.do", method={RequestMethod.GET,RequestMethod.POST})
	public void deleteRentHouseDealPartAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		String deleteRentHouseDealPart = "";
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("deleteRentHouseDealPart")) {
				deleteRentHouseDealPart = value;
			}
		}
		System.err.println(deleteRentHouseDealPart);
		String[] ids = deleteRentHouseDealPart.split("\\.");
		
		RentHouseDeal rentHouseDeal = new RentHouseDeal();
		
		for(String iString : ids) {
			if(iString == null) continue;
			if(iString == "") continue;
			System.err.println(iString);
			rentHouseDeal.setRentId(Integer.parseInt(iString));
			rentHouseDealDao.deleteRentHouseDeal(rentHouseDeal);
		}
	}
	
	@RequestMapping(value="okRentHouseAjax.do", method={RequestMethod.GET,RequestMethod.POST})
	public void okRentHouseAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		int okRentHouseId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("okRentHouseId")) {
				okRentHouseId = Integer.parseInt(value);
			}
		}
		
		RentHouse rentHouse = rentHouseDao.selectRentHouseById(okRentHouseId);
		rentHouse.setRentHouseCheck(1);
		rentHouseDao.updateRentHouse(rentHouse);
		
		
		List<RentHouse> rentHouseList = rentHouseDao.selectAllRentHouse();
		session.setAttribute("rentHouseList", rentHouseList);
		
	}
	
	@RequestMapping(value="noRentHouseAjax.do", method={RequestMethod.GET,RequestMethod.POST})
	public void noRentHouseAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		int noRentHouseId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("noRentHouseId")) {
				noRentHouseId = Integer.parseInt(value);
			}
		}
		
		RentHouse rentHouse = rentHouseDao.selectRentHouseById(noRentHouseId);
		rentHouse.setRentHouseCheck(2);
		rentHouseDao.updateRentHouse(rentHouse);
		
		
		List<RentHouse> rentHouseList = rentHouseDao.selectAllRentHouse();
		session.setAttribute("rentHouseList", rentHouseList);
		
	}
}
