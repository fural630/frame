package com.frame.dao;

import java.util.List;

import com.frame.entity.SysUserEntity;

public interface SysUserDao {
	
	List<SysUserEntity> selectAllUsers();
}
