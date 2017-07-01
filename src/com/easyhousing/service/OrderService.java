package com.easyhousing.service;

import java.util.*;
import com.easyhousing.model.*;

public interface OrderService {
	public List<Order> selectAllBuildingByUserId(User u);
	public List<Order> selectAllRentHouseByUserId(User u);
}
