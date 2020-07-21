package com.wr.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wr.dao.SignDao;
import com.wr.model.Report;
import com.wr.model.Sign;
import com.wr.model.User;

@Repository
public class SignDaoImpl implements SignDao{

	@Autowired
	HibernateTemplate hibernateTemplate;

	@Override
	public void addSign(Sign sign) throws HibernateException {
		hibernateTemplate.save(sign);// TODO Auto-generated method stub
	}

	@Override
	public void deleteSign(Sign sign) throws HibernateException{
		hibernateTemplate.delete(sign);// TODO Auto-generated method stub
	}

	@Override
	public void updateSign(Sign sign) throws HibernateException{
		hibernateTemplate.update(sign);// TODO Auto-generated method stub
	}
			
	public List<Sign> getWeekSign(int nw, String term){
		String hql = "from Sign sign where nw = ? and term = ?";
		List<Sign> signs = (List<Sign>) hibernateTemplate.find(hql, nw, term);
		return signs;
	}
	
	public Sign getSignByName(int nw, String term, String name) {
		String hql = "from Sign sign where name = ? and nw = ? and term = ?";
		Sign sign = (Sign) hibernateTemplate.find(hql, name, nw, term);
		return sign;
	}
	
	public List<Sign> getMonthSign(int year, int month, String name){
		String hql = "from Sign sign where month = ? and year = ? and name = ?";
		List<Sign> signs = (List<Sign>) hibernateTemplate.find(hql, month, year, name);
		return signs ;
	}
	
	public List<Integer> getMonthNW(int year, int month) {
		String hql = "select nw from Sign sign where month = ? and year = ?";
		List<Integer> nws =  (List<Integer>) hibernateTemplate.find(hql, month, year);
		return nws;
	}
	
}
