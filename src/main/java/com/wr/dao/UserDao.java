package com.wr.dao;

import java.util.List;

import com.wr.model.User;

public interface UserDao {
	
	public void addUser(String username, String name, String password, String role, String belong);
	
	public void updateUser(User user);
	
	public void deleteUser(User user);
	
	public List<User> getAllUsers();

	public User getUserByUsername(String username);
	
	public List<User> getUserByBelong(String belong);
	
	public List<User> getGroupUser();
	
}
