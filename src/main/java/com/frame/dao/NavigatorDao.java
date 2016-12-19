package com.frame.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.frame.model.Navigator;

public interface NavigatorDao {
	public void insertNavigator(Navigator navigator);
	public Navigator selectNavigatorByName(String name);
	public void updateNavigator(Navigator navigator);
	public void deleteNavigatorById(Integer id);
	public Navigator getNavigatorById(Integer id);
	public Navigator getNavigatorByParentId(Integer id);
	public List<Navigator> findAll();
	public List<Navigator> getUserNavigator(@Param("userId")Integer userId, @Param("parentId")Integer parentId);
	public List<Map<String, Object>> loadNavigatorTreeByUserId(Integer userId);
}
