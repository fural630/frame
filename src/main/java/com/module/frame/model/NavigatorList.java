package com.module.frame.model;

import java.util.List;

public class NavigatorList {
	
	private String nameCn;
	private String iconClass;
	private String url;
	private List<NavigatorList> navigatorList;
	public String getNameCn() {
		return nameCn;
	}
	public void setNameCn(String nameCn) {
		this.nameCn = nameCn;
	}
	public String getIconClass() {
		return iconClass;
	}
	public void setIconClass(String iconClass) {
		this.iconClass = iconClass;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public List<NavigatorList> getNavigatorList() {
		return navigatorList;
	}
	public void setNavigatorList(List<NavigatorList> navigatorList) {
		this.navigatorList = navigatorList;
	}
}
