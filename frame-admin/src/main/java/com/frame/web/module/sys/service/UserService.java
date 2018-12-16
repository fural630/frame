package com.frame.web.module.sys.service;

import com.frame.web.module.sys.entity.UserDO;
import com.frame.web.module.sys.dao.UserDao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * InnoDB free: 8192 kB 服务实现类11
 * </p>
 *
 * @author zhangzm
 * @since 2018-12-08
 */
@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;

	public void insert(UserDO userDO) {
		userDao.insert(userDO);
	}

	public void deleteById(String id) {
		userDao.deleteById(id);
	}

	public void deleteBatchIds(List<String> ids) {
		userDao.deleteBatchIds(ids);
	}

	public void updateById(UserDO userDO) {
		userDao.updateById(userDO);
	}

	public UserDO selectById(String id) {
		return userDao.selectById(id);
	}
	
	public List<UserDO> queryPage(Map<String, Object> query) {
		return userDao.queryPage(query);
	}
	

}
