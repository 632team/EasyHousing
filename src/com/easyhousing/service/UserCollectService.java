package com.easyhousing.service;

import java.util.List;

import com.easyhousing.model.*;

/**
 * 用户收藏相关服务
 */
public interface UserCollectService {
	public List<Collect> selectUserCollectRentHouse(User u);
	public List<Collect> selectUserCollectBuilding(User u);
}
