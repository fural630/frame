package com.code.session;

import java.util.List;

import com.frame.model.NavigatorList;

public class UserNavigatorSession {
	
	private final String NAVIGATORSESSION = "navigatorSession";
	
	private UserNavigatorSession(){
		
	}
	
	public List<NavigatorList> getNavigatorList() {
		SessionMap sessionMap = new SessionMap();
		return (List<NavigatorList>) sessionMap.get(NAVIGATORSESSION);
	}
	
	public void setNavigatorList(List<NavigatorList> navigatorLists) {
		SessionMap sessionMap = new SessionMap();
		sessionMap.put(NAVIGATORSESSION, navigatorLists);
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
