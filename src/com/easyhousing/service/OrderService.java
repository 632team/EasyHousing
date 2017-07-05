package com.easyhousing.service;

import java.util.*;
import com.easyhousing.model.*;

/**
 * 预约申请相关服务
 */
public interface OrderService {
	public List<Order> selectAllBuildingByUserId(User u);
	public List<Order> selectAllRentHouseByUserId(User u);
}
