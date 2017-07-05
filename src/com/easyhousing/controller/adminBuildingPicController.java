package com.easyhousing.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.dao.BuildingPicDao;
import com.easyhousing.model.BuildingPic;
import com.easyhousing.model.RentHousePic;
import com.easyhousing.model.User;
import com.easyhousing.util.Tool;

/**
 * 对楼盘图片的增删改查
 */

@Controller
public class adminBuildingPicController {
	
	@Autowired
	private BuildingPicDao buildingPicDao;

	//增加楼盘图片信息
	@RequestMapping(value = "adminAddBuildingPic.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminAddBuildingPic(HttpServletRequest request, BuildingPic buildingPic) throws IllegalStateException, IOException {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		//设置默认的图片地址
		buildingPic.setBuildingPicUrl("http://os8z6i0zb.bkt.clouddn.com/defaultPhoto.png");

		// 得到文件
		String path = request.getSession().getServletContext().getRealPath("upload");
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		Iterator iter = multiRequest.getFileNames();
		MultipartFile file = multiRequest.getFile(iter.next().toString());
		String fileName = file.getOriginalFilename();
		File dir = new File(path, fileName);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		try {
			
			// MultipartFile自带的解析方法
			file.transferTo(dir);
			
			String filePath = path + "\\" + fileName;
			System.err.println(filePath);
			String name = new Date().toInstant().toString();
			new Tool().upload(filePath, name);
			buildingPic.setBuildingPicUrl(String.valueOf("http://os8z6i0zb.bkt.clouddn.com/" + name));
		} catch (Exception e) {
			
		}
		//System.err.println(buildingPic.getBuildingPicType());
		//System.err.println(buildingPic.getBuildingId());
		//System.err.println(buildingPic.getBuildingPicUrl());
		
		//插入图片
		buildingPicDao.insertBuildingPic(buildingPic);
		
		//重新获取图片列表
		List<BuildingPic> buildingPicList = buildingPicDao.selectAll();
		session.setAttribute("buildingPicList", buildingPicList);
		
		modelAndView.setViewName("SystemUser/managerBuildingPic");
		return modelAndView;
	}
}
