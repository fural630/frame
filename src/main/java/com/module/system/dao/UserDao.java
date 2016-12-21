package com.module.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.code.Page;
import com.module.system.model.User;

public interface UserDao {
	public List<User> findAll();
	public List<Map<String, Object>> getUserPage(Page page);
	public User getUserByUserName(String username);
	public void insertUser(User user); 
	public User getUserById(Integer id);
	public void updateUser(User user);
	public User getUserByIdAndCreator(@Param("id") Integer id, @Param("loginUserId") Integer loginUserId);
	public void deleteUserById(Integer id);
	public List<User> findNoClosedAll();
}
