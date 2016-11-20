package com.zblog.core.util;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

public class MailUtil {

	public static boolean sendMail(
			String smtpHost,int smtpPort,
			String from,String password,
			String subject,String text,String to) 
	{
		boolean result =true;
		try{
			Properties props = new Properties();
			props.setProperty("mail.smtp.auth", "true");// 必须 普通客户端
			props.setProperty("mail.transport.protocol", "smtp");// 必须选择协议
			//
			 MailSSLSocketFactory sf = new MailSSLSocketFactory();  
			 sf.setTrustAllHosts(true);  
			 props.put("mail.smtp.ssl.enable", "true");  
			 props.put("mail.smtp.ssl.socketFactory", sf); 
			//
			Session session = Session.getDefaultInstance(props);
			// 设置debug模式 在控制台看到交互信息
			session.setDebug(true);
			// 建立一个要发送的信息
			Message msg = new MimeMessage(session);
			// 设置简单的发送内容
			msg.setText(text);
			// 发件人邮箱号
			msg.setFrom(new InternetAddress(from));
			msg.setSubject(subject);
			// 发送信息的工具
			Transport transport = session.getTransport();
			// 发件人邮箱号// 和密码
			transport.connect(smtpHost, smtpPort, from, password);
			// 对方的地址
			transport.sendMessage(msg, new Address[] { new InternetAddress( to ) });
			transport.close();
		}catch(Exception exp){
			result =false;
			exp.printStackTrace();
		}
		return result;
	}
	
	public static void main(String[] args) {
		String smtpHost ="smtp.exmail.qq.com";
		int smtpPort =465;
//		String from ="1914662148@qq.com";
//		String password ="tgjajrzutjhnbeaj";
		String from ="service@tao-fast.com";
		String password ="1234Qsxc";
		String subject ="test";
		String text ="test hahaha ";
		String to ="510836102@qq.com";
		boolean bool =MailUtil.sendMail(smtpHost, smtpPort, from, password, subject, text, to);
		if(bool){
			System.out.println("ok--------->>");
		}
		else{
			System.out.println("fail--------->>");
			
		}
	}
//	public static void main(String[] args) {
//		String smtpHost ="smtp.qq.com";
//		int smtpPort =465;
////		String from ="1914662148@qq.com";
////		String password ="tgjajrzutjhnbeaj";
//		String from ="smartsolar@csc-group.cn";
//		String password ="Cscss123456";
//		String subject ="test";
//		String text ="test hahaha ";
//		String to ="510836102@qq.com";
//		boolean bool =MailUtil.sendMail(smtpHost, smtpPort, from, password, subject, text, to);
//		if(bool){
//			System.out.println("ok--------->>");
//		}
//		else{
//			System.out.println("fail--------->>");
//			
//		}
//	}
}
