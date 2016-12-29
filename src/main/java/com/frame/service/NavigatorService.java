package com.frame.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.code.session.UserNavigatorSession;
import com.code.session.UserSingleton;
import com.frame.dao.NavigatorDao;
import com.frame.model.Navigator;
import com.frame.model.NavigatorList;
import com.module.system.model.User;

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
		List<NavigatorList> navigatorLists = parseUserNavigator(userId, 0);
		return navigatorLists;
	}

	private List<NavigatorList> parseUserNavigator(Integer userId, Integer parentId) {
		List<Navigator> userNavigators = navigatorDao.getUserNavigator(userId, parentId);
		if (CollectionUtils.isNotEmpty(userNavigators)) {
			List<NavigatorList> navigatorLists = new ArrayList<NavigatorList>();
			for (Navigator navigator : userNavigators) {
				NavigatorList navigatorList = new NavigatorList();
				navigatorList.setIconClass(navigator.getIconClass());
				navigatorList.setNameCn(navigator.getNameCn());
				navigatorList.setUrl(navigator.getUrl());
				navigatorList.setNavigatorList(parseUserNavigator(userId, navigator.getId()));
				navigatorLists.add(navigatorList);
			}
			return navigatorLists;
		} 
		return null;
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

	public List<NavigatorList> initPermission() {
		User user = UserSingleton.getInstance().getUser();
		
		List<NavigatorList> navigatorLists = UserNavigatorSession.getInstance().getNavigatorList();
		if (CollectionUtils.isEmpty(navigatorLists)) {
			navigatorLists = this.parasNavigator(user.getId());
			UserNavigatorSession.getInstance().setNavigatorList(navigatorLists);
		}
		
		List<String> permissionUrlList = UserNavigatorSession.getInstance().getPermissionUrlList();
		if (CollectionUtils.isEmpty(permissionUrlList)) {
			permissionUrlList = navigatorDao.getUserPermissionUrlByUserId(user.getId());
			UserNavigatorSession.getInstance().setPermissionUrlList(permissionUrlList);
		}
		
		List<String> permissionButtonList = UserNavigatorSession.getInstance().getPermissionButtonList();
		if (CollectionUtils.isEmpty(permissionButtonList)) {
			permissionButtonList = navigatorDao.getUserPermissionButtonByUserId(user.getId());
			UserNavigatorSession.getInstance().setPermissionButtonList(permissionButtonList);
		}
		
		return navigatorLists;
	}
	
}
