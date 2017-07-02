package com.easyhousing.dao;

import java.util.List;

import com.easyhousing.model.RentHouse_Characteristics;

public interface RentHouse_CharacteristicsDao {
	public void insertRentHouse_Characteristics(RentHouse_Characteristics u);
	public List<RentHouse_Characteristics> selectAllByUserId(int id);
}
