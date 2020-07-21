package com.wr.dao.impl;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wr.dao.ReportDao;
import com.wr.model.Report;



@Repository
public class ReportDaoImpl implements ReportDao{
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	

	@Override
	public void addReport(Report report) throws HibernateException{
		hibernateTemplate.save(report);// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReport(Report report) throws HibernateException{
		hibernateTemplate.delete(report);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateReport(Report report) throws HibernateException{
		hibernateTemplate.update(report);// TODO Auto-generated method stub
		
	}
	
	


//	@Override
//	public List<Report> getUserReport(User user) {
//		Set<Report> reports =  user.getReports();
//		// TODO Auto-generated method stub
//		List<Report> list = new ArrayList<Report>(reports);
//		return list;
//	}
//	
//	@Override
//	public List<Report>	getGroupReports(String term, int nw, String belong) {
//		String hql = "from Report report where term = ? and nw = ? and belong = ?";
//		List<Report> reports = (List<Report>) hibernateTemplate.find(hql, term, nw, belong);
//		return reports;
//	}

}
