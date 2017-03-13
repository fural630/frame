package com.module.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.module.system.model.Platform;

public interface PlatformDao {

	public List<Platform> getPlatformList();
	
	public Platform getPlatformById(Integer id);
	
	public void deletePlatformById(Integer id);
	
	public void updatePlatform(Platform platform);
	
	public Platform getPlatformByName(String name);
	
	public void insertPlatform(Platform platform);

	public List<Platform> getPlatformByNameNeId(@Param("platformName")String platformName, @Param("id")Integer id);


}
