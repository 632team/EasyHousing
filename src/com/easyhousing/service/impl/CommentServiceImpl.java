package com.easyhousing.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyhousing.dao.BuildingInfoDao;
import com.easyhousing.dao.BuildingPicDao;
import com.easyhousing.dao.BuyHouseCommentDao;
import com.easyhousing.dao.RentHouseCommentDao;
import com.easyhousing.dao.RentHouseDao;
import com.easyhousing.dao.RentHousePicDao;
import com.easyhousing.model.BuildingInfo;
import com.easyhousing.model.BuyHouseComment;
import com.easyhousing.model.Collect;
import com.easyhousing.model.RentHouse;
import com.easyhousing.model.RentHouseComment;
import com.easyhousing.model.User;
import com.easyhousing.service.CommentService;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private RentHouseCommentDao rentHouseCommentDao;
	@Autowired
	private RentHouseDao rentHouseDao;
	@Autowired
	RentHousePicDao rentHousePicDao;
	
	@Autowired
	private BuyHouseCommentDao buyHouseCommentDao;
	@Autowired
	private BuildingInfoDao buildingInfoDao;
	@Autowired
	BuildingPicDao buildingPicDao;
	
	// Collect用于将对应ID对应的文字信息记录下来，便于网页的显示
	@Override
	public List<Collect> selectAllRentHouseCommentByUserId(User u) {
		List<RentHouseComment> li = rentHouseCommentDao.selectAllByUserId(u.getUserId());
		List<Collect> ret = new ArrayList<>();
		for (RentHouseComment i: li) {
			Collect c = new Collect();
			c.comment = i.getUserComment();
			c.commentId = i.getRentHouseCommentId();
			c.houseId = i.getRentHouseId();
			
			RentHouse rentHouse = rentHouseDao.selectRentHouseById(c.houseId);
			c.province = rentHouse.getRentHouseProvince();
			c.region = rentHouse.getRentHouseRegion();
			c.name = rentHouse.getRentHouseAddress();
			c.houseId = rentHouse.getRentHouseId();
			c.price = rentHouse.getRentHousePrice();
			c.room = rentHouse.getRentHouseRoom();
			List<String> lp = rentHousePicDao.selectRentHousePicByRentHouseId(c.houseId);
			if (lp.size() != 0)
				c.picUrl = lp.get(0);
			else c.picUrl = "";
			
			ret.add(c);
		}
		return ret;
	}
	
	// Collect用于将对应ID对应的文字信息记录下来，便于网页的显示
	@Override
	public List<Collect> selectAllBuildingCommentByUserId(User u) {
		List<BuyHouseComment> li = buyHouseCommentDao.selectAllByUserId(u.getUserId());
		List<Collect> ret = new ArrayList<>();
		for (BuyHouseComment i: li) {
			Collect c = new Collect();
			c.comment = i.getUserComment();
			c.commentId = i.getBuyHouseCommentId();
			c.houseId = i.getBuildingId();
			
			BuildingInfo bi = new BuildingInfo();
			bi.setBuildingId(i.getBuildingId());
			bi = buildingInfoDao.selectBuildingInfo(bi);
			
			c.decoration = bi.getBuildingDecoration();
			c.name = bi.getBuildingName();
			c.houseAddress = bi.getBuildingAddress();
			c.price = bi.getBuildingReferencePrice();
			List<String> lp = buildingPicDao.selectBuildingPicByBuildingId(c.houseId);
			if (lp.size() != 0)
				c.picUrl = lp.get(0);
			else c.picUrl = "";
			
			ret.add(c);
		}
		return ret;
	}

}
