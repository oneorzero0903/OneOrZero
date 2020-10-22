package com.oneorzero.bean;

import javax.servlet.http.HttpSession;

public class LogoutBean {
	HttpSession session;

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}
	
	public int getLogout() {
		session.invalidate();
		return 0;
	}
}
