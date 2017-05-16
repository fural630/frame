package com.module.system.service;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.module.system.dao.PlatformSiteDao;
import com.module.system.model.PlatformSite;

@Service
public class PlatformSiteService {
	
	@Autowired(required = false)
	private PlatformSiteDao platformDao;

	public List<PlatformSite> getPlatformList() {
		return platformDao.getPlatformList();
	}

	public PlatformSite getPlatformById(Integer id) {
		return platformDao.getPlatformById(id);
	}

	public PlatformSite getPlatformByName(String platfromName) {
		return platformDao.getPlatformByName(platfromName);
	}

	public void insertPlatform(PlatformSite platform) {
		platformDao.insertPlatform(platform);
	}

	public boolean checkPlatformCanSave(PlatformSite platform) {
		if (platform.getId() == null) {	//create
			PlatformSite temPlatform = getPlatformByName(platform.getName());
			if (temPlatform == null) {
				return true;
			}
		} else {	//edit
			List<PlatformSite> platformList = getPlatformByNameNeId(platform.getName(), platform.getId());
			if (CollectionUtils.isEmpty(platformList)) {
				return true;
			}
		}
		return false;
	}
	
	public List<PlatformSite> getPlatformByNameNeId(String platformName, Integer id) {
		return platformDao.getPlatformByNameNeId(platformName, id);
	}

	public void updatePlatform(PlatformSite platform) {
		platformDao.updatePlatform(platform);
	}
	
	public void deletePlatformById(Integer id) {
		platformDao.deletePlatformById(id);
	}

}
