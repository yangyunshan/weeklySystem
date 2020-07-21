package com.wr.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wr.dao.impl.ReportDaoImpl;
import com.wr.dao.impl.UserDaoImpl;
import com.wr.model.Report;
import com.wr.model.User;
import com.wr.utils.SystemTime;

@Transactional
@Service
public class ReportService {
	
	@Autowired
	ReportDaoImpl reportDao;
	
	@Autowired
	UserDaoImpl userDao;
	
	//添加周报
	public void addReport(String sdate, String edate, String lplan, String done, String summary, String nplan, String lread, String nread, 
			String upload, String username,int qualify,
			int nw, String term, int year, int month) 
	{

		Report report = new Report();
		report.setDone(done);
		report.setEdate(edate);
		report.setLplan(lplan);
		report.setLread(lread);
		report.setNplan(nplan);
		report.setNread(nread);
		report.setNw(nw);
		report.setSdate(sdate);
		report.setSummary(summary);
		report.setTerm(term);
		report.setUpload(upload);
		report.setQualify(qualify);
		report.setYear(year);
		report.setMonth(month);
		User user = userDao.getUserByUsername(username);
		report.setUser(user);
		reportDao.addReport(report);
	}
	
	//更新周报
	//TODO
	public void updateReport(Report report) {
			reportDao.updateReport(report);
	}
	
	
	//删除周报
	public void deleteReport(String username, String term, int nw) throws IOException {
		Report report = getReport(username, term, nw);
		User user = userDao.getUserByUsername(username);
		user.getReports().remove(report);
		reportDao.deleteReport(report);
		String upload = report.getUpload();
		if (upload != null) {
			File file = new File(upload);
			FileUtils.deleteDirectory(file);
		}
	}
	
	//获取周报
	public Report getReport(String username, String term, int nw) {
		User user = userDao.getUserByUsername(username);
		Set<Report> set = user.getReports();
		List<Report> list = new ArrayList<Report>(set);
		Report report = new Report();
		for(Report rep:list) {
			if (rep.getTerm().equals(term) && rep.getNw() == nw) {
				report = rep;
			}
		}
		return report;
	}
	
	public Report getReportByName(String name, String term, int nw) {
		User user = userDao.getUserByName(name);
		Set<Report> set = user.getReports();
		List<Report> list = new ArrayList<Report>(set);
		Report report = new Report();
		for(Report rep:list) {
			if (rep.getTerm().equals(term) && rep.getNw() == nw) {
				report = rep;
			}
		}
		return report;
	}
	
	public List<Report> getReportByNameAndTerm(String name, String term){
		User user = userDao.getUserByName(name);
		Set<Report> set = user.getReports();
		List<Report> list = new ArrayList<Report>(set);
		List<Report> reports = new ArrayList<>();
		for(Report rep:list) {
			if (rep.getTerm().equals(term)) {
				reports.add(rep);
			}
		}
		return reports;
	}
	
	//获取一学期内用户的所有周报
	public List<Report> getReportsByTerm(String username, String term){
		User user = userDao.getUserByUsername(username);
		Set<Report> set = user.getReports();
		List<Report> list = new ArrayList<Report>(set);
		List<Report> reports = new ArrayList<Report>();
		for(Report rep:list) {
			if (rep.getTerm().equals(term)) {
				reports.add(rep);
			}
		}
		return reports;
	}
	
	//获取一周内组员的周报
	public List<Report> getWeekGroupReports(String term, int nw, String belong){
		List<User> users = userDao.getUserByBelong(belong);
		List<Report> reports = new ArrayList<>();
		for(User user:users) {
			List<Report> list = new ArrayList<Report>(user.getReports());
			for(Report report:list) {
				if (report.getTerm().equals(term) && report.getNw() == nw) {
					reports.add(report);
				}
			}
		}
		return reports;
	}
	
	//获取一周内所有人的周报
	public List<Report> getWeekAllReports(String term, int nw){
		List<User> users = userDao.getGroupUser();
		List<Report> reports = new ArrayList<Report>();
		for(User user:users) {
			List<Report> list = new ArrayList<Report>(user.getReports());
			for(Report report:list) {
				if (report.getTerm().equals(term) && report.getNw() == nw) {
					reports.add(report);
				}
			}
		}	
		return reports;
	}
	
	public void deleteReportByName(String name, String term, int nw) throws IOException {
		Report report = getReportByName(name, term, nw);
		User user = userDao.getUserByName(name);
		user.getReports().remove(report);
		reportDao.deleteReport(report);
		String upload = report.getUpload();
		if (upload != null) {
			File file = new File(upload);
			FileUtils.deleteDirectory(file);
		}
	}
	
	public String monthSummary() {
		return null;
	}

}
 