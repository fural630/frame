package com.frame.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frame.dao.SysUserDao;
import com.frame.entity.SysUserEntity;

@Service
public class SysUserService {
	
	@Autowired
	private SysUserDao sysUserDao;
	
	public List<SysUserEntity> queryList(Map<String, Object> map) {
		return sysUserDao.queryList(map);
	}
	
}
