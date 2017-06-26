package com.easyhousing.dao;

import com.easyhousing.model.RentHousePic;

public interface RentHousePicDao {
	public void insertRentHousePic(RentHousePic u);
	public int deleteRentHousePic(RentHousePic u);
	public int updateRentHousePic(RentHousePic u);
	public RentHousePic selectRentHousePic(RentHousePic u);
}
