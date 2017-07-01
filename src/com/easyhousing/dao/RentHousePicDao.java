package com.easyhousing.dao;

import java.util.List;

import com.easyhousing.model.RentHousePic;

public interface RentHousePicDao {
	public void insertRentHousePic(RentHousePic u);
	public int deleteRentHousePic(RentHousePic u);
	public int updateRentHousePic(RentHousePic u);
	public List<String> selectRentHousePicByRentHouseId(int id);
}
