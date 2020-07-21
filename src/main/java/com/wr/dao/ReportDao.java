package com.wr.dao;

import java.util.List;
import java.util.Set;

import com.wr.model.Report;
import com.wr.model.User;

public interface ReportDao {
	
	public void addReport(Report report);
	
	public void deleteReport(Report report);
	
	public void updateReport(Report report);
	
}
