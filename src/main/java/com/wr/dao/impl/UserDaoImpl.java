 package com.wr.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wr.dao.UserDao;
import com.wr.model.User;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	HibernateTemplate hibernateTemplate;

	//获取
	@Override
	public User getUserByUsername(String username) {
		String hql = "from User user where user.username=?";
		List<User> users = (List<User>) hibernateTemplate.find(hql, username);
		if (users.size() != 0) {
				return users.get(0);
			}else {
				return null;
				
		}
	}
		
	//更新
	@Override
	public void updateUser(User user) throws HibernateException{
		hibernateTemplate.update(user);
	}
		
	//删除
	@Override
	public void deleteUser(User user) {
		hibernateTemplate.delete(user);
	}
		
	//获取全部列表
	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUsers() {
		String hql = "from User user where user.role = ? or role = ? or role = ? or role = ?";
		return (List<User>) hibernateTemplate.find(hql,"groupmember", "groupleader", "teacher", "secretary");
	}
		
	//添加
	@Override
	public void addUser(String username, String name, String password, String role,String belong) {	
		User user = new User();
		user.setName(name);
		user.setPassword(password);
		user.setUsername(username);
		user.setRole(role);
		user.setBelong(belong);
		hibernateTemplate.save(user);
	}


	@Override
	public List<User> getUserByBelong(String belong) {
		String hql = "from User user where user.belong=?";
		List<User> users = (List<User>) hibernateTemplate.find(hql, belong);
		if (users.size() != 0) {
				return users;
			}else {
				return null;
		}
	}
	
	public List<User> getGroupUser() {
		String hql = "from User user where user.role = ? or role = ?";
		List<User> users = (List<User>) hibernateTemplate.find(hql, "groupleader", "groupmember");
		if (users.size() != 0) {
			return users;
		}else {
			return null;
	}
	}
	
	public User getUserByName(String name) {
		String hql = "from User user where user.name=?";
		List<User> users = (List<User>) hibernateTemplate.find(hql, name);
		if (users.size() != 0) {
				return users.get(0);
			}else {
				return null;
		}
	}
	
	public List<String> getGLNames() {
		String hql = "select name from User user where role = ?";
		List<String> names =  (List<String>) hibernateTemplate.find(hql,"groupleader");
		return names;
	}
	
	public List<String> getStudentsNames(){
		String hql = "select name from User user where role = ? or role = ?";
		List<String> names = (List<String>) hibernateTemplate.find(hql,"groupleader", "groupmember");
		return names;
	}
}