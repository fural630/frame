package com.code.navigator;

import java.io.File;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.util.Dumper;
import com.util.SystemInfo;

public class InitSystemServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public InitSystemServlet() {
		super();
	}

	public void init() throws ServletException {
		try {
			initNavigator();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public void initNavigator() {
		String navigatorFile = SystemInfo.getAppPath() + "design/layout/navigator";
		File root = new File(navigatorFile);
		File[] fs = root.listFiles();
		for (File file : fs) {
			
		}
	}
}