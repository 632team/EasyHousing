package com.easyhousing.service;

import java.util.List;

import com.easyhousing.model.BuildingInfo;
/**
 * 楼盘搜索服务
 */
public interface BuildingSearch {
	// 地址、最低价、最高价作为关键字获得对应的楼盘列表
	public List<BuildingInfo> searchBuilding(String Address, int lowPrice, int highPrice);
	public BuildingInfo searchBuildingById(int id);
}
