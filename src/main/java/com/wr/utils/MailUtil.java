package com.wr.utils;

import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.Date;
import java.util.Properties;

public class MailUtil {

	public void sendmail(String content, String recieveMail) throws Exception {
		String emailusername = "sensorwebteam@outlook.com";
		String emailpw = "swt123456";
		
		String SMTPServer = "smtp-mail.outlook.com";
		String SMTPport = "587";
		String codemethod ="STARTTLS";
		
        // 1. 创建参数配置, 用于连接邮件服务器的参数配置
        Properties props = new Properties();                    // 参数配置

        // PS: 某些邮箱服务器要求 SMTP 连接需要使用 SSL 安全认证 (为了提高安全性, 邮箱支持SSL连接, 也可以自己开启),
        //     如果无法连接邮件服务器, 仔细查看控制台打印的 log, 如果有有类似 “连接失败, 要求 SSL 安全连接” 等错误,
        //     打开下面 /* ... */ 之间的注释代码, 开启 SSL 安全连接。
        
            // SMTP 服务器的端口 (非 SSL 连接的端口一般默认为 25, 可以不添加, 如果开启了 SSL 连接,
            //                  需要改为对应邮箱的 SMTP 服务器的端口, 具体可查看对应邮箱服务的帮助,
            //                  QQ邮箱的SMTP(SLL)端口为465或587, 其他邮箱自行去查看)
        
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTPServer);
        props.put("mail.smtp.port", "587");
         

        // 2. 根据配置创建会话对象, 用于和邮件服务器交互
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                  protected PasswordAuthentication getPasswordAuthentication() {
                      return new PasswordAuthentication(emailusername, emailpw);
                  }
                });                              // 设置为debug模式, 可以查看详细的发送 log

        // 3. 创建一封邮件

        
        Message message = new MimeMessage(session);
        message.addHeader("X-Mailer","Microsoft Outlook Express 6.00.2900.2869");
        message.setFrom(new InternetAddress(emailusername));
        message.setRecipients(Message.RecipientType.TO,
            InternetAddress.parse(recieveMail));
        message.setSubject("周报审核结果");
        message.setText(content);

        Transport.send(message);
    }
}
