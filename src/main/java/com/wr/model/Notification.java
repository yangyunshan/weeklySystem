package com.wr.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity	//将当前bean设置为实体对象
@Table(name="tb_notification")
public class Notification {
	private int id;
	private int year;
	private int month;
	private int day;
	private String title;
	private String content;
	

	@Id	//设置为主键。不要再属性上注解，破坏其封装，在getter上注解
	@Column(name = "nid", nullable=false)
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(nullable=false)
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	
	@Column(nullable=false)
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	
	@Column(nullable=false)
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}

	@Column(columnDefinition="TEXT",nullable=false)
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Column(nullable=false)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	

}
