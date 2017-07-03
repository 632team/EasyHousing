package com.easyhousing.dao;

import java.util.List;

import com.easyhousing.model.BuyHouseComment;

public interface BuyHouseCommentDao {
	
	public void insertBuyHouseComment(BuyHouseComment u);
	public int deleteBuyHouseComment(BuyHouseComment u);
	public int updateBuyHouseComment(BuyHouseComment u);
	public BuyHouseComment selectBuyHouseComment(BuyHouseComment u);
	public List<BuyHouseComment> selectAllByUserId(int id);
	public List<BuyHouseComment> selectAllByBuildingId(int id);
}
