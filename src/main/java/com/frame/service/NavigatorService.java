package com.frame.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frame.dao.NavigatorDao;
import com.frame.model.Navigator;
import com.frame.model.NavigatorList;
import com.util.Dumper;

@Service
public class NavigatorService {
	
	@Autowired(required = false)
	private NavigatorDao navigatorDao;
	
	public void insertNavigator(Navigator navigator){
		navigatorDao.insertNavigator(navigator);
	}
	
	public Navigator selectNavigatorByName(String name) {
		return navigatorDao.selectNavigatorByName(name);
	}
	
	public void updateNavigator(Navigator navigator) {
		navigatorDao.updateNavigator(navigator);
	}
	
	public void deleteNavigatorById(Integer id) {
		navigatorDao.deleteNavigatorById(id);
	}
	
	public Navigator getNavigatorById(Integer id) {
		return navigatorDao.getNavigatorById(id);
	}
	public Navigator getNavigatorByParentId(Integer id) {
		return navigatorDao.getNavigatorByParentId(id);
	}
	public List<Navigator> findAll() {
		return navigatorDao.findAll();
	}

	public List<NavigatorList> parasNavigator(Integer userId) {
		List<NavigatorList> navigatorLists = new ArrayList<NavigatorList>();
		List<Navigator> firstNavigators = navigatorDao.getUserNavigator(userId, 0);
		if (CollectionUtils.isNotEmpty(firstNavigators)) {
			for (Navigator navigator : firstNavigators) {
				NavigatorList navigatorList = new NavigatorList();
				navigatorList.setIconClass(navigator.getIconClass());
				navigatorList.setNameCn(navigator.getNameCn());
				Integer id = navigator.getId();
				List<Navigator> secondNavigators = navigatorDao.getUserNavigator(userId, id);
				if (CollectionUtils.isNotEmpty(secondNavigators)) {
					List<NavigatorList> navigatorLists2 = new ArrayList<NavigatorList>();
					for (Navigator navigator2 : secondNavigators) {
						NavigatorList navigatorList2 = new NavigatorList();
						navigatorList2.setIconClass(navigator2.getIconClass());
						navigatorList2.setUrl(navigator2.getUrl());
						navigatorList2.setNameCn(navigator2.getNameCn());
						navigatorLists2.add(navigatorList2);
					}
					navigatorList.setNavigatorList(navigatorLists2);
				}
				navigatorLists.add(navigatorList);
			}
		}
		return navigatorLists;
	}

	public List<Map<String, Object>> loadNavigatorTreeByUserId(Integer userId) {
		return navigatorDao.loadNavigatorTreeByUserId(userId);
	}

	public void deleteNavigatoryByUserId(Integer userId) {
		navigatorDao.deleteUserNavigatorByUserId(userId);
	}

	public void insertUserNavigator(Map<String, Integer> userNavigatorMap) {
		navigatorDao.insertUserNavigator(userNavigatorMap);
	}
	
}
