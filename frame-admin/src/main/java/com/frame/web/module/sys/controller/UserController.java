package com.frame.web.module.sys.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import com.frame.util.R;
import com.frame.web.module.sys.entity.UserDO;
import com.frame.web.module.sys.service.UserService;

/**
 * <p>
 * InnoDB free: 8192 kB 前端控制器
 * </p>
 *
 * @author zhangzm
 * @since 2018-12-08
 */
 
@RestController
@RequestMapping("/sys/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/info/{id}")
	public R info(@PathVariable("id") Long id) {
		UserDO userDO = userService.getById(id);
		return R.ok().put("user", userDO);
	}
}
