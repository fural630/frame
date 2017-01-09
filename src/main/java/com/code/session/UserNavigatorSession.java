package com.code.session;

import java.util.List;

import com.module.frame.model.NavigatorList;

public class UserNavigatorSession {
	
	private final String NAVIGATOR_SESSION = "navigatorSession";
	private final String URL_SESSION = "urlSession";
	private final String BUTTON_SESSION = "buttonSession";
	
	private UserNavigatorSession(){
		
	}
	
	public List<NavigatorList> getNavigatorList() {
		SessionMap sessionMap = new SessionMap();
		return (List<NavigatorList>) sessionMap.get(NAVIGATOR_SESSION);
	}
	
	public void setNavigatorList(List<NavigatorList> navigatorLists) {
		SessionMap sessionMap = new SessionMap();
		sessionMap.put(NAVIGATOR_SESSION, navigatorLists);
	}
	
	public List<String> getPermissionUrlList () {
		SessionMap sessionMap = new SessionMap();
		return (List<String>) sessionMap.get(URL_SESSION);
	}
	
	public void setPermissionUrlList(List<String> urlList) {
		SessionMap sessionMap = new SessionMap();
		sessionMap.put(URL_SESSION, urlList);
	}
	
	public List<String> getPermissionButtonList () {
		SessionMap sessionMap = new SessionMap();
		return (List<String>) sessionMap.get(BUTTON_SESSION);
	}
	
	public void setPermissionButtonList(List<String> nameList) {
		SessionMap sessionMap = new SessionMap();
		sessionMap.put(BUTTON_SESSION, nameList);
	}
	
	public static UserNavigatorSession getInstance() {
		return UserNavigatorSessionHolder.INSTANCE;
	}

	private static class UserNavigatorSessionHolder {
		private static final UserNavigatorSession INSTANCE = new UserNavigatorSession();
		private UserNavigatorSessionHolder() {
		}
	}
}
