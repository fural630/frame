package com.module.system.service;

import java.util.List;

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

}
