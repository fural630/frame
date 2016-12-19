package com.code.navigator;

import java.io.File;
import java.io.IOException;
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
import com.frame.service.NavigatorService;
import com.util.MyLocale;
import com.util.SystemInfo;

public class InitSystemServlet extends HttpServlet{
	
	private NavigatorService navigatorService;
	
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
//		String navigatorFile = "D:\\MyEclipse10-workspace\\frame\\src\\main\\webapp\\design\\layout\\navigator";
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
					for (Element firstNavElement : firstNavElementList) {
						String firstNavName = firstNavElement.getName();
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
				}
			} catch (JDOMException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}