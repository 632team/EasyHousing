package com.easyhousing.dao;

import com.easyhousing.model.Community;

public interface CommunityDao {
	public void insertCommunity(Community u);
	public int deleteCommunity(Community u);
	public int updateCommunity(Community u);
	public Community selectCommunity(Community u);
}
