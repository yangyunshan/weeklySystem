package com.wr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wr.dao.impl.NotificationImpl;
import com.wr.model.Notification;

@Transactional
@Service
public class NotificationService {
	
	@Autowired
	NotificationImpl notificationImpl;
	
	//获取分页数据
	public List<Notification> getPageCuteNotification(int firstResult, int offset){
		List<Notification> notifications = notificationImpl.getCutePage(firstResult, offset);
		return notifications;
	}
	
	public List<Notification> getAllNotifications(){
		List<Notification> notifications = notificationImpl.getNotifications();
		return notifications;
	}
	
	public Notification getNotification(int nid) {
		Notification notification = notificationImpl.getNotification(nid);
		return notification;
	}
	
	 public void deleteNotification(int nid) {
		 Notification notification  = notificationImpl.getNotification(nid);
		 notificationImpl.deleteNotification(notification);
	 }
	
	 public void addNotification(Notification notification) {
		 notificationImpl.addNotification(notification);
	 }
	 
	 public int getSumPage(int pagecut) {
		 int count = notificationImpl.getRecordCount();
		 int sumPage = (count/pagecut) + 1;
		 return sumPage;
	 }
	 
	 public Notification getFirstNotification() {
		 Notification notification = notificationImpl.getFirstNotification();
		 return notification;
	 }

}
