package com.wr.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.Null;

import org.apache.commons.io.FileUtils;
import org.apache.maven.Maven;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mchange.net.SmtpUtils;
import com.wr.model.MeetingRecord;
import com.wr.model.Notification;
import com.wr.model.Report;
import com.wr.model.Sign;
import com.wr.model.User;
import com.wr.service.MeetingRecordService;
import com.wr.service.NotificationService;
import com.wr.service.ReportService;
import com.wr.service.SignService;
import com.wr.service.UserService;
import com.wr.utils.MailUtil;
import com.wr.utils.SystemTime;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/function")
public class FunctionController {
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	SignService signSerivce;
	
	@Autowired
	UserService userService;
	
	@Autowired
	MeetingRecordService meetingRecordService;
	
	@Autowired
	NotificationService notificationService;
	
	
	/****************************** Main Page *************************************/
	@RequestMapping(value = "/njump", method = RequestMethod.POST)
	public ModelAndView  nJump(HttpServletRequest request, HttpSession session) {
		int nid = Integer.parseInt(request.getParameter("nid"));
		Notification notification = notificationService.getNotification(nid);
		String head = notification.getTitle();
		String time = notification.getYear() + "年" + notification.getMonth() + "月" + notification.getDay() + "日";
		String content = notification.getContent();
		ModelAndView mav = new ModelAndView("NotificationShow");  
		mav.addObject("head", head);
		mav.addObject("content", content);
		mav.addObject("time", time);
		return mav;
		
	}
	
	
	@RequestMapping(value = "/mjump", method = RequestMethod.POST)
	public ModelAndView  mJump(HttpServletRequest request, HttpSession session) {
		int mrid = Integer.parseInt(request.getParameter("mrid"));
		MeetingRecord meetingRecord = meetingRecordService.getMeetingRecord(mrid);
		String head = meetingRecord.getYear() + "年" + meetingRecord.getMonth() + "月" + meetingRecord.getDay() + "日会议记录";
		String time = meetingRecord.getYear() + "年" + meetingRecord.getMonth() + "月" + meetingRecord.getDay() + "日";
		String content = meetingRecord.getContent();
		
		ModelAndView mav = new ModelAndView("MeetingRecordShow");  
		mav.addObject("head", head);
		mav.addObject("content", content);
		mav.addObject("time", time);
		return mav;
	}
	
	
	/****************** Group Member ************** Group Leader *****************/
	
	/****************************** 周报功能 *********************************/
	@RequestMapping(value = "/reportsubmit", method = RequestMethod.POST)
	@ResponseBody
	public String submitReport(@RequestParam(value = "file", required = false)MultipartFile[] files, HttpServletRequest request, HttpSession session) {
		
		String username = (String) session.getAttribute("username");
		String role = (String) session.getAttribute("role");
		
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String lplan = request.getParameter("lplan");
		String done = request.getParameter("done");
		String summary = request.getParameter("summary");
		String nplan = request.getParameter("nplan");
		String lread = request.getParameter("lread");
		String nread = request.getParameter("nread");
		String term = SystemTime.term;
		int nw = SystemTime.start_NW_of_Term;
		int year  = SystemTime.year;
		int month = SystemTime.month;
		String upload = null;
		
		//这里因为需要获取路径，用到request，所以将文件保存的业务写在控制层
		if (files != null && files.length > 0) {
			//根据不同用户，不同日期生成不同存储路径
			String savePath ="upload" + "/" + username + "/" + term + "/" +"week" + nw;
			//获取项目绝对路径,将文件存储到该路径
			String path = request.getServletContext().getRealPath("/") + savePath;
			upload = path;
			for(MultipartFile  file : files) {
				if (!file.isEmpty()) {
					//TODO:newFileName
					String fileName = file.getOriginalFilename();
					
					//要存储的文件
					File desFile = new File(path, fileName);
					if (!desFile.exists()) {
						desFile.mkdirs();
					}
					//转存
					try {
						file.transferTo(desFile);
					} catch (IllegalStateException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
					//访问file的url
				}
			}
		}
		int qualify = 0;
		if (role.equals("groupleader") || role.equals("secretary")) {
			qualify = 1;
		}
		reportService.addReport(sdate, edate, lplan, done, summary, nplan, lread, nread, upload, username, qualify, nw, term, year, month);
		return "success";
	}
	
	@RequestMapping(value = "/getuserreptable", method = RequestMethod.POST, produces="application/json;charset=UTF-8")//这里解决中文乱码，在mvc配置文件中加入<mvc:annotation-driven>，然后添加application/json;charset=UTF-8
	@ResponseBody
	public String getUserRepTable(HttpServletRequest request, HttpSession session) {
		String username = (String) session.getAttribute("username");
		String term = request.getParameter("term");
		List<Report> reports = reportService.getReportsByTerm(username, term);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"user", "id", "sdate", "edate", "lplan", "done",
				"summary", "nplan", "lread", "nread"});
		JSONArray jsonArray = JSONArray.fromObject(reports, jsonConfig);
		String result = jsonArray.toString();
		System.out.println(jsonArray);
		return result;
	}
	
	@RequestMapping(value = "/getrep", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getRep(HttpServletRequest request, HttpSession session) {
		String username = (String) session.getAttribute("username");
		int nw = Integer.parseInt(request.getParameter("nw"));
		String term = request.getParameter("term");
		Report report = reportService.getReport(username, term, nw);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"user", "id"});
		JSONArray jsonArray = JSONArray.fromObject(report, jsonConfig);
		String result = jsonArray.toString();
		return result;
	}
	
	@RequestMapping(value = "/repupdate", method = RequestMethod.POST)
	@ResponseBody
	public String repUpdate(@RequestParam(value = "file", required = false)MultipartFile[] files,HttpServletRequest request, HttpSession session) {
		
		String username = (String) session.getAttribute("username");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String lplan = request.getParameter("lplan");
		String done = request.getParameter("done");
		String summary = request.getParameter("summary");
		String nplan = request.getParameter("nplan");
		String lread = request.getParameter("lread");
		String nread = request.getParameter("nread");
		String term = SystemTime.term;
		int nw = SystemTime.start_NW_of_Term;

		Report report = reportService.getReport(username, term, nw);
		String upload = report.getUpload();
		
		if (upload == null) {
			//根据不同用户，不同日期生成不同存储路径
			String savePath ="upload" + "/" + username + "/" + term + "/" +"week" + nw;
			//获取项目绝对路径,将文件存储到该路径
			String path = request.getServletContext().getRealPath("/") + savePath;
			upload = path;
			for(MultipartFile  file : files) {
				if (!file.isEmpty()) {
					//TODO:newFileName
					String fileName = file.getOriginalFilename();
					
					//要存储的文件
					File desFile = new File(path, fileName);
					if (!desFile.exists()) {
						desFile.mkdirs();
					}
					//转存
					try {
						file.transferTo(desFile);
					} catch (IllegalStateException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
				}
			}
			report.setUpload(upload);
		}
		
		if (files != null && files.length > 0) {
			for(MultipartFile  file : files) {
				if (!file.isEmpty()) {
					//TODO:newFileName
					String fileName = file.getOriginalFilename();
					//要存储的文件
					File desFile = new File(upload, fileName);
					if (!desFile.exists()) {
						desFile.mkdirs();
					}
					//转存
					try {
						file.transferTo(desFile);
					} catch (IllegalStateException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
				}
			}
		}
		report.setDone(done);
		report.setEdate(edate);
		report.setLplan(lplan);
		report.setLread(lread);
		report.setNplan(nplan);
		report.setNread(nread);
		report.setSdate(sdate);
		report.setSummary(summary);
		String role = (String) session.getAttribute("role");
		if (role.equals("groupmember")) {
			report.setQualify(0);
		}
		reportService.updateReport(report);
		return "success";
	}
	
	@RequestMapping(value = "/deletereport", method = RequestMethod.POST)
	@ResponseBody
	public String deleteReport(HttpServletRequest request, HttpSession session) throws IOException {
		String username = (String) session.getAttribute("username");
		int nw = Integer.parseInt(request.getParameter("nw"));
		String term = request.getParameter("term");
		
		reportService.deleteReport(username, term, nw);
		return "success";
	}
	
	

	@RequestMapping(value = "/getuserfilelist", method =RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getUserFileList(HttpServletRequest request, HttpSession session) {
		String username = (String) session.getAttribute("username");
		int nw = Integer.parseInt(request.getParameter("nw"));
		String term = request.getParameter("term");
		Report report = reportService.getReport(username, term, nw);
		String filePath = report.getUpload();
		
		JSONArray jsonArray = new JSONArray();
		List<String> fileList = new ArrayList<>();
		
		if (filePath == null) {
			return jsonArray.toString();
		}

		File file = new File(filePath);
		File[] files = file.listFiles();
		
		if (files == null) {
			return jsonArray.toString();
		}
		
		for(File f:files) {
			String fileName= f.getName();
			fileList.add(fileName);
		}
		jsonArray = JSONArray.fromObject(fileList);

		return jsonArray.toString();
	}
	
	@RequestMapping(value = "/download", method =RequestMethod.POST)
	public ResponseEntity<byte[]> downLoadFile(HttpServletRequest request, HttpSession session) throws IOException  {
		String username = (String) session.getAttribute("username");
		String term = request.getParameter("term");
		int nw = Integer.parseInt(request.getParameter("nw"));
		String name = request.getParameter("name");
		String filename = request.getParameter("filename");
		Report report = reportService.getReport(username, term, nw);
		String upload = report.getUpload();
		String filePath = upload + "/" + filename;
		File file = new File(filePath);	
		if (file.isFile()) {
			HttpHeaders headers = new HttpHeaders();
			filename = new String(filename.getBytes("utf-8"),"iso-8859-1");
			headers.setContentDispositionFormData("attachment", filename);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
		} else {
			return null;
		}
	}

	@RequestMapping(value = "/getsign", method =RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getSign(HttpServletRequest request, HttpSession session) {
		String username = (String) session.getAttribute("username");
		String term = SystemTime.term;
		int nw = SystemTime.start_NW_of_Term;
		Sign sign = signSerivce.getSign(username, term, nw);
		if (sign == null) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("return", "false");
			return jsonObject.toString();
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"user", "id"});
		JSONObject jsonObject = JSONObject.fromObject(sign,jsonConfig);
		String result = jsonObject.toString();
		return result;
	}
	
	@RequestMapping(value = "/signstatus", method = RequestMethod.GET)
	@ResponseBody
	public String signStatus (HttpServletRequest request, HttpSession session) {
		String username = (String) session.getAttribute("username");
		String term = SystemTime.term;
		int nw = SystemTime.start_NW_of_Term;
		Sign sign = signSerivce.getSign(username, term, nw);
		if (sign == null) {
			return "unsubmit";
		}
		return "submited";
	}
	
	@RequestMapping(value = "/submitsign", method =RequestMethod.POST)
	@ResponseBody
	public String submitSign(HttpServletRequest request, HttpSession session) {
		String username = (String) session.getAttribute("username");
		String term = SystemTime.term;
		int nw = SystemTime.start_NW_of_Term;

		int year  = SystemTime.year;
		int month = SystemTime.month;
		String sun_am_in = request.getParameter("sun_am_in");
		String sun_am_out = request.getParameter("sun_am_out");
		String sun_pm_in = request.getParameter("sun_pm_in");
		String sun_pm_out = request.getParameter("sun_pm_out");
		String sun_eve_in = request.getParameter("sun_eve_in");
		String sun_eve_out = request.getParameter("sun_eve_out");
		
		String mon_am_in = request.getParameter("mon_am_in");
		String mon_am_out = request.getParameter("mon_am_out");
		String mon_pm_in = request.getParameter("mon_pm_in");
		String mon_pm_out = request.getParameter("mon_pm_out");
		String mon_eve_in = request.getParameter("mon_eve_in");
		String mon_eve_out = request.getParameter("mon_eve_out");
		
		String tues_am_in = request.getParameter("tues_am_in");
		String tues_am_out = request.getParameter("tues_am_out");
		String tues_pm_in = request.getParameter("tues_pm_in");
		String tues_pm_out = request.getParameter("tues_pm_out");
		String tues_eve_in = request.getParameter("tues_eve_in");
		String tues_eve_out = request.getParameter("tues_eve_out");
		
		String wed_am_in = request.getParameter("wed_am_in");
		String wed_am_out = request.getParameter("wed_am_out");
		String wed_pm_in = request.getParameter("wed_pm_in");
		String wed_pm_out = request.getParameter("wed_pm_out");
		String wed_eve_in = request.getParameter("wed_eve_in");
		String wed_eve_out = request.getParameter("wed_eve_out");
		
		String thur_am_in = request.getParameter("thur_am_in");
		String thur_am_out = request.getParameter("thur_am_out");
		String thur_pm_in = request.getParameter("thur_pm_in");
		String thur_pm_out = request.getParameter("thur_pm_out");
		String thur_eve_in = request.getParameter("thur_eve_in");
		String thur_eve_out = request.getParameter("thur_eve_out");
		
		String fri_am_in = request.getParameter("fri_am_in");
		String fri_am_out = request.getParameter("fri_am_out");
		String fri_pm_in = request.getParameter("fri_pm_in");
		String fri_pm_out = request.getParameter("fri_pm_out");
		String fri_eve_in = request.getParameter("fri_eve_in");
		String fri_eve_out = request.getParameter("fri_eve_out");
		
		String sat_am_in = request.getParameter("sat_am_in");
		String sat_am_out = request.getParameter("sat_am_out");
		String sat_pm_in = request.getParameter("sat_pm_in");
		String sat_pm_out = request.getParameter("sat_pm_out");
		String sat_eve_in = request.getParameter("sat_eve_in");
		String sat_eve_out = request.getParameter("sat_eve_out");
		
		String note = request.getParameter("note");
		
		int late = Integer.parseInt(request.getParameter("late"));
		int dayoff = Integer.parseInt(request.getParameter("dayoff"));
		String totalTime = request.getParameter("totaltime"); 

		Sign sign = signSerivce.getSign(username, term, nw);
		if (sign == null) {
			signSerivce.addSign(username, term, nw, late, dayoff, totalTime, 
					sun_am_in, sun_am_out, sun_pm_in, sun_pm_out, sun_eve_in, sun_eve_out, 
					mon_am_in, mon_am_out, mon_pm_in, mon_pm_out, mon_eve_in, mon_eve_out, 
					tues_am_in, tues_am_out, tues_pm_in, tues_pm_out, tues_eve_in, tues_eve_out, 
					wed_am_in, wed_am_out, wed_pm_in, wed_pm_out, wed_eve_in, wed_eve_out, 
					thur_am_in, thur_am_out, thur_pm_in, thur_pm_out, thur_eve_in, thur_eve_out, 
					fri_am_in, fri_am_out, fri_pm_in, fri_pm_out, fri_eve_in, fri_eve_out, 
					sat_am_in, sat_am_out, sat_pm_in, sat_pm_out, sat_eve_in, sat_eve_out, 
					note, year, month);
		} else {
			sign.setDayoff(dayoff);
			sign.setLate(late);
			sign.setTotalTime(totalTime);
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
			
			sign.setNote(note);
			signSerivce.updateSign(sign);
		}
		return "success";
	}
	
	/*********************** Group Leader **************** Teacher ***********************/
	
	@RequestMapping(value = "/getfilelist", method =RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getFileList(HttpServletRequest request, HttpSession session) {
		int nw = Integer.parseInt(request.getParameter("nw"));
		String term = request.getParameter("term");
		String name = request.getParameter("name");
		Report report = reportService.getReportByName(name, term, nw);
		String filePath = report.getUpload();
		
		JSONArray jsonArray = new JSONArray();
		List<String> fileList = new ArrayList<>();
		
		if (filePath == null) {
			return jsonArray.toString();
		}

		File file = new File(filePath);
		File[] files = file.listFiles();
		
		if (files == null) {
			return jsonArray.toString();
		}
		
		for(File f:files) {
			String fileName= f.getName();
			fileList.add(fileName);
		}
		jsonArray = JSONArray.fromObject(fileList);

		return jsonArray.toString();
	}
	
	
	@RequestMapping(value = "/downloadsinglefile", method =RequestMethod.POST)
	public ResponseEntity<byte[]> downloadSingleFile (HttpServletRequest request, HttpSession session) throws IOException{
		String term = request.getParameter("term");
		int nw = Integer.parseInt(request.getParameter("nw"));
		String name = request.getParameter("name");
		String filename = request.getParameter("filename");
		Report report = reportService.getReportByName(name, term, nw);
		String upload = report.getUpload();
		String filePath = upload + "/" + filename;
		File file = new File(filePath);	
		if (file.isFile()) {
			HttpHeaders headers = new HttpHeaders();
			filename = new String(filename.getBytes("utf-8"),"iso-8859-1");
			headers.setContentDispositionFormData("attachment", filename);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
		} else {
			return null;
		}
	}
	
	
	@RequestMapping(value = "/downloadmemberfile", method =RequestMethod.POST)
	public ResponseEntity<byte[]> downloadMemberFile (HttpServletRequest request, HttpSession session) throws IOException {
		
		List<File> list = new ArrayList<File>();

		int nw = Integer.parseInt(request.getParameter("nw"));
		String term = request.getParameter("term");
		String name = request.getParameter("name");
		Report report = reportService.getReportByName(name, term, nw);
		String directoryPath = report.getUpload();
		if (directoryPath == null) {
			return null;
		}
		
        File baseFile = new File(directoryPath);
        File[] files = baseFile.listFiles();
		if (files == null) {// 如果目录为空，直接退出
			return null;
		}
		for(File f:files) {
			if (f.isFile()) {
				list.add(f);
			}
		}
		
		String resourcesName = "undefined.zip";
		ZipOutputStream zipOut = new ZipOutputStream(new FileOutputStream(directoryPath+resourcesName));
		InputStream input = null;
		for (File file : list) {
			input = new FileInputStream(file);  
            zipOut.putNextEntry(new ZipEntry(file.getName()));  
            int temp = 0;  
            while((temp = input.read()) != -1){  
                zipOut.write(temp);  
            }  
            input.close();
		}
		
		zipOut.close();
		File file = new File(directoryPath+resourcesName);
		HttpHeaders headers = new HttpHeaders();
		String filename = new String(resourcesName.getBytes("utf-8"),"iso-8859-1");
		headers.setContentDispositionFormData("attachment", filename);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
	}
	
	
	
	//获取成员周报列表
	@RequestMapping(value = "/getweekrepbygroup", method =RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getWeekRepByGroup(HttpServletRequest request, HttpSession session) {
		String role = (String) session.getAttribute("role");
		String username = (String) session.getAttribute("username");
		
		String term = SystemTime.term;
		int nw = SystemTime.start_NW_of_Term;

		String belong = userService.getUser(username).getName();
		String result = null;
		if (role.equals("groupleader") || role.equals("secretary")) {
			List<Report> reports = reportService.getWeekGroupReports(term, nw, belong);
			JSONArray jsonArray = new JSONArray();
			for(Report rep:reports) {
				JsonConfig jsonConfig = new JsonConfig();
				jsonConfig.setExcludes(new String[] {"user", "id","sdate", "edate", "lplan", "done",
						"summary", "nplan", "lread", "nread"});
				JSONObject jObject = JSONObject.fromObject(rep,jsonConfig);
				jObject.put("name", rep.getUser().getName());
				jsonArray.add(jObject);
			}
			result = jsonArray.toString();
		} else if (role.equals("teacher")) {
			List<Report> reports = reportService.getWeekAllReports(term, nw);
			JSONArray jsonArray = new JSONArray();
			for(Report rep:reports) {
				JsonConfig jsonConfig = new JsonConfig();
				jsonConfig.setExcludes(new String[] {"user", "id","sdate", "edate", "lplan", "done",
						"summary", "nplan", "lread", "nread"});
				JSONObject jObject = JSONObject.fromObject(rep,jsonConfig);
				jObject.put("name", rep.getUser().getName());
				jsonArray.add(jObject);
			}
			result = jsonArray.toString();
		}
		return result;
	}

	//获取成员周报
	@RequestMapping(value = "/getmemberrep", method =RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getMemberRep(HttpServletRequest request) {
		int nw = Integer.parseInt(request.getParameter("nw"));
		String term = request.getParameter("term");
		String name = request.getParameter("name");
		Report report = reportService.getReportByName(name, term, nw);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"user", "id"});
		JSONArray jsonArray = JSONArray.fromObject(report, jsonConfig);
		String result = jsonArray.toString();
		return result;
	}
	
	
	
	/******************************* Group Leader *********************************/
	@RequestMapping(value = "/review", method =RequestMethod.POST)
	@ResponseBody
	public String review(HttpServletRequest request) {
		String name = request.getParameter("name");
		int nw = Integer.parseInt(request.getParameter("nw"));
		String term = request.getParameter("term");
		int qualify = Integer.parseInt(request.getParameter("qualify"));
		Report report = reportService.getReportByName(name, term, nw);
		report.setQualify(qualify);
		reportService.updateReport(report);
		
		User user = userService.getUserByName(name);
		String email = user.getEmail();
		if (email.equals("")) {
			return "false";
		} else {
			String qString = null;
			if (qualify == 1) {
				qString = "合格";
			} else {
				qString = "不合格";
			}

			String emailMessage = term + "第" + nw + "周周报" + "组长已审核。" + "审核结果为:" + qString;
			MailUtil mailUtil = new MailUtil();
			try {
				mailUtil.sendmail(emailMessage, email);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "success";
		}
	}
	
	
	@RequestMapping(value = "/reviewsign", method =RequestMethod.POST)
	@ResponseBody
	public String reviewSign(HttpServletRequest request) {
		String name = request.getParameter("name");
		int nw = Integer.parseInt(request.getParameter("nw"));
		String term = request.getParameter("term");
		int qualify = Integer.parseInt(request.getParameter("qualify"));
		Sign sign = signSerivce.getSignByName(name, term, nw);
		sign.setQualify(qualify);
		signSerivce.updateSign(sign);
		return "success";
	}
	
	
	
	/******************************* Teacher *************************************/
	

	
//	@RequestMapping(value = "/exportmonthreport", method =RequestMethod.POST, produces="application/json;charset=UTF-8")
//	@ResponseBody
//	public ResponseEntity<byte[]> exportmonthreport(HttpServletRequest request) {
//		return null;
//		
//	}
	
//	@RequestMapping(value = "/exportyearreport", method =RequestMethod.POST, produces="application/json;charset=UTF-8")
//	@ResponseBody
//	public ResponseEntity<byte[]> exportYearReport(HttpServletRequest request) {
//		return null;
//		
//	}
//	
//	@RequestMapping(value = "/exportyearsign", method =RequestMethod.POST, produces="application/json;charset=UTF-8")
//	@ResponseBody
//	public ResponseEntity<byte[]> exportYearsign(HttpServletRequest request) {
//		return null;
//	}
	
	//导出月签到汇总
	@RequestMapping(value = "/exportmonthsign", method =RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<byte[]> exportMonthSign(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		HSSFWorkbook hssfWorkbook = signSerivce.monthsummary(year, month);
		
		String filename = year + " " +month + ".xls" ;
		String filePath = request.getServletContext().getRealPath("/") + "monthsign/";
		
		if (!new File(filePath).exists() && !new File(filePath).isDirectory()) {
			new File(filePath).mkdir(); 
		}
		
		File file = new File(filePath,filename);
		FileOutputStream outputStream = new FileOutputStream(file);
		hssfWorkbook.write(outputStream);
		outputStream.flush();   
		outputStream.close();
		
		File downloadfile = new File(filePath + filename);
		HttpHeaders headers = new HttpHeaders();
		filename = new String(filename.getBytes("utf-8"),"iso-8859-1");
		headers.setContentDispositionFormData("attachment", filename);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(downloadfile),headers,HttpStatus.CREATED);
	}
	
	//老师获取签到报表
	@RequestMapping(value = "/getsignsbytermandnw",method =RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getSignsByTermAndNw(HttpServletRequest request) {
		String term = request.getParameter("term");
		int nw = Integer.parseInt(request.getParameter("nw"));
		List<Sign> signs = signSerivce.getAllSignByNW(nw, term);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"user", "id"});
		JSONArray jsonArray = JSONArray.fromObject(signs,jsonConfig);
		return jsonArray.toString();
	}
	
	//老师获取周报报表
	@RequestMapping(value = "/getrepsbytermandnw",method =RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getRepsByTermAndNw(HttpServletRequest request) {
		String term = request.getParameter("term");
		int nw = Integer.parseInt(request.getParameter("nw"));
		JSONArray jsonArray = new JSONArray();
		
		List<Report> reports = reportService.getWeekAllReports(term, nw);

		for(Report rep:reports) {
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setExcludes(new String[] {"user", "id","sdate", "edate", "lplan", "done",
					"summary", "nplan", "lread", "nread"});
			JSONObject jObject = JSONObject.fromObject(rep,jsonConfig);
			jObject.put("name", rep.getUser().getName());
			jsonArray.add(jObject);
		}
		
		String result = jsonArray.toString();
		return result;

	}
	
	//获取成员签到
	@RequestMapping(value = "/getmembersign", method =RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getMemberSign(HttpServletRequest request) {
		String name = request.getParameter("name");
		String term = request.getParameter("term");
		int nw = Integer.parseInt(request.getParameter("nw"));
		Sign sign = signSerivce.getSignByName(name, term, nw);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"user", "id"});
		JSONObject jsonobj = JSONObject.fromObject(sign, jsonConfig);
		String result = jsonobj.toString();
		return result;
	}
	
	//获取学生姓名更新input
	@RequestMapping(value = "/getstudentnames",method =RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getStudentNames() {
		List<String> names = userService.getStudentNames();
		JSONArray jsonArray = JSONArray.fromObject(names);
		String result = jsonArray.toString();
		return result;
	}
	
	//查找周报
	@RequestMapping(value = "/searchreport",method =RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String searchReport(HttpServletRequest request, HttpSession session) {
		String name = request.getParameter("name");
		String term = request.getParameter("term");
		JSONArray jsonArray = new JSONArray();
		List<Report> reports = reportService.getReportByNameAndTerm(name, term);
		
		for(Report rep:reports) {  
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setExcludes(new String[] {"id", "user", "sdate", "edate", "lplan", "done",
					"summary", "nplan", "lread", "nread", "qualify"});
			JSONObject jObject = JSONObject.fromObject(rep,jsonConfig);
			jObject.put("name", rep.getUser().getName());
			jsonArray.add(jObject);
		}
		
		String result = jsonArray.toString();
		return result;
	}
	
	//发布公告
	@RequestMapping(value = "/submitnotification", method =RequestMethod.POST)
	@ResponseBody
	public String submitNotification(HttpServletRequest request) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Notification notification = new Notification();
		notification.setContent(content);
		notification.setTitle(title);
		notification.setMonth(SystemTime.month);
		notification.setYear(SystemTime.year);
		notification.setDay(SystemTime.day);
		notificationService.addNotification(notification);
		return "success";
	}
	
	
	/******************************* Secretary **************************************/
	@RequestMapping(value = "/submitmeetingrecord", method =RequestMethod.POST)
	@ResponseBody
	public String submitMeetingRecord(HttpServletRequest request) {
		String content = request.getParameter("content");
		MeetingRecord meetingRecord = new MeetingRecord();
		meetingRecord.setContent(content);
		meetingRecord.setDay(SystemTime.day);
		meetingRecord.setMonth(SystemTime.month);
		meetingRecord.setYear(SystemTime.year);
		meetingRecordService.addMeetingRecord(meetingRecord);
		return "success";
	}
	
	
	@RequestMapping(value = "/getweeksigns",method =RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getWeekSign() {
		String term = SystemTime.term;
		int nw = SystemTime.start_NW_of_Term;
		List<Sign> signs = signSerivce.getAllSignByNW(nw, term);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"user", "id"});
		JSONArray jsonArray = JSONArray.fromObject(signs, jsonConfig);
		String result = jsonArray.toString();
		return result;
	}
	
	
	/******************************* Admin **************************************/
	
	@RequestMapping(value = "/getallnotications", method =RequestMethod.GET, produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String getAllNotifications() {
		List<Notification> notifications = notificationService.getAllNotifications();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"content"});
		JSONArray jsonArray = JSONArray.fromObject(notifications,jsonConfig);
		String result = jsonArray.toString();
		return result;
		
	}
	
	@RequestMapping(value = "/getallmeetingrecords", method =RequestMethod.GET, produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String getAllMeetingRecords() {
		List<MeetingRecord> meetingRecords = meetingRecordService.getAllMeetingRecords();
		JSONArray jsonArray = JSONArray.fromObject(meetingRecords);
		String result = jsonArray.toString();
		return result;
	}
	
	@RequestMapping(value = "/deletenotification", method =RequestMethod.POST)
	@ResponseBody
	public String deleteNotification(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		notificationService.deleteNotification(id);
		return "success";
	}
	
	@RequestMapping(value = "/deletemeetingrecord", method =RequestMethod.POST)
	@ResponseBody
	public String deleteMeetingRecord(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		meetingRecordService.deleteMeetingRecord(id);
		return "success";
	}
	
	
	
	@RequestMapping(value = "/getglnames", method =RequestMethod.GET, produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String getAllUserName() {
		List<String> names = userService.getGLNames();
		JSONArray jsonArray = JSONArray.fromObject(names);
		String result = jsonArray.toString();
		return result;
	}
	
	@RequestMapping(value = "/getalluser", method =RequestMethod.GET, produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String getAllUser() {
		List<User> users = userService.getAllUser();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"id", "signs", "reports"});
		JSONArray jsonArray = JSONArray.fromObject(users, jsonConfig);
		String result = jsonArray.toString();
		return result;
	}

	@RequestMapping(value = "/saveuser", method =RequestMethod.POST)
	@ResponseBody
	public String saveUser(HttpServletRequest request) {
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		String belong = request.getParameter("belong");
		User user = userService.getUser(username);
		user.setName(name);
		user.setBelong(belong);
		user.setName(name);
		user.setPassword(password);
		user.setRole(role);
		userService.update(user);
		return "success";
	}
	
	@RequestMapping(value = "/newuser", method = RequestMethod.POST)
	@ResponseBody
	public String newUser(HttpServletRequest request) {
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String role = request.getParameter("role");
		String password = request.getParameter("password");
		String belong = request.getParameter("belong");
		userService.addUser(username, name, password, role, belong);
		return "success";
		
	}
	
	@RequestMapping(value = "/deleteuser", method =RequestMethod.POST)
	@ResponseBody
	public String deleteUser(HttpServletRequest request) {
		String username = request.getParameter("username");
		userService.delete(username);
		return "success";
	}

	@RequestMapping(value = "/getalluserreport", method =RequestMethod.POST, produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String getAllUserReport(HttpServletRequest request) {
		int nw = Integer.parseInt(request.getParameter("nw"));
		String term = request.getParameter("term");
		List<Report> reports = reportService.getWeekAllReports(term, nw);
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"id", "user", "sdate", "edate", "lplan", "done",
				"summary", "nplan", "lread", "nread", "qualify"});
		
		JSONArray jsonArray = new JSONArray();
		for(Report rep:reports) {
			JSONObject jObject = JSONObject.fromObject(rep,jsonConfig);
			jObject.put("name", rep.getUser().getName());
			jsonArray.add(jObject);
		}

		String result = jsonArray.toString();
		return result;
		
	}
	
	@RequestMapping(value = "/getallusersign", method =RequestMethod.POST, produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String getAllUserSign(HttpServletRequest request) {
		String ss = request.getParameter("nw");
		int nw = Integer.parseInt(request.getParameter("nw"));
		String term = request.getParameter("term");
		List<Sign> signs = signSerivce.getAllSignByNW(nw, term);
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"id", "user","sun_am_in", "sun_am_out", "sun_pm_in", "sun_pm_out", "sun_eve_in", "sun_eve_out",
				"mon_am_in", "mon_am_out", "mon_pm_in", "mon_pm_out", "mon_eve_in", "mon_eve_out",
				"tues_am_in", "tues_am_out", "tues_pm_in", "tues_pm_out", "tues_eve_in", "tues_eve_out",
				"wed_am_in", "wed_am_out", "wed_pm_in", "wed_pm_out", "wed_eve_in", "wed_eve_out",
				"thur_am_in", "thur_am_out", "thur_pm_in", "thur_pm_out", "thur_eve_in", "thur_eve_out",
				"fri_am_in", "fri_am_out", "fri_pm_in", "fri_pm_out", "fri_eve_in", "fri_eve_out"});

		
	
		
		JSONArray jsonArray = new JSONArray();
		for(Sign s:signs) {
			JSONObject jObject = JSONObject.fromObject(s,jsonConfig);
			jObject.put("name", s.getUser().getName());
			jsonArray.add(jObject);
		}
		String result = jsonArray.toString();
		return result;
	}
	
	@RequestMapping(value = "/deleterep", method =RequestMethod.POST)
	@ResponseBody
	public String deleteRep(HttpServletRequest request) throws IOException {
		String name = request.getParameter("name");
		String term = request.getParameter("term");
		int nw = Integer.parseInt(request.getParameter("nw"));
		reportService.deleteReportByName(name, term, nw);
		return "success";
	}
	
	@RequestMapping(value = "/deletesign", method =RequestMethod.POST)
	@ResponseBody
	public String deleteSign(HttpServletRequest request) throws IOException {
		String name = request.getParameter("name");
		String term = request.getParameter("term");
		int nw = Integer.parseInt(request.getParameter("nw"));
		Sign sign = signSerivce.getSignByName(name, term, nw);
		signSerivce.deleteSign(sign);
		return "success";
	}
	
	
	/************************System function**********************/
	@RequestMapping(value = "/gettime", method =RequestMethod.GET, produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String getTime(HttpServletResponse response) {
		int nw = SystemTime.start_NW_of_Term;
		String term = SystemTime.term;
		int week = SystemTime.week;
		JSONObject jObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		jObject.put("nw", nw);
		jObject.put("term", term);
		jObject.put("week", week);
		jsonArray.add(jObject);
		String result = jsonArray.toString();
		return result;
	}
	
	@RequestMapping(value = "/changepw", method = RequestMethod.POST)
	@ResponseBody
	public String changePW(HttpServletRequest request, HttpSession session) throws IOException {
		String username = (String) session.getAttribute("username");
		User user = userService.getUser(username);
		String oldPassword = request.getParameter("oldpw");
		String pw = user.getPassword();
		if (!oldPassword.equals(pw)) {
			return "fail";
		}
		else {
			String newPassword = request.getParameter("newpw");
			user.setPassword(newPassword);
			userService.update(user);	
			session.invalidate();
			return "success";
			
		}
	}	
	
	@RequestMapping(value = "/startsystem", method = RequestMethod.POST)
	@ResponseBody
	public String startSystem(HttpServletRequest request , HttpSession session) {
		String year = request.getParameter("year");
		String half = request.getParameter("half");
		String term = year + half;
		int start_NW_of_Term = Integer.parseInt(request.getParameter("nw"));
		SystemTime.start(term, start_NW_of_Term);
		return "sucesse";
	}
	
	
	/************************main page**********************/
	@RequestMapping(value = "/getmeetingreportpagecutlist", method =RequestMethod.POST, produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String getMeetingReportPageCutList (HttpServletRequest request) {
		int pagenum = Integer.parseInt(request.getParameter("pagenum"));
		int pagecut = Integer.parseInt(request.getParameter("pagecut"));
		int firstResult = (pagenum-1) * pagecut;
		int offset = pagecut;
		List<MeetingRecord> meetingRecords = meetingRecordService.getPageCuteMeetingRecords(firstResult, offset);
		JSONArray jsonArray = JSONArray.fromObject(meetingRecords);
		String result = jsonArray.toString();
		return result;
	}
	
	@RequestMapping(value = "/getfirstnotification", method =RequestMethod.GET, produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String getFirstNotification(HttpServletRequest request) {
		Notification notification = new Notification();
		try {
			notification = notificationService.getFirstNotification();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "";
		}
		JSONObject jsonObject = JSONObject.fromObject(notification);
		String result = jsonObject.toString();
		return result;
	}
	
//	@RequestMapping(value = "/getnotificationpagecutlist", method =RequestMethod.POST, produces="application/json;charset=UTF-8" )
//	@ResponseBody
//	public String getNotificationPageCutList (HttpServletRequest request) {
//		int pagenum = Integer.parseInt(request.getParameter("pagenum"));
//		int pagecut = Integer.parseInt(request.getParameter("pagecut"));
//		int firstResult = (pagenum-1) * pagecut;
//		int offset = pagecut;
//		List<Notification> notifications = notificationService.getPageCuteNotification(firstResult, offset);
//		JSONArray jsonArray = JSONArray.fromObject(notifications);
//		String result = jsonArray.toString();
//		return result;
//		
//	}
	
//	@RequestMapping(value = "/getnotificationsumpage", method =RequestMethod.GET, produces="application/json;charset=UTF-8" )
//	@ResponseBody
//	public String getNotificationSumPage (HttpServletRequest request) {
//		int sumPage = notificationService.getSumPage(5);
//		JSONObject jObject = new JSONObject();
//		jObject.put("sumPage", sumPage);
//		return jObject.toString();
//	}
//	
//	@RequestMapping(value = "/getmeetingrecordsumpage", method =RequestMethod.GET, produces="application/json;charset=UTF-8" )
//	@ResponseBody
//	public String getMeetingRecordSumPage (HttpServletRequest request) {
//		int sumPage = meetingRecordService.getSumPage(5);
//		JSONObject jObject = new JSONObject();
//		jObject.put("sumPage", sumPage);
//		return jObject.toString();
//		
//	}
	
	@RequestMapping(value = "/changepersonalinfo", method =RequestMethod.POST)
	@ResponseBody
	public String changePersonalInfo (HttpServletRequest request, HttpSession session) {
		String username = (String) session.getAttribute("username");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		User user = userService.getUser(username);
		user.setEmail(email);
		user.setName(name);
		userService.update(user);
		return "success";
		
	}
	
	@RequestMapping(value = "/getpersonalinfo", method =RequestMethod.GET, produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String getPersonalInfo(HttpServletRequest request, HttpSession session) {
		String username = (String) session.getAttribute("username");
		User user = userService.getUser(username);
		String name = user.getName();
		String email = user.getEmail();
		JSONObject jObject = new JSONObject();
		jObject.put("username", username);
		jObject.put("name", name);
		jObject.put("email", email);
		return jObject.toString();
	}
	
	
	@RequestMapping(value = "/saveImage", method =RequestMethod.POST)
	@ResponseBody
	public String saveImage(@RequestParam(value = "image", required = false)MultipartFile[] files,HttpServletRequest request,HttpServletResponse response , HttpSession session) {
		
		List<String> pathList = new ArrayList<>();
		JSONObject jsonObject = new JSONObject();
		String username = (String) session.getAttribute("username"); 
		
		String term = SystemTime.term;
		int year = SystemTime.year;
		int month = SystemTime.month;
		int nw = SystemTime.start_NW_of_Term;

		
		if (files != null && files.length > 0) {
			//根据不同用户，不同日期生成不同存储路径
			String savePath ="image/"+year+"/"+month;
			//获取项目绝对路径,将文件存储到该路径
			String realPath = request.getServletContext().getRealPath("/") + savePath;
			for(MultipartFile  file : files) {
				if (!file.isEmpty()) {

					SimpleDateFormat df = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");				
					String fileName = username + "_" +df.format(new Date()) + ".jpg";
					
					//要存储的文件
					File desFile = new File(realPath, fileName);
					if (!desFile.exists()) {
						desFile.mkdirs();	
					}
					//转存
					try {
						file.transferTo(desFile);
					} catch (IllegalStateException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
					//访问file的url
					String acessUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()
					+ request.getContextPath() + "/" + savePath + "/" + fileName;
					pathList.add(acessUrl);	
				}
			}
			jsonObject.put("errno", 0);
			jsonObject.put("data", pathList);
		} 
		return jsonObject.toString();
	}
	
}
