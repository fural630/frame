package com.module.frame.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.module.frame.model.Navigator;

public interface NavigatorDao {
	public void insertNavigator(Navigator navigator);
	public Navigator selectNavigatorByName(String name);
	public Navigator selectNavigatorByLink(String link);
	public void updateNavigator(Navigator navigator);
	public void deleteNavigatorById(Integer id);
	public Navigator getNavigatorById(Integer id);
	public Navigator getNavigatorByParentId(Integer id);
	public List<Navigator> findAll();
	public List<Navigator> getUserNavigator(@Param("userId")Integer userId, @Param("parentId")Integer parentId);
	public List<Map<String, Object>> loadNavigatorTreeByUserId(Integer userId);
	public void deleteUserNavigatorByUserId(Integer userId);
	public void insertUserNavigator(Map<String, Integer> userNavigatorMap);
	public void deleteNavigatorNotInName(List<String> navigatorNameList);
	public List<String> getUserPermissionUrlByUserId(Integer userId);
	public List<String> getUserPermissionButtonByUserId(Integer userId);
}