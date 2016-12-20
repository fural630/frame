package com.code.navigator;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.collections.CollectionUtils;
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
								Navigator secondNavigator = navigatorDao.selectNavigatorByName(secondNavName);
								if (null == secondNavigator) {
									secondNavigator = new Navigator();
								}
								secondNavigator.setName(secondNavName);
								secondNavigator.setIconClass(secondIconClass);
								secondNavigator.setIsParent(0);
								secondNavigator.setNameCn(secondNameCn);
								secondNavigator.setUrl(url);
								secondNavigator.setParentId(parentId);
								if (null == secondNavigator.getId()) {
									navigatorDao.insertNavigator(secondNavigator);
								} else {
									navigatorDao.updateNavigator(secondNavigator);
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