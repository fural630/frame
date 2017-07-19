package com.module.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.code.Page;
import com.module.system.model.PlatformSite;

public interface PlatformSiteDao {

	public List<PlatformSite> checkeSiteNameEnExist(String siteNameEn);

	public void insertPlatformSite(PlatformSite platformSite);

	public List<PlatformSite> checkSiteNameNoContainShelf(@Param("siteNameEn")String siteNameEn,
			@Param("id")Integer id);

	public void updatePlatformSite(PlatformSite platformSite);

	public List<Map<String, Object>> getPlatformSitePage(Page page);

	public PlatformSite getPlatformById(Integer id);
	
	public void deletePlatformById(Integer id);

	public List<PlatformSite> findAllSite();


}
