package com.oneorzero.forgetPwd.dao.impl;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.forgetPwd.dao.IUserForgetPwdDaoI;
import com.oneorzero.util.SendMail;

@Repository
public class UserForgetPwdDaoImpl implements IUserForgetPwdDaoI {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public MemberBean checkAccountExist(String account) {
		
		MemberBean member = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean WHERE email = :email";
		
		try {
			member = (MemberBean) session.createQuery(hql)
					.setParameter("email", account)
					.getSingleResult();
		} catch (Exception e) {
			return null;
		}
		if (member != null) {
			String newPwd = generateSixVerifier();
			member.setPassword(newPwd);
			member.setResetPwd(1);
			session.save(member);
			String subject = "你的search(\"咖啡\");臨時密碼";
			SendMail mail = new SendMail();
			mail.sendEmail(account, subject, newPwd);
		}
		return member;

	}

	public String generateSixVerifier() {
		
		int numCount = (int)(Math.random()*7);
		int charCount = 6 - numCount;
		String numString ="";
		String charString="";
		
		if(numCount>0) {
			for(int i=1; i<=numCount; i++) {
				numString += (int)(Math.random()*10);   // generate String with 0~9 number
			}
		}
		if(charCount>0) {
			charString= generateRndChar(charCount);
		}
		
		String mix = numString + charString;
		String result = "";
		
		int[] rndIndexArr = rndIndexArr();
		
		for (int i=0; i<=5; i++) {
			result += mix.charAt(rndIndexArr[i]);
		}
		
		return result;
	}
	
	private String generateRndChar(int count) {  // generate a-z-A-Z
		
		String charString = "";
		
		for (int i=1; i<=count; i++) {
			int num = (int)(Math.random()*52);   // generate 0~51,   'a' + 0 = 'a'
			char base = (num < 26)? 'A' : 'a';
			charString += (char)(base + num%26);
		}
		
		return charString;
	}
	
	private int[] rndIndexArr() {
		int[] arr = new int[6];
		for (int i=0; i<arr.length; i++) {
			arr[i] = (int)(Math.random()*6);
			
			for(int j=0; j<i; j++) {
				if(arr[i] == arr[j]) {
					i--;
				}
			}
		}
		return arr;
	}
}
