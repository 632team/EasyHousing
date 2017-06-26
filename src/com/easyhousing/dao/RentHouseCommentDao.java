package com.easyhousing.dao;

import com.easyhousing.model.RentHouseComment;

public interface RentHouseCommentDao {
	public void insertRentHouseComment(RentHouseComment u);
	public int deleteRentHouseComment(RentHouseComment u);
	public int updateRentHouseComment(RentHouseComment u);
	public RentHouseComment selectRentHouseComment(RentHouseComment u);
}
