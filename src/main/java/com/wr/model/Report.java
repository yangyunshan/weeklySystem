package com.wr.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="tb_report",uniqueConstraints = {@UniqueConstraint(columnNames = {"nw","uid", "term"})})
public class Report {
	
	private int id;
	private int nw;
	private String term;
	private String sdate;
	private String edate;
	private String lplan;
	private String done;
	private String summary;
	private String nplan;
	private String lread;
	private String nread;
	private String upload;
	private int qualify;
	private int year;
	private int month;
	private User user;
	
	
	@ManyToOne  
	@JoinColumn(name = "uid",nullable=false)  
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Id	//设置为主键。不要再属性上注解，破坏其封装，在getter上注解
	@Column(name = "rid")
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(nullable=false)
	//@NotEmpty(message = "周数不能为空")
	public int getNw() {
		return nw;
	}
	public void setNw(int nw) {
		this.nw = nw;
	}
	
	@Column(nullable=true)
	public int getQualify() {
		return qualify;
	}
	public void setQualify(int qualify) {
		this.qualify = qualify;
	}
	
	@Column(nullable=false)
//	@NotEmpty(message = "学期不能为空")
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}

	@Column(nullable=false)
//	@NotEmpty(message = "起始日期不能为空")
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	
	@Column(nullable=false)
//	@NotEmpty(message = "结束日期不能为空")
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	
	@Column(columnDefinition="TEXT",nullable=false)
//	@NotEmpty(message = "上周计划不能为空")
	public String getLplan() {
		return lplan;
	}
	public void setLplan(String lplan) {
		this.lplan = lplan;
	}

	@Column(columnDefinition="TEXT",nullable=false)
//	@NotEmpty(message = "本周完成不能为空")
	public String getDone() {
		return done;
	}
	public void setDone(String done) {
		this.done = done;
	}
	
	@Column(columnDefinition="MEDIUMTEXT")
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	@Column(columnDefinition="TEXT", nullable=false)
//	@NotEmpty(message = "下周计划不能为空")
	public String getNplan() {
		return nplan;
	}
	public void setNplan(String nplan) {
		this.nplan = nplan;
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
	@Column(columnDefinition="TEXT", nullable=false)
//	@NotEmpty(message = "上周阅读不能为空")
	public String getLread() {
		return lread;
	}
	public void setLread(String lread) {
		this.lread = lread;
	}
	
	@Column(columnDefinition="TEXT", nullable=false)
//	@NotEmpty(message = "下周阅读不能为空")
	public String getNread() {
		return nread;
	}
	public void setNread(String nread) {
		this.nread = nread;
	}
	
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload = upload;
	}
}
