package com.wr.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wr.model.MeetingRecord;
import com.wr.model.Notification;

@Repository
public class MeetingRecordImpl {
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Autowired
	HibernateCallBackCutePageImpl<MeetingRecord> hibernateCallBackCutePageImpl;
	
	public void addMeetingRecord(MeetingRecord meetingRecord) throws HibernateException{
		hibernateTemplate.save(meetingRecord);
		
	}

	public void deleteMeetingRecord(MeetingRecord meetingRecord) throws HibernateException{
		hibernateTemplate.delete(meetingRecord);
	}
	
	public MeetingRecord getMeetingRecord(int id) {
//		String hql = "from MeetingRecord meetingRecord where notification.mrid = ? ";
//		List<MeetingRecord> meetingRecord = (List<MeetingRecord>) hibernateTemplate.find(hql, id);
		MeetingRecord meetingRecord = hibernateTemplate.get(MeetingRecord.class, id);
		return meetingRecord;
		
	}
	
	public List<MeetingRecord> getMeetingRecords() {
		String hql = "from MeetingRecord meetingRecord order by mrid asc";
		List<MeetingRecord> meetingRecords = (List<MeetingRecord>) hibernateTemplate.find(hql);
		return meetingRecords;
	}
	
	public List<MeetingRecord> getPageCuteMeetingRecords(int firstResult, int offset){
		String hql = "from MeetingRecord meetingRecord order by mrid desc";
		hibernateCallBackCutePageImpl.init(hql, firstResult, offset);//该回调类对象已经通过Spring注入到当前测试类里面了。 
		List<MeetingRecord> results=hibernateTemplate.execute(hibernateCallBackCutePageImpl);
		return results; 
	}
	
	public int getRecordCount() {
		String hql = "select count(*) from  MeetingRecord as meetingrecord";
		Number count = (Number)hibernateTemplate.find(hql).listIterator().next();
		return count.intValue();
		
	}
}
