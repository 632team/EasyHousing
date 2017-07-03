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
import com.easyhousing.dao.UserDao;
import com.easyhousing.model.BuildingInfo;
import com.easyhousing.model.BuyHouseComment;
import com.easyhousing.model.Collect;
import com.easyhousing.model.User;
import com.easyhousing.service.BuildingSearch;

@Controller
public class buildingDetailController {
	
	@Autowired
	private BuildingSearch buildingSearch;
	
	@Autowired
	private BuyHouseCommentDao buyHouseCommentDao;
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value="buildingDetail.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView buildingDetail(HttpServletRequest request) {
		Cookie[] cookie = request.getCookies();
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();
		int buildingId = 0;
		for(Cookie iCookie : cookie) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("buildingId")) {
				buildingId = Integer.parseInt(value);
			}
		}
		BuildingInfo buildingInfo = buildingSearch.searchBuildingById(buildingId);
		session.setAttribute("buildingId", buildingId);
		System.err.println(buildingInfo.getBuildingId());
		

		User user = (User)session.getAttribute("user");

		if(user != null)
			System.err.println(user.getUserId());
		System.err.println(buildingId);

		session.setAttribute("buildingInfo", buildingInfo);
		
		List<BuyHouseComment> lb = buyHouseCommentDao.selectAllByBuildingId(buildingId);
		List<Collect> lc = new ArrayList<>();
		for (BuyHouseComment i : lb) {
			Collect tmp = new Collect();
			User u = new User();
			u.setUserId(i.getUserId());
			tmp.name = userDao.selectUserByUserId(u).getName();
			tmp.comment = i.getUserComment();
			tmp.picUrl = userDao.selectUserByUserId(u).getUserPhoto();
			tmp.decoration = i.getUserCommentDate().toString();
			lc.add(tmp);
		}
		session.setAttribute("buildingUserComments", lc);
		
		modelAndView.setViewName("buildingDetail");
		return modelAndView;
	}
	
	@RequestMapping(value="userCommentBuilding.do", method={RequestMethod.GET,RequestMethod.POST})
	public String userCommentBuilding(HttpSession s, BuyHouseComment u) {
		u.setUserCommentDate(new Date());
		u.setUserId(((User)s.getAttribute("user")).getUserId());
	    u.setBuildingId(((BuildingInfo)s.getAttribute("BuildingInfo")).getBuildingId());
		buyHouseCommentDao.insertBuyHouseComment(u);
		return "Comment/loading";
	}
}
