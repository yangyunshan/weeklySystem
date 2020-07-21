package com.wr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wr.dao.impl.HibernateCallBackCutePageImpl;
import com.wr.dao.impl.MeetingRecordImpl;
import com.wr.model.MeetingRecord;

@Transactional
@Service
public class MeetingRecordService {

	@Autowired
	HibernateCallBackCutePageImpl<MeetingRecord> hibernateCallBackCutePageImpl;
	
	@Autowired
	MeetingRecordImpl meetingRecordImpl;
	
	public List<MeetingRecord> meetingRecords(int firstResult, int offset){
		List<MeetingRecord> meetingRecords = meetingRecords(firstResult, offset);
		return meetingRecords;
	}
	
	public MeetingRecord getMeetingRecord(int mrid) {
		MeetingRecord meetingRecord = meetingRecordImpl.getMeetingRecord(mrid);
		return meetingRecord;
	}
	
	public List<MeetingRecord> getAllMeetingRecords(){
		List<MeetingRecord> meetingRecords = meetingRecordImpl.getMeetingRecords();
		return meetingRecords;
	}
	
	public List<MeetingRecord> getPageCuteMeetingRecords(int firstResult, int offset){
		List<MeetingRecord> meetingRecords = meetingRecordImpl.getPageCuteMeetingRecords(firstResult, offset);
		return meetingRecords;
	}
	
	public void addMeetingRecord(MeetingRecord meetingRecord) {
		meetingRecordImpl.addMeetingRecord(meetingRecord);
	}
	
	 public int getSumPage(int pagecut) {
		 int count = meetingRecordImpl.getRecordCount();
		 int sumPage = (count/pagecut) + 1;
		 return sumPage;
	 }
	 
	 public void deleteMeetingRecord(int mrid) {
		 MeetingRecord meetingRecord = meetingRecordImpl.getMeetingRecord(mrid);
		 meetingRecordImpl.deleteMeetingRecord(meetingRecord);
	 }
}
