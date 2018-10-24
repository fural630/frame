package com.frame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frame.dao.SysUserDao;
import com.frame.entity.UserPO;

@Service
public class SysUserService {
	
	@Autowired
	private SysUserDao sysUserDao;
	
	public List<UserPO> getUserList() {
		return sysUserDao.selectAllUsers();
	}
	
}
