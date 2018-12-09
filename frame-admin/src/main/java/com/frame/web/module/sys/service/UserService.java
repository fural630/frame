package com.frame.web.module.sys.service;

import com.frame.web.module.sys.entity.UserDO;
import com.frame.web.module.sys.dao.UserDao;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

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
public class UserService extends ServiceImpl<UserDao, UserDO> {
	
	@Autowired
	private UserDao userDao;

	public List<UserDO> queryPage(Map<String, Object> query) {
		return userDao.queryPage(query);
	}

}
