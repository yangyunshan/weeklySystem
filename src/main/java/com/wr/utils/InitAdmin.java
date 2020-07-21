package com.wr.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.wr.model.User;
import com.wr.service.UserService;

public class InitAdmin implements ServletContextListener {  
	
//	@Autowired
	HibernateTemplate hibernateTemplate = new HibernateTemplate();

    @Override  
    public void contextDestroyed(ServletContextEvent context) {  

    }  

    @Override  
    public void contextInitialized(ServletContextEvent context) {  
        // 上下文初始化执行  
    	try {
            System.out.println("================>[ServletContextListener]初始化admin");  
    	     // TODO: handle exception
    	     UserService userService = WebApplicationContextUtils.getWebApplicationContext(context.getServletContext()).getBean(UserService.class);
    	     
    	     userService.addUser("admin", "admin", "admin123", "admin", null);
    	     System.out.println("================>[ServletContextListener]初始化结束");  
    	} catch (Exception e) {
			// TODO: handle exception
    		e.printStackTrace();
    		System.out.println("================>[ServletContextListener]初始化admin失败.");  
		}

     	
    }  
}




