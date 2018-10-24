package com.frame.dao;

import java.util.List;

import com.frame.entity.UserPO;

public interface SysUserDao {
	
	List<UserPO> selectAllUsers();
}
