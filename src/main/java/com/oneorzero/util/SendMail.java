package com.oneorzero.util;

import java.util.ArrayList;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendMail {
	String url = this.getClass().getResource("/").getPath().replaceAll("%20", "");// ��o��eclass��������|�AreplaceAll("%20",
																					// "")�O�]��getPath()Ū���ɹJ��Ů�|��Ů�Ū����%20

	String path = url.substring(0, url.indexOf("WEB-INF")) + "WEB-INF/classes/Gmail.properties";
	private String emailHost = new Config(path).getValue("host");
	private String emailFrom = new Config(path).getValue("from");
	private String emailPwd = new Config(path).getValue("password");

	public void sendEmail(String Email, String subject, String content) {
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
		properties.put("mail.mime.allowutf8", "true");
		Session session = Session.getDefaultInstance(properties);
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(subject);
			message.setContent(content, "text/html; charset=utf-8");// 寫html用的
			Transport transport = session.getTransport("smtp");
			transport.connect(host, from, pass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}

	public void sendEmailWithImage(String Email, String subject, String content, ArrayList<String> path) {
		String from = emailFrom;
		String pass = emailPwd;
		String to = Email;
		String host = emailHost;
		String imgUrl = url.substring(0, url.indexOf("WEB-INF")) + "WEB-INF";
		Properties properties = System.getProperties();
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.user", from);
		properties.put("mail.smtp.password", pass);
		properties.put("mail.smtp.port", "25");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.mime.allowutf8", "true");
		Session session = Session.getDefaultInstance(properties);
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(subject);
			MimeMultipart multipart = new MimeMultipart("related");
			BodyPart bodyPart = new MimeBodyPart();
			String htmlText = "<div align='center'>" + content;
			if (path.size() == 1) {
				htmlText += "<img style='width:500px;' src='cid:image0'><br>";
			}
//			else {
//				for (int i = 0; i < path.size(); i++) {
//					htmlText += "<img style='width:250px;' src='cid:image" + i + "'><br>";
//				}
//			}
			htmlText += "</div>";
			bodyPart.setContent(htmlText, "text/html; charset=utf-8");
			multipart.addBodyPart(bodyPart);
			for (int i = 0; i < path.size(); i++) {
				bodyPart = new MimeBodyPart();
				DataSource ds = new FileDataSource(imgUrl + path.get(i));
				bodyPart.setDataHandler(new DataHandler(ds));
				bodyPart.setHeader("Content-ID", "<image" + i + ">");
				multipart.addBodyPart(bodyPart);
			}
			message.setContent(multipart);
			Transport transport = session.getTransport("smtp");
			transport.connect(host, from, pass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}
}
