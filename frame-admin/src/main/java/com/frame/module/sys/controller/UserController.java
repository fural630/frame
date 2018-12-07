package com.frame.module.sys.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.frame.module.sys.entity.UserDO;
import com.frame.module.sys.entity.UserQuery;
import com.frame.module.sys.service.UserService;
import com.frame.util.R;

import sun.net.www.content.audio.wav;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author zhangzm
 * @since 2018-12-07
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
