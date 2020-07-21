package com.wr.dao;

import java.util.List;

import com.wr.model.Sign;
import com.wr.model.User;

public interface SignDao {

	public void addSign(Sign sign);
	
	public void deleteSign(Sign sign);
	
	public void updateSign(Sign sign);
}
