package com.wr.service;

import java.util.List;

import javax.validation.constraints.Null;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wr.dao.impl.UserDaoImpl;
import com.wr.model.User;

@Transactional
@Service
public class UserService {
	
	@Autowired
	UserDaoImpl userDao;
	
	/**
	 * 获取用户
	 * 
	 */
	public User getUser(String username) {
		return userDao.getUserByUsername(username);
	}
	
	/**
	 * 登陆验证
	 * 
	 */
	public boolean login(String username, String password) {
		User user = userDao.getUserByUsername(username);
		if (user != null) {
			if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
				return true;
			} 	
		}
		return false;
	}
	
	/**
	 * 添加账户
	 * 
	 */
	public boolean addUser(String username, String name, String password, String role, String belong) {
		User user = userDao.getUserByUsername(username);
		if (user == null) {
			userDao.addUser(username, name, password, role, belong);
			return true;
		}else {
			return false;
		}
	}
	
	/**
	 * 更新账户
	 * 
	 */
	public void update(User user) {
		userDao.updateUser(user);
	}
	   
	/**
	 * 注销账户
	 * @return
	 */
	public void delete(String username) {
		User user = userDao.getUserByUsername(username);
		userDao.deleteUser(user);
	}
	
	/**
	 * 获取账户列表
	 * @return
	 */
	public List<User> getAllUser() {
		return userDao.getAllUsers();
	}
	
	public List<String> getGLNames(){
		List<String> names = userDao.getGLNames();
		return names;
	}
	
	public List<String> getStudentNames(){
		List<String> names = userDao.getStudentsNames();
		return names;
		
	}
	
	public User getUserByName(String name) {
		User user = userDao.getUserByName(name);
		return user;
	}
}
