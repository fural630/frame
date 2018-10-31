package com.frame.dao;

import java.util.List;

import com.frame.entity.SysUserEntity;

public interface SysUserDao extends BaseDao<SysUserEntity>{
	
	List<SysUserEntity> selectAllUsers();
}
