package com.wr.service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Single;
import com.wr.dao.impl.SignDaoImpl;
import com.wr.dao.impl.UserDaoImpl;
import com.wr.model.Sign;
import com.wr.model.User;
import com.wr.utils.BubbbleSort;

@Transactional
@Service
public class SignService {
	
	@Autowired
	UserDaoImpl userDaoImpl;
	
	@Autowired
	SignDaoImpl signDaoImpl;
	
	//获取考勤
	public Sign getSign(String username, String term, int nw) {
		User user = userDaoImpl.getUserByUsername(username);
		Set<Sign> set = null;
		try {
			set = user.getSigns();
		} catch (Exception e) {
			return null;// TODO: handle exception
		}
		List<Sign> list = new ArrayList<Sign>(set);
		for(Sign s:list) {
			if (s.getTerm().equals(term) && s.getNw() == nw) {
				return s; 
			}
		}
		return null;
	}
	
	public Sign getSignByName(String name, String term, int nw) {
		User user = userDaoImpl.getUserByName(name);
		Set<Sign> set = user.getSigns();
		List<Sign> list = new ArrayList<Sign>(set);
		Sign sign = new Sign();
		for(Sign s:list) {
			if (s.getTerm().equals(term) && s.getNw() == nw) {
				sign = s;
			}
		}
		return sign;
	}
	
	
	//获取本周考勤
	public List<Sign> getAllSignByNW(int nw, String term) {
		List<Sign> signs = signDaoImpl.getWeekSign(nw, term);
		return signs;
	}

	//添加考勤
	public void addSign(String username, String term, int nw, int late, int dayoff, String totalTime,
			String sun_am_in, String sun_am_out, String sun_pm_in, String sun_pm_out, String sun_eve_in, String sun_eve_out,
			String mon_am_in, String mon_am_out, String mon_pm_in, String mon_pm_out, String mon_eve_in, String mon_eve_out,
			String tues_am_in, String tues_am_out, String tues_pm_in, String tues_pm_out, String tues_eve_in, String tues_eve_out,
			String wed_am_in, String wed_am_out, String wed_pm_in, String wed_pm_out, String wed_eve_in, String wed_eve_out,
			String thur_am_in, String thur_am_out, String thur_pm_in, String thur_pm_out, String thur_eve_in, String thur_eve_out,
			String fri_am_in, String fri_am_out, String fri_pm_in, String fri_pm_out, String fri_eve_in, String fri_eve_out,
			String sat_am_in, String sat_am_out, String sat_pm_in, String sat_pm_out, String sat_eve_in, String sat_eve_out,
			String note, int year, int month) {
		User user = userDaoImpl.getUserByUsername(username);
		String name = user.getName();
		Sign sign = new Sign();
		sign.setName(name);
		sign.setDayoff(dayoff);
		sign.setLate(late);
		sign.setNw(nw);
		sign.setTerm(term);
		sign.setTotalTime(totalTime);
		sign.setUser(user);
		
		
		sign.setSun_am_in(sun_am_in);
		sign.setSun_am_out(sun_am_out);
		sign.setSun_pm_in(sun_pm_in);
		sign.setSun_pm_out(sun_pm_out);
		sign.setSun_eve_in(sun_eve_in);
		sign.setSun_eve_out(sun_eve_out);
		
		
		sign.setMon_am_in(mon_am_in);
		sign.setMon_am_out(mon_am_out);
		sign.setMon_pm_in(mon_pm_in);
		sign.setMon_pm_out(mon_pm_out);
		sign.setMon_eve_in(mon_eve_in);
		sign.setMon_eve_out(mon_eve_out);
		
		sign.setTues_am_in(tues_am_in);
		sign.setTues_am_out(tues_am_out);
		sign.setTues_pm_in(tues_pm_in);
		sign.setTues_pm_out(tues_pm_out);
		sign.setTues_eve_in(tues_eve_in);
		sign.setTues_eve_out(tues_eve_out);
		
		sign.setWed_am_in(wed_am_in);
		sign.setWed_am_out(wed_am_out);
		sign.setWed_pm_in(wed_pm_in);
		sign.setWed_pm_out(wed_pm_out);
		sign.setWed_eve_in(wed_eve_in);
		sign.setWed_eve_out(wed_eve_out);
		
		sign.setThur_am_in(thur_am_in);
		sign.setThur_am_out(thur_am_out);
		sign.setThur_pm_in(thur_pm_in);
		sign.setThur_pm_out(thur_pm_out);
		sign.setThur_eve_in(thur_eve_in);
		sign.setThur_eve_out(thur_eve_out);
		
		sign.setFri_am_in(fri_am_in);
		sign.setFri_am_out(fri_am_out);
		sign.setFri_pm_in(fri_pm_in);
		sign.setFri_pm_out(fri_pm_out);
		sign.setFri_eve_in(fri_eve_in);
		sign.setFri_eve_out(fri_eve_out);
		
		sign.setSat_am_in(sat_am_in);
		sign.setSat_am_out(sat_am_out);
		sign.setSat_pm_in(sat_pm_in);
		sign.setSat_pm_out(sat_pm_out);
		sign.setSat_eve_in(sat_eve_in);
		sign.setSat_eve_out(sat_eve_out);
		
		sign.setYear(year);
		sign.setMonth(month);
		sign.setNote(note);
		
		signDaoImpl.addSign(sign);
	}
	
	//更新考勤
	public void updateSign(Sign sign) {
		signDaoImpl.updateSign(sign);
	}
	
	public void deleteSign(Sign sign) {
		signDaoImpl.deleteSign(sign);
	}
	
	public HSSFWorkbook monthsummary(int year, int month) {
		
		List<Integer> integers = signDaoImpl.getMonthNW(year, month);
		
		ArrayList<Integer> nws = new ArrayList<>();
		
	    Iterator it = integers.iterator();              //2,根据传入的集合(老集合)获取迭代器
	    while(it.hasNext()) {                  //3,遍历老集合
	      Integer integer = (Integer) it.next();                //记录住每一个元素
	      if(!nws.contains(integer)) {            //如果新集合中不包含老集合中的元素
	    	  nws.add(integer);                //将该元素添加
	      }
	    }  
		
		for(int i=0;i<nws.size()-1;i++){
			for(int j=0;j<nws.size()-1-i;j++){
				if(nws.get(j) > nws.get(j + 1)){
					int temp = nws.get(j);
					nws.set(j, nws.get(j + 1));
					nws.set(j + 1, temp);
				}
			}
		}
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet(month + "月考勤汇总");
		sheet.addMergedRegion(new CellRangeAddress(0,0,1,2));
		sheet.addMergedRegion(new CellRangeAddress(0,0,3,4));
		sheet.addMergedRegion(new CellRangeAddress(0,0,5,6));
		sheet.addMergedRegion(new CellRangeAddress(0,0,7,8));

		
		HSSFRow row0 = sheet.createRow(0);
		row0.setHeightInPoints(35);
		
		HSSFCellStyle style = workbook.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        HSSFFont font = workbook.createFont(); 
        font.setFontName("宋体");
        font.setFontHeightInPoints((short) 15);// 设置字体大小
        
        
        
        HSSFCellStyle style1 = workbook.createCellStyle();
        style1.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
        style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        HSSFFont font1 = workbook.createFont(); 
        font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        
        for(int i=0;i<nws.size();i++) {
        	int x = i * 2 + 1;
            HSSFCell cell = row0.createCell(x);
            String nw = "第" + nws.get(i) + "周";
            System.out.println(nw);
            cell.setCellValue(nw);
            cell.setCellStyle(style);
        }
        
        List<String> names = userDaoImpl.getStudentsNames();
        
        int rownum = 1;
        
        for(String name:names) {
            int colnum = 1;
        	List<Sign> signs = signDaoImpl.getMonthSign(year, month, name);
        	HSSFRow row = sheet.createRow(rownum);
        	row.setHeightInPoints(30);
        	HSSFCell cell0 = row.createCell(0);
        	cell0.setCellValue(name);
        	cell0.setCellStyle(style1);
        	if (signs.size() == 0) {
				continue;
			} else if (signs.size() != 0) {
				for(int nw:nws) {
					for(Sign sign:signs) {
						if (sign.getNw() == nw) {
							HSSFCell cell1 = row.createCell(colnum);
					        int qualify = sign.getQualify();
					        String totaltime = sign.getTotalTime();
					        String qString =null;
					        
					        if (qualify == 1) {
								qString = "达标";
							} else if (qualify == 2) {
								qString = "不达标";
							} else if (qualify == 0) {
								qString = "未审核";
							} 
								
					        cell1.setCellValue(qString + "(" + totaltime + ")");
					        cell1.setCellStyle(style1);
					        
					        sheet.setColumnWidth(colnum, 12 * 256);
					        colnum++;
					        
					        HSSFCell cell2 = row.createCell(colnum);
					        cell2.setCellValue("迟到："+ "(" + sign.getLate() + ")" + "." + "请假：" + "(" + sign.getDayoff() + ")");
					        cell2.setCellStyle(style1);
					        sheet.setColumnWidth(colnum, 20 * 256);
					        colnum++;
						}
					}
				}   	
			}
        	rownum ++;
        }
		return workbook;
	}


//	根据周数获取小组考情
//	public List<Sign> getGroupSign(String username, int nw, String term) {
//		User user = userDaoImpl.getUserByUsername(username);
//		String name = user.getName();
//		String belong = name;
//		List<User> users = userDaoImpl.getUserByBelong(belong);
//		List<Sign> signs = new ArrayList<Sign>();
//		for(User u:users) {
//			Sign sign = getSign(u.getUsername(), term, nw);
//			signs.add(sign);
//		}
//		return signs;
//	}
	
	

}
