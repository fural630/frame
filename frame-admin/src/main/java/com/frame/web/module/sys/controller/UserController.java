package com.frame.web.module.sys.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.frame.util.R;
import com.frame.web.module.sys.entity.User;
import com.frame.web.module.sys.service.impl.UserServiceImpl;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zhangzm
 * @since 2018-11-23
 */
@RestController
@RequestMapping("/sys/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserServiceImpl userServiceImpl;

	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params) {
		List<User> userList = userServiceImpl.list(null);
		return R.ok().put("list", userList);
	}

}
