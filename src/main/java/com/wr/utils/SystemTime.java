package com.wr.utils;


import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class SystemTime {

	public static int start_NW_of_Term = 0;
	public static String term = null;
	public static int week = 0;
	public static int now_NW_of_Year = 0;
	private static Calendar cal ;
	
	//仅用做为会议记录和公告提供时间，与系统时间无关
	public static int year = 0;
	public static int month = 0;
	public static int day = 0;

	
	public static Boolean systemStatus = false;


	public static void start(String term, int start_NW_of_Term) {
		reset();
		Date date = new Date();
		SystemTime.term = term;
		SystemTime.start_NW_of_Term = start_NW_of_Term;
		
		SystemTime.cal = Calendar.getInstance();
		SystemTime.cal.setFirstDayOfWeek(Calendar.SUNDAY);
		SystemTime.cal.setTime(date);
		
		SystemTime.year = cal.get(Calendar.YEAR);
		SystemTime.month = cal.get(Calendar.MONTH) + 1;
		SystemTime.day = cal.get(Calendar.DAY_OF_MONTH);		
		SystemTime.week = cal.get(Calendar.DAY_OF_WEEK) - 1;
		SystemTime.now_NW_of_Year = cal.get(Calendar.WEEK_OF_YEAR);		
		SystemTime.systemStatus = true;

	}	
	
	
	
	public static void fresh() {
		
		if (SystemTime.systemStatus == false) {
			return;
		} else {
			Date date = new Date();
			cal.setTime(date);
			
			System.out.println(".............................................");
			
			
			SystemTime.month = cal.get(Calendar.MONTH) + 1;
			SystemTime.day = cal.get(Calendar.DAY_OF_MONTH);
			SystemTime.week = cal.get(Calendar.DAY_OF_WEEK) - 1;
			
			if (SystemTime.now_NW_of_Year < cal.get(Calendar.WEEK_OF_YEAR)) {
				int n = cal.get(Calendar.WEEK_OF_YEAR) - SystemTime.now_NW_of_Year;
				SystemTime.start_NW_of_Term += n;
				SystemTime.now_NW_of_Year = cal.get(Calendar.WEEK_OF_YEAR);
				SystemTime.year = cal.get(Calendar.YEAR);
			} 

			if (SystemTime.now_NW_of_Year > cal.get(Calendar.WEEK_OF_YEAR ) && SystemTime.year < cal.get(Calendar.YEAR)) {
				SystemTime.start_NW_of_Term = 52 - SystemTime.start_NW_of_Term + cal.get(Calendar.WEEK_OF_YEAR);
				SystemTime.now_NW_of_Year = cal.get(Calendar.WEEK_OF_YEAR);
				SystemTime.year = cal.get(Calendar.YEAR);
			}

			if (SystemTime.start_NW_of_Term > 25) {
				reset();
			}

		}
	}
	
	
	private static void reset() {
		start_NW_of_Term = 0;
	 	term = null;
		week = 0;
		now_NW_of_Year = 0;
		year = 0;
		day = 0;
		month = 0;
	}
	
	
//	public static void main(String[] args) {
//		SystemTime.start("2019上半年", 1);
//		System.out.println(SystemTime.now_NW_of_Year+" "+SystemTime.start_NW_of_Term);
//		
//		SystemTime.now_NW_of_Year = 1;
//		SystemTime.fresh();
//		System.out.println(SystemTime.now_NW_of_Year+" "+SystemTime.start_NW_of_Term);
//	}
	
	public static void main(String[] args) {
		
		
//
//		int nw_of_term = 12;
//		int nw_of_year = 0;
//
//		Calendar calendar = Calendar.getInstance();
//		calendar.set(2018, 11, 20);
//		nw_of_year = calendar.get(Calendar.WEEK_OF_YEAR);
//		
//		System.out.println("nw_of_term:" + nw_of_term);
//		System.out.println("WEEK_OF_YEAR:" + calendar.get(Calendar.WEEK_OF_YEAR));
//		System.out.println(".............................................");
//		
//		calendar.set(2018, 11, 22);
//		
//		
//		if (nw_of_year < calendar.get(Calendar.WEEK_OF_YEAR)) {
//			int n = calendar.get(Calendar.WEEK_OF_YEAR) - nw_of_year;
//			nw_of_term += n;
//			nw_of_year = calendar.get(Calendar.WEEK_OF_YEAR);
//
//		} 
//
//		if (nw_of_year > calendar.get(Calendar.WEEK_OF_YEAR ) && nw_of_year < calendar.get(Calendar.YEAR)) {
//			nw_of_term += 52 - nw_of_year + calendar.get(Calendar.WEEK_OF_YEAR);
//			nw_of_year = calendar.get(Calendar.WEEK_OF_YEAR);
//		}
//
//		if (SystemTime.start_NW_of_Term > 25) {
//			reset();
//		}
//		System.out.println("nw_of_term:" +nw_of_term);
//		System.out.println("WEEK_OF_YEAR:" +nw_of_year);
//
	}
}
