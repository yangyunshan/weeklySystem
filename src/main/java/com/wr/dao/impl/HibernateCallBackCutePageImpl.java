package com.wr.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Component;

@Component
public class HibernateCallBackCutePageImpl<T> implements HibernateCallback<List<T>> {

	 private String hql; 
	 private int firstResult,offset; 
	 
	 public void setHql(String hql) { 
		 this.hql = hql; 
	} 
	 
	 public void setFirstResult(int firstResult) { 
		 this.firstResult = firstResult; 
	} 
	 
	 public void setOffset(int offset) { 
		 this.offset = offset; 
	}
	 public void init(String hql,int firstResult,int offset){ 
		 setHql(hql); 
		 setFirstResult(firstResult); 
		 setOffset(offset); 
	}

	 
	@Override
	public List<T> doInHibernate(Session session) throws HibernateException {
		Query<T> query=session.createQuery(hql); //给hql里面的绑定参数赋值 
		query.setFirstResult(firstResult).setMaxResults(offset); //第几条开始查起，查几条 
		return query.list(); 
		}
		

}
