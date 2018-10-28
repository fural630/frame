package com.frame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frame.dao.SysUserDao;
import com.frame.entity.UserPO;
import com.frame.page.Page;
import com.frame.page.RePage;
import com.github.pagehelper.PageHelper;

@Service
public class SysUserService {
	
	@Autowired
	private SysUserDao sysUserDao;
	
	public List<UserPO> getUserList() {
		return sysUserDao.selectAllUsers();
	}

	public RePage<UserPO> getUserTable(Page page) {
		PageHelper.startPage(page.getNowPage(), page.getPageSize());
		List<UserPO> userPoList = sysUserDao.selectAllUsers();
		return new RePage<UserPO>(page, userPoList);
	}
	
}
