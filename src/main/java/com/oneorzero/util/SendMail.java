package com.oneorzero.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	String url = this.getClass().getResource("/").getPath().replaceAll("%20", "");// ��o��eclass��������|�AreplaceAll("%20",
																					// "")�O�]��getPath()Ū���ɹJ��Ů�|��Ů�Ū����%20
	
	String path = url.substring(0, url.indexOf("WEB-INF")) + "WEB-INF/classes/Gmail.properties";
	private String emailHost = new Config(path).getValue("host");
	private String emailFrom = new Config(path).getValue("from");
	private String emailPwd = new Config(path).getValue("password");
//	private String emailHost = "smtp.gmail.com";
//	private String emailFrom = "oneorzerocorp@gmail.com";
//	private String emailPwd = "LinkStart0903";

	public void sendPwd(String Email, String context) {
		String from = emailFrom;
		String pass = emailPwd;
		String to = Email;
		String host = emailHost;
		Properties properties = System.getProperties();
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.user", from);
		properties.put("mail.smtp.password", pass);
		properties.put("mail.smtp.port", "25");
		properties.put("mail.smtp.auth", "true");
		Session session = Session.getDefaultInstance(properties);
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("你的search(\"咖啡\");臨時密碼");
			message.setText("你的臨時密碼為：" + context);
			Transport transport = session.getTransport("smtp");
			transport.connect(host, from, pass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}

	public void sendAccountVerify(String Email, String context) {
		String from = emailFrom;
		String pass = emailPwd;
		String to = Email;
		String host = emailHost;
		Properties properties = System.getProperties();
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.user", from);
		properties.put("mail.smtp.password", pass);
		properties.put("mail.smtp.port", "25");
		properties.put("mail.smtp.auth", "true");
		Session session = Session.getDefaultInstance(properties);
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("search(\"咖啡\"); 帳號開通信件");
			message.setText("點擊以下連結已開通您的search(\"咖啡\");帳號：\n" + context);
			Transport transport = session.getTransport("smtp");
			transport.connect(host, from, pass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}
}
