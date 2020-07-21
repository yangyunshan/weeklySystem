package com.wr.dao.impl;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.apache.poi.ss.formula.functions.T;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wr.model.Notification;

@Repository
public class NotificationImpl {
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Autowired
	HibernateCallBackCutePageImpl<Notification> hibernateCallBackCutePageImpl;
	
	public void addNotification(Notification notification) throws HibernateException{
		hibernateTemplate.save(notification);
		
	}

	public void deleteNotification(Notification notification) throws HibernateException{
		hibernateTemplate.delete(notification);
		
	}
	
	public Notification getNotification(int id) {
//		String hql = "from Notification notification where notification.nid = ? ";
//		List<Notification> notification = (List<Notification>) hibernateTemplate.find(hql, id);
		Notification notification = hibernateTemplate.get(Notification.class, id);
		return notification;
	}
	
	public List<Notification> getNotifications() {
		String hql = "from Notification notification order by nid asc";
		List<Notification> notifications = (List<Notification>) hibernateTemplate.find(hql);
		return notifications;
	}
	
	public List<Notification> getCutePage(int firstResult, int offset){ 
		String hql="from Notification notification order by nid desc"; 
		hibernateCallBackCutePageImpl.init(hql, firstResult, offset);//该回调类对象已经通过Spring注入到当前测试类里面了。 
		List<Notification> results=hibernateTemplate.execute(hibernateCallBackCutePageImpl);
		return results; 
	}
	
	public Notification getFirstNotification(){ 
		String hql="from Notification notification order by nid desc";  
		List<Notification> results=(List<Notification>) hibernateTemplate.find(hql);
		Notification result = results.get(0);
		return result; 
	}
	
	public int getRecordCount() {
		String hql = "select count(*) from Notification notification";
		Number number = (Number)hibernateTemplate.find(hql).listIterator().next();
		return number.intValue();
	}
}
