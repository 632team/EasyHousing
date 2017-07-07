package com.easyhousing.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.dao.BuyHouseCommentDao;
import com.easyhousing.dao.RentHouseCommentDao;
import com.easyhousing.dao.UserDao;
import com.easyhousing.model.BuildingInfo;
import com.easyhousing.model.BuyHouseComment;
import com.easyhousing.model.Collect;
import com.easyhousing.model.RentHouse;
import com.easyhousing.model.RentHouseComment;
import com.easyhousing.model.User;
import com.easyhousing.service.RentHouseCollect;
import com.easyhousing.service.RentHousePicUrlService;
import com.easyhousing.service.RentHouseSearch;

/**
 * 
 * @author 王辰辰
 * 租房详情显示
 */

@Controller
public class RentHouseDetailController {
	
	@Autowired
	private RentHouseSearch rentHouseSearch;
	
	@Autowired
	private RentHouseCollect rentHouseCollect;
	
	@Autowired
	private RentHousePicUrlService rentHousePicUrlService;
	
	@Autowired
	private RentHouseCommentDao rentHouseCommentDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private BuyHouseCommentDao buyHouseCommentDao;
	
	//租房初始化跳转，并3d显示图片
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
		if (rentHousePicList != null && rentHousePicList.size() != 0) {
			session.setAttribute("rentHousePic", rentHousePicList.get(0));
		}
		else {
			session.setAttribute("rentHousePic", "");
		}
		
		if(rentHousePicList == null) {
			System.err.println("ctbb");
		}
		else {
			System.err.println("????");
			for(String iString : rentHousePicList) {
				System.err.println(iString);
			}
		}
		User user = (User)session.getAttribute("user");
		int haveRent =  0;
		if(user != null)
			haveRent = rentHouseCollect.selectByUserIdRentHouseId(user.getUserId(), rentHouseId);
		if(user != null)
			System.err.println(user.getUserId());
		System.err.println(rentHouseId);
		System.err.println(haveRent);
		session.setAttribute("haveRent", haveRent);
		session.setAttribute("rentHouse", rentHouse);
		session.setAttribute("rentHousePicList", rentHousePicList);
		
		List<RentHouseComment> lr = rentHouseCommentDao.selectAllByRentHouseId(rentHouseId);
		List<Collect> lc = new ArrayList<>();
		for (RentHouseComment i : lr) {
			Collect tmp = new Collect();
			User u = new User();
			u.setUserId(i.getUserId());
			tmp.name = userDao.selectUserByUserId(u).getName();
			tmp.comment = i.getUserComment();
			tmp.picUrl = userDao.selectUserByUserId(u).getUserPhoto();
			tmp.decoration = i.getUserCommentDate().toString();
			lc.add(tmp);
		}
		session.setAttribute("rentHouseUserComments", lc);
		
		modelAndView.setViewName("rentDetail");
		return modelAndView;
	}
	
	//用户评论租房
	@RequestMapping(value="userCommentRentHouse.do", method={RequestMethod.GET,RequestMethod.POST})
	public String userCommentRentHouse(HttpSession s, RentHouseComment u) {
		u.setUserCommentDate(new Date());
		u.setUserId(((User)s.getAttribute("user")).getUserId());
	    u.setRentHouseId(((RentHouse)s.getAttribute("rentHouse")).getRentHouseId());
		rentHouseCommentDao.insertRentHouseComment(u);
		return "Comment/loading";
	}
	
	// 地图找房跳转
	@RequestMapping(value="mapRentHouseDetail.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView mapRentHouseDetail(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		int rentHouseId = Integer.parseInt(request.getParameter("rentHouseId"));
		HttpSession session = request.getSession();
		RentHouse rentHouse = rentHouseSearch.searchRentHouseById(rentHouseId);
		session.setAttribute("rentHouseId", rentHouseId);
		System.err.println(rentHouse.getRentHouseId());
		
		List<String> rentHousePicList = rentHousePicUrlService.searchRentHousePicByRentHouseId(rentHouseId);
		if (rentHousePicList != null && rentHousePicList.size() != 0) {
			session.setAttribute("rentHousePic", rentHousePicList.get(0));
		}
		else {
			session.setAttribute("rentHousePic", "");
		}
		
		if(rentHousePicList == null) {
			System.err.println("ctbb");
		}
		else {
			System.err.println("????");
			for(String iString : rentHousePicList) {
				System.err.println(iString);
			}
		}
		User user = (User)session.getAttribute("user");
		int haveRent =  0;
		if(user != null)
			haveRent = rentHouseCollect.selectByUserIdRentHouseId(user.getUserId(), rentHouseId);
		if(user != null)
			System.err.println(user.getUserId());
		System.err.println(rentHouseId);
		System.err.println(haveRent);
		session.setAttribute("haveRent", haveRent);
		session.setAttribute("rentHouse", rentHouse);
		session.setAttribute("rentHousePicList", rentHousePicList);
		
		List<RentHouseComment> lr = rentHouseCommentDao.selectAllByRentHouseId(rentHouseId);
		List<Collect> lc = new ArrayList<>();
		for (RentHouseComment i : lr) {
			Collect tmp = new Collect();
			User u = new User();
			u.setUserId(i.getUserId());
			tmp.name = userDao.selectUserByUserId(u).getName();
			tmp.comment = i.getUserComment();
			tmp.picUrl = userDao.selectUserByUserId(u).getUserPhoto();
			tmp.decoration = i.getUserCommentDate().toString();
			lc.add(tmp);
		}
		session.setAttribute("rentHouseUserComments", lc);
		
		modelAndView.setViewName("rentDetail");
		return modelAndView;
	}
}
