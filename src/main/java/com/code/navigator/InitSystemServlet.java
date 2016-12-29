package com.code.navigator;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

import com.code.frame.SpringContextUtil;
import com.frame.dao.NavigatorDao;
import com.frame.model.Navigator;
import com.util.MyLocale;
import com.util.SystemInfo;

public class InitSystemServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	private NavigatorDao navigatorDao = (NavigatorDao) SpringContextUtil.getBean("navigatorDao");
	private MyLocale myLocale = new MyLocale();
	private List<String> deleteNavigaorList = new ArrayList<String>();
	
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
			SAXBuilder builder = new SAXBuilder();
			try {
				Document document = builder.build(file);
				Element rootElement = document.getRootElement();
				List<Element> childrenElementList = rootElement.getChildren();
				if (CollectionUtils.isNotEmpty(childrenElementList)) {
					parseElementList(childrenElementList, 0);
				}
				if (CollectionUtils.isNotEmpty(deleteNavigaorList)) {
					navigatorDao.deleteNavigatorNotInName(deleteNavigaorList);
				}
			} catch (JDOMException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		}
		
	}
	
	private void parseElementList(List<Element> childrenElementList, Integer parentId) {
		for (Element element : childrenElementList) {
			String navName = element.getName();
			String nameCn = myLocale.getText(navName);
			String iconClass = element.getAttributeValue("icon");
			Integer sort = null;
			if (StringUtils.isNotEmpty(element.getAttributeValue("sort"))) {
				try {
					sort = Integer.parseInt(element.getAttributeValue("sort"));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			Navigator navigator = null;
			String link = element.getAttributeValue("link");
			if (StringUtils.isNotEmpty(link)) {
				navigator = navigatorDao.selectNavigatorByLink(link);
			} else {
				navigator = navigatorDao.selectNavigatorByName(navName);
			}
			if (null == navigator) {
				navigator = new Navigator();
			} 
			navigator.setName(navName);
			deleteNavigaorList.add(navName);
			navigator.setIconClass(iconClass);
			navigator.setNameCn(nameCn);
			navigator.setSort(sort);
			navigator.setParentId(parentId);
			navigator.setUrl(link);
			
			List<Element> childElementList = element.getChildren();
			if (CollectionUtils.isNotEmpty(childElementList)) {
				navigator.setIsParent(1);
			} else {
				navigator.setIsParent(0);
			}
			if (null == navigator.getId()) {
				navigatorDao.insertNavigator(navigator);
			} else {
				navigatorDao.updateNavigator(navigator);
			}
			if (CollectionUtils.isNotEmpty(childElementList)) {
				parseElementList(childElementList, navigator.getId());
			}
		}
		
	}

	public void initNavigator2() {
		String navigatorFile = SystemInfo.getAppPath() + "design/layout/navigator";
		NavigatorDao navigatorDao = (NavigatorDao) SpringContextUtil.getBean("navigatorDao");
		MyLocale myLocale = new MyLocale();
		File root = new File(navigatorFile);
		File[] fs = root.listFiles();
		for (File file : fs) {
			SAXBuilder builder = new SAXBuilder();
			try {
				Document document = builder.build(file);
				Element rootElement = document.getRootElement();
				List<Element> firstNavElementList = rootElement.getChildren();
				if (CollectionUtils.isNotEmpty(firstNavElementList)) {
					List<String> navigatorNameList = new ArrayList<String>();
					for (Element firstNavElement : firstNavElementList) {
						String firstNavName = firstNavElement.getName();
						navigatorNameList.add(firstNavName);
						String firstNavNameCn = myLocale.getText(firstNavName);
						String firstIconClass = firstNavElement.getAttributeValue("icon");
						Integer sort = java.lang.Integer.parseInt(firstNavElement.getAttributeValue("sort"));
						Navigator firstNavigator = navigatorDao.selectNavigatorByName(firstNavName);
						if (null == firstNavigator) {
							firstNavigator = new Navigator();
						} 
						firstNavigator.setName(firstNavName);
						firstNavigator.setIconClass(firstIconClass);
						firstNavigator.setIsParent(1);
						firstNavigator.setNameCn(firstNavNameCn);
						firstNavigator.setSort(sort);
						firstNavigator.setParentId(0);
						if (null == firstNavigator.getId()) {
							navigatorDao.insertNavigator(firstNavigator);
						} else {
							navigatorDao.updateNavigator(firstNavigator);
						}
						Integer parentId = firstNavigator.getId();
						List<Element> secondNavElementList = firstNavElement.getChildren();
						if (CollectionUtils.isNotEmpty(secondNavElementList)) {
							for (Element secondNavElement : secondNavElementList) {
								String secondNavName = secondNavElement.getName();
								navigatorNameList.add(secondNavName);
								String secondNameCn = myLocale.getText(secondNavName);
								String secondIconClass = secondNavElement.getAttributeValue("icon");
								String url = secondNavElement.getAttributeValue("link");
								Navigator secondNavigator = navigatorDao.selectNavigatorByLink(url);
								if (null == secondNavigator) {
									secondNavigator = new Navigator();
								}
								secondNavigator.setName(secondNavName);
								secondNavigator.setIconClass(secondIconClass);
								List<Element> thirdNavElementList = secondNavElement.getChildren();
								if (CollectionUtils.isEmpty(thirdNavElementList)) {
									secondNavigator.setIsParent(0);
								} else {
									secondNavigator.setIsParent(1);
								}
								secondNavigator.setNameCn(secondNameCn);
								secondNavigator.setUrl(url);
								secondNavigator.setParentId(parentId);
								if (null == secondNavigator.getId()) {
									navigatorDao.insertNavigator(secondNavigator);
								} else {
									navigatorDao.updateNavigator(secondNavigator);
								}
								Integer pid = secondNavigator.getId();
								if (CollectionUtils.isNotEmpty(thirdNavElementList)) {
									for (Element thirdNavElement : thirdNavElementList) {
										String thirdNavName = thirdNavElement.getName();
										navigatorNameList.add(thirdNavName);
										String thirdNavNameCn = myLocale.getText(thirdNavName);
										String link = thirdNavElement.getAttributeValue("link");
										Navigator buttomNavigator = navigatorDao.selectNavigatorByLink(link);
										if (null == buttomNavigator) {
											buttomNavigator = new Navigator();
										}
										buttomNavigator.setName(thirdNavName);
										buttomNavigator.setIsParent(0);
										buttomNavigator.setNameCn(thirdNavNameCn);
										buttomNavigator.setUrl(link);
										buttomNavigator.setParentId(pid);
										if (null == buttomNavigator.getId()) {
											navigatorDao.insertNavigator(buttomNavigator);
										} else {
											navigatorDao.updateNavigator(buttomNavigator);
										}
									}
								}
							}
						}
					}
					if (CollectionUtils.isNotEmpty(navigatorNameList)) {
						navigatorDao.deleteNavigatorNotInName(navigatorNameList);
					}
				}
			} catch (JDOMException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}