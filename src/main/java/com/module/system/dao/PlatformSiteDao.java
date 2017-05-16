package com.module.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.module.system.model.PlatformSite;

public interface PlatformSiteDao {

	public List<PlatformSite> getPlatformList();
	
	public PlatformSite getPlatformById(Integer id);
	
	public void deletePlatformById(Integer id);
	
	public void updatePlatform(PlatformSite platform);
	
	public PlatformSite getPlatformByName(String name);
	
	public void insertPlatform(PlatformSite platform);

	public List<PlatformSite> getPlatformByNameNeId(@Param("platformName")String platformName, @Param("id")Integer id);


}
