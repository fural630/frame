package com.module.system.service;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.module.system.dao.PlatformDao;
import com.module.system.model.Platform;

@Service
public class PlatformService {
	
	@Autowired(required = false)
	private PlatformDao platformDao;

	public List<Platform> getPlatformList() {
		return platformDao.getPlatformList();
	}

	public Platform getPlatformById(Integer id) {
		return platformDao.getPlatformById(id);
	}

	public Platform getPlatformByName(String platfromName) {
		return platformDao.getPlatformByName(platfromName);
	}

	public void insertPlatform(Platform platform) {
		platformDao.insertPlatform(platform);
	}

	public boolean checkPlatformCanSave(Platform platform) {
		if (platform.getId() == null) {	//create
			Platform temPlatform = getPlatformByName(platform.getName());
			if (temPlatform == null) {
				return true;
			}
		} else {	//edit
			List<Platform> platformList = getPlatformByNameNeId(platform.getName(), platform.getId());
			if (CollectionUtils.isEmpty(platformList)) {
				return true;
			}
		}
		return false;
	}
	
	public List<Platform> getPlatformByNameNeId(String platformName, Integer id) {
		return platformDao.getPlatformByNameNeId(platformName, id);
	}

	public void updatePlatform(Platform platform) {
		platformDao.updatePlatform(platform);
	}
	
	public void deletePlatformById(Integer id) {
		platformDao.deletePlatformById(id);
	}

}
