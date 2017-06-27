package com.easyhousing.dao;

import com.easyhousing.model.Agent;

public interface AgentDao {
	public void insertAgent(Agent u);
	public int deleteAgent(Agent u);
	public int updateAgent(Agent u);
	public Agent selectAgent(Agent u);
}
