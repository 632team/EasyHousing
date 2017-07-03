package com.easyhousing.dao;

import java.util.List;

import com.easyhousing.model.RentHouseComment;

public interface RentHouseCommentDao {
	public void insertRentHouseComment(RentHouseComment u);
	public int deleteRentHouseComment(RentHouseComment u);
	public int updateRentHouseComment(RentHouseComment u);
	public RentHouseComment selectRentHouseComment(RentHouseComment u);
	public List<RentHouseComment> selectAllByUserId(int id);
	public List<RentHouseComment> selectAllByRentHouseId(int id);
}
