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
@Table(name="tb_sign", uniqueConstraints = {@UniqueConstraint (columnNames = {"term", "nw", "uid"})})
public class Sign {

	private int id;
	private String term;
	private int nw;
	private int late;
	private int dayoff;
	private String totalTime;
	
	private String sun_am_in;
	private String sun_am_out;
	private String sun_pm_in;
	private String sun_pm_out;
	private String sun_eve_in;
	private String sun_eve_out;
	
	private String mon_am_in;
	private String mon_am_out;
	private String mon_pm_in;
	private String mon_pm_out;
	private String mon_eve_in;
	private String mon_eve_out;
	
	private String tues_am_in;
	private String tues_am_out;
	private String tues_pm_in;
	private String tues_pm_out;
	private String tues_eve_in;
	private String tues_eve_out;
	
	private String wed_am_in;
	private String wed_am_out;
	private String wed_pm_in;
	private String wed_pm_out;
	private String wed_eve_in;
	private String wed_eve_out;
	
	private String thur_am_in;
	private String thur_am_out;
	private String thur_pm_in;
	private String thur_pm_out;
	private String thur_eve_in;
	private String thur_eve_out;
	
	private String fri_am_in;
	private String fri_am_out;
	private String fri_pm_in;
	private String fri_pm_out;
	private String fri_eve_in;
	private String fri_eve_out;
	
	private String sat_am_in;
	private String sat_am_out;
	private String sat_pm_in;
	private String sat_pm_out;
	private String sat_eve_in;
	private String sat_eve_out;
	
	private int year;
	private int month;
	
	private String note;
	
	private int qualify;
	

	
	private String name;
	
	@Column(nullable=false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private User user;

	@ManyToOne
	@JoinColumn(name = "uid", nullable=false)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	@Id	//设置为主键。不要再属性上注解，破坏其封装，在getter上注解
	@Column(name = "sid")
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
//	@NotEmpty(message="学期不能为空")
	@Column(nullable=false)
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	
	@Column(nullable=false)
	//@NotEmpty(message = "周数不能为空")
	public int getNw() {
		return nw;
	}
	public void setNw(int nw) {
		this.nw = nw;
	}
	
	@Column(nullable=false)
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	
	@Column(nullable=false)
	public int getQualify() {
		return qualify;
	}
	public void setQualify(int qualify) {
		this.qualify = qualify;
	}
	
	@Column(nullable=false)
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	
	
	@Column(nullable=true)
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	@Column(nullable=false)
//	@NotEmpty(message = "迟到不能为空")
	//@Range(min=0,max=10,message="超出验证范围")  
	public int getLate() {
		return late;
	}
	public void setLate(int late) {
		this.late = late;
	}
	
	@Column(nullable=false)
//	@NotEmpty(message = "请假不能为空")
	//@Range(min=0, max=10, message="超出验证范围") 
	public int getDayoff() {
		return dayoff;
	}
	public void setDayoff(int dayoff) {
		this.dayoff = dayoff;
	}
	
	@Column(nullable=true) 
	public String getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}
	
	@Column(nullable=true)
	public String getTues_am_in() {
		return tues_am_in;
	}
	public void setTues_am_in(String tues_am_in) {
		this.tues_am_in = tues_am_in;
	}
	
	@Column(nullable=true)
	public String getTues_am_out() {
		return tues_am_out;
	}
	public void setTues_am_out(String tues_am_out) {
		this.tues_am_out = tues_am_out;
	}
	
	@Column(nullable=true)
	public String getTues_pm_in() {
		return tues_pm_in;
	}
	public void setTues_pm_in(String tues_pm_in) {
		this.tues_pm_in = tues_pm_in;
	}
	
	@Column(nullable=true)
	public String getTues_pm_out() {
		return tues_pm_out;
	}
	public void setTues_pm_out(String tues_pm_out) {
		this.tues_pm_out = tues_pm_out;
	}
	
	@Column(nullable=true)
	public String getTues_eve_in() {
		return tues_eve_in;
	}
	public void setTues_eve_in(String tues_eve_in) {
		this.tues_eve_in = tues_eve_in;
	}
	
	@Column(nullable=true)
	public String getTues_eve_out() {
		return tues_eve_out;
	}
	public void setTues_eve_out(String tues_eve_out) {
		this.tues_eve_out = tues_eve_out;
	}
	
	@Column(nullable=true)
	public String getWed_am_in() {
		return wed_am_in;
	}
	public void setWed_am_in(String wed_am_in) {
		this.wed_am_in = wed_am_in;
	}
	
	@Column(nullable=true)
	public String getWed_am_out() {
		return wed_am_out;
	}
	public void setWed_am_out(String wed_am_out) {
		this.wed_am_out = wed_am_out;
	}
	
	@Column(nullable=true)
	public String getWed_pm_in() {
		return wed_pm_in;
	}
	public void setWed_pm_in(String wed_pm_in) {
		this.wed_pm_in = wed_pm_in;
	}
	
	@Column(nullable=true)
	public String getWed_pm_out() {
		return wed_pm_out;
	}
	public void setWed_pm_out(String wed_pm_out) {
		this.wed_pm_out = wed_pm_out;
	}
	
	@Column(nullable=true)
	public String getWed_eve_in() {
		return wed_eve_in;
	}
	public void setWed_eve_in(String wed_eve_in) {
		this.wed_eve_in = wed_eve_in;
	}
	
	@Column(nullable=true)
	public String getWed_eve_out() {
		return wed_eve_out;
	}
	public void setWed_eve_out(String wed_eve_out) {
		this.wed_eve_out = wed_eve_out;
	}
	
	@Column(nullable=true)
	public String getThur_pm_in() {
		return thur_pm_in;
	}
	public void setThur_pm_in(String thur_pm_in) {
		this.thur_pm_in = thur_pm_in;
	}
	
	@Column(nullable=true)
	public String getThur_pm_out() {
		return thur_pm_out;
	}
	public void setThur_pm_out(String thur_pm_out) {
		this.thur_pm_out = thur_pm_out;
	}
	
	@Column(nullable=true)
	public String getThur_eve_in() {
		return thur_eve_in;
	}
	public void setThur_eve_in(String thur_eve_in) {
		this.thur_eve_in = thur_eve_in;
	}
	
	@Column(nullable=true)
	public String getThur_eve_out() {
		return thur_eve_out;
	}
	public void setThur_eve_out(String thur_eve_out) {
		this.thur_eve_out = thur_eve_out;
	}
	
	@Column(nullable=true)
	public String getSun_am_in() {
		return sun_am_in;
	}
	public void setSun_am_in(String sun_am_in) {
		this.sun_am_in = sun_am_in;
	}
	
	@Column(nullable=true)
	public String getSun_am_out() {
		return sun_am_out;
	}
	public void setSun_am_out(String sun_am_out) {
		this.sun_am_out = sun_am_out;
	}
	
	@Column(nullable=true)
	public String getSun_pm_in() {
		return sun_pm_in;
	}
	public void setSun_pm_in(String sun_pm_in) {
		this.sun_pm_in = sun_pm_in;
	}
	
	@Column(nullable=true)
	public String getSun_pm_out() {
		return sun_pm_out;
	}
	public void setSun_pm_out(String sun_pm_out) {
		this.sun_pm_out = sun_pm_out;
	}
	
	@Column(nullable=true)
	public String getSun_eve_in() {
		return sun_eve_in;
	}
	public void setSun_eve_in(String sun_eve_in) {
		this.sun_eve_in = sun_eve_in;
	}
	
	@Column(nullable=true)
	public String getSun_eve_out() {
		return sun_eve_out;
	}
	public void setSun_eve_out(String sun_eve_out) {
		this.sun_eve_out = sun_eve_out;
	}
	
	@Column(nullable=true)
	public String getMon_am_in() {
		return mon_am_in;
	}
	public void setMon_am_in(String mon_am_in) {
		this.mon_am_in = mon_am_in;
	}
	
	@Column(nullable=true)
	public String getMon_am_out() {
		return mon_am_out;
	}
	public void setMon_am_out(String mon_am_out) {
		this.mon_am_out = mon_am_out;
	}
	
	@Column(nullable=true)
	public String getMon_pm_in() {
		return mon_pm_in;
	}
	public void setMon_pm_in(String mon_pm_in) {
		this.mon_pm_in = mon_pm_in;
	}
	
	@Column(nullable=true)
	public String getMon_pm_out() {
		return mon_pm_out;
	}
	public void setMon_pm_out(String mon_pm_out) {
		this.mon_pm_out = mon_pm_out;
	}
	
	@Column(nullable=true)
	public String getMon_eve_in() {
		return mon_eve_in;
	}
	public void setMon_eve_in(String mon_eve_in) {
		this.mon_eve_in = mon_eve_in;
	}
	
	@Column(nullable=true)
	public String getMon_eve_out() {
		return mon_eve_out;
	}
	public void setMon_eve_out(String mon_eve_out) {
		this.mon_eve_out = mon_eve_out;
	}
	
	@Column(nullable=true)
	public String getThur_am_in() {
		return thur_am_in;
	}
	public void setThur_am_in(String thur_am_in) {
		this.thur_am_in = thur_am_in;
	}
	
	@Column(nullable=true)
	public String getThur_am_out() {
		return thur_am_out;
	}
	public void setThur_am_out(String thur_am_out) {
		this.thur_am_out = thur_am_out;
	}
	
	@Column(nullable=true)
	public String getFri_am_in() {
		return fri_am_in;
	}
	public void setFri_am_in(String fri_am_in) {
		this.fri_am_in = fri_am_in;
	}
	
	@Column(nullable=true)
	public String getFri_am_out() {
		return fri_am_out;
	}
	public void setFri_am_out(String fri_am_out) {
		this.fri_am_out = fri_am_out;
	}
	
	@Column(nullable=true)
	public String getFri_pm_in() {
		return fri_pm_in;
	}
	public void setFri_pm_in(String fri_pm_in) {
		this.fri_pm_in = fri_pm_in;
	}
	
	@Column(nullable=true)
	public String getFri_pm_out() {
		return fri_pm_out;
	}
	public void setFri_pm_out(String fri_pm_out) {
		this.fri_pm_out = fri_pm_out;
	}
	
	@Column(nullable=true)
	public String getFri_eve_in() {
		return fri_eve_in;
	}
	public void setFri_eve_in(String fri_eve_in) {
		this.fri_eve_in = fri_eve_in;
	}
	
	@Column(nullable=true)
	public String getFri_eve_out() {
		return fri_eve_out;
	}
	public void setFri_eve_out(String fri_eve_out) {
		this.fri_eve_out = fri_eve_out;
	}
	
	@Column(nullable=true)
	public String getSat_am_in() {
		return sat_am_in;
	}
	public void setSat_am_in(String sat_am_in) {
		this.sat_am_in = sat_am_in;
	}
	
	@Column(nullable=true)
	public String getSat_am_out() {
		return sat_am_out;
	}
	public void setSat_am_out(String sat_am_out) {
		this.sat_am_out = sat_am_out;
	}
	
	@Column(nullable=true)
	public String getSat_pm_in() {
		return sat_pm_in;
	}
	public void setSat_pm_in(String sat_pm_in) {
		this.sat_pm_in = sat_pm_in;
	}
	
	@Column(nullable=true)
	public String getSat_pm_out() {
		return sat_pm_out;
	}
	public void setSat_pm_out(String sat_pm_out) {
		this.sat_pm_out = sat_pm_out;
	}
	
	@Column(nullable=true)
	public String getSat_eve_in() {
		return sat_eve_in;
	}
	public void setSat_eve_in(String sat_eve_in) {
		this.sat_eve_in = sat_eve_in;
	}
	
	@Column(nullable=true)
	public String getSat_eve_out() {
		return sat_eve_out;
	}
	public void setSat_eve_out(String sat_eve_out) {
		this.sat_eve_out = sat_eve_out;
	}
	
	
	@Override
	public String toString() {
		return "Sign [id=" + id + ", term=" + term + ", nw=" + nw + ", late=" + late + ", dayoff=" + dayoff
				+ ", totalTime=" + totalTime + ", sun_am_in=" + sun_am_in + ", sun_am_out=" + sun_am_out
				+ ", sun_pm_in=" + sun_pm_in + ", sun_pm_out=" + sun_pm_out + ", sun_eve_in=" + sun_eve_in
				+ ", sun_eve_out=" + sun_eve_out + ", mon_am_in=" + mon_am_in + ", mon_am_out=" + mon_am_out
				+ ", mon_pm_in=" + mon_pm_in + ", mon_pm_out=" + mon_pm_out + ", mon_eve_in=" + mon_eve_in
				+ ", mon_eve_out=" + mon_eve_out + ", tues_am_in=" + tues_am_in + ", tues_am_out=" + tues_am_out
				+ ", tues_pm_in=" + tues_pm_in + ", tues_pm_out=" + tues_pm_out + ", tues_eve_in=" + tues_eve_in
				+ ", tues_eve_out=" + tues_eve_out + ", wed_am_in=" + wed_am_in + ", wed_am_out=" + wed_am_out
				+ ", wed_pm_in=" + wed_pm_in + ", wed_pm_out=" + wed_pm_out + ", wed_eve_in=" + wed_eve_in
				+ ", wed_eve_out=" + wed_eve_out + ", thur_am_in=" + thur_am_in + ", thur_am_out=" + thur_am_out
				+ ", thur_pm_in=" + thur_pm_in + ", thur_pm_out=" + thur_pm_out + ", thur_eve_in=" + thur_eve_in
				+ ", thur_eve_out=" + thur_eve_out + ", fri_am_in=" + fri_am_in + ", fri_am_out=" + fri_am_out
				+ ", fri_pm_in=" + fri_pm_in + ", fri_pm_out=" + fri_pm_out + ", fri_eve_in=" + fri_eve_in
				+ ", fri_eve_out=" + fri_eve_out + ", sat_am_in=" + sat_am_in + ", sat_am_out=" + sat_am_out
				+ ", sat_pm_in=" + sat_pm_in + ", sat_pm_out=" + sat_pm_out + ", sat_eve_in=" + sat_eve_in
				+ ", sat_eve_out=" + sat_eve_out + ", year=" + year + ", month=" + month + ", note=" + note
				+ ", qualify=" + qualify + ", name=" + name + ", user=" + user + "]";
	}

}
