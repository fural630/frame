package com.frame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frame.dao.SysUserDao;
import com.frame.entity.SysUserEntity;
import com.frame.page.Page;
import com.frame.page.RePage;
import com.frame.util.Dumper;
import com.github.pagehelper.PageHelper;

@Service
public class SysUserService {
	
	@Autowired
	private SysUserDao sysUserDao;
	
	public List<SysUserEntity> getUserList() {
		return sysUserDao.selectAllUsers();
	}

	public RePage<SysUserEntity> getUserTable(Page page) {
		PageHelper.startPage(page.getNowPage(), page.getPageSize());
		List<SysUserEntity> sysUserList = sysUserDao.selectAllUsers();
		Dumper.dump(sysUserList);
		return new RePage<SysUserEntity>(page, sysUserList);
	}
	
}
