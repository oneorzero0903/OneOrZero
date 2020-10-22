package com.oneorzero.util;

import java.io.FileInputStream;
import java.util.Properties;

public class Config {
	private Properties p = null;
	public Config (String properties) {
		try {
			p = new Properties();
			p.load(new FileInputStream(properties));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getValue(String key) {
		return p.get(key).toString();
	}
}
