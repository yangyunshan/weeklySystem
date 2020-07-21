//package junit;
//
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Set;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.mchange.net.SmtpUtils;
//import com.wr.dao.UserDao;
//import com.wr.dao.impl.ReportDaoImpl;
//import com.wr.dao.impl.SignDaoImpl;
//import com.wr.dao.impl.UserDaoImpl;
//import com.wr.model.MeetingRecord;
//import com.wr.model.Notification;
//import com.wr.model.Report;
//import com.wr.model.Sign;
//import com.wr.model.User;
//import com.wr.service.MeetingRecordService;
//import com.wr.service.NotificationService;
//import com.wr.service.ReportService;
//import com.wr.service.SignService;
//import com.wr.service.UserService;
//import com.wr.utils.FileNullCheck;
//import com.wr.utils.SystemTime;
//
//import net.sf.json.JSONArray;
//import net.sf.json.JSONObject;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations="applicationContext.xml")
////不要在测试类里直接用dao层，无效
//public class hibernateTest {
//
//
//
//	@Autowired
//	ReportService reportservice;
//
//	@Test
//	public void test() {
//
//		JSONObject jsonObject = new JSONObject();
//		List<String> list = new ArrayList<>();
//		list.add("1");
//		list.add("2");
//		jsonObject.put("xx", list);
//
//		System.out.println(jsonObject.toString());
//	}
//
//
//
//}
