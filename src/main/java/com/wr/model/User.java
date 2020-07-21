package com.wr.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity	//将当前bean设置为实体对象
@Table(name="tb_user", uniqueConstraints = {@UniqueConstraint(columnNames = "username"),@UniqueConstraint(columnNames = "name")} )	//设置数据库表名
public class User {

	private int id;
	private String username;
	private String role;
	private String name;
	private String password;
	private String belong;
	private Set<Report> reports;
	private Set<Sign> signs;
	private String email;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL,fetch = FetchType.EAGER)//急加载，因为获取set
	public Set<Sign> getSigns() {
		return signs;
	}

	public void setSigns(Set<Sign> signs) {
		this.signs = signs;
	}

	@OneToMany(mappedBy = "user",cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	public Set<Report> getReports() {
		return reports;
	}
	
	public void setReports(Set<Report> reports) {
		this.reports = reports;
	}

	@Id	//设置为主键。不要再属性上注解，破坏其封装，在getter上注解
	@Column(name = "uid")
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "belong", nullable=true)
	public String getBelong() {
		return belong;
	}
	public void setBelong(String belong) {
		this.belong = belong;
	}
	
	@Column(name = "username", nullable=false)
	//@Size(min = 3, max = 11, message ="用户名长度在3-11之间")
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	@Column(name = "role", nullable=false)
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	@Column(name = "name", nullable=false)
	//@Size(min = 1, max = 11, message ="请输入正确的姓名")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	@Column(nullable=true)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "password", nullable=false)
	//@Size(min = 6, message ="密码长度必须大于6")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
