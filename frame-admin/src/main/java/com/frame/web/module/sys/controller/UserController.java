package com.frame.web.module.sys.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.frame.util.R;
import com.frame.validator.ValidatorUtils;
import com.frame.validator.group.AddGroup;
import com.frame.validator.group.UpdateGroup;
import com.frame.web.module.sys.dao.UserQuery;
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
	
	/**
	 * 新增
	 * @param userDO
	 * @return R.ok()
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public R save(@RequestBody UserDO userDO) {
		ValidatorUtils.validateEntity(userDO, AddGroup.class);
		userService.save(userDO);
		return R.ok();
	}
	
	/**
	 * 删除
	 * @param id
	 * @return R.ok()
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public R delete(@PathVariable("id") Long id) {
		userService.removeById(id);
		return R.ok();
	}
	
	/**
	 * 修改
	 * @param userDO
	 * @return R.ok()
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public R update(@RequestBody UserDO userDO) {
		ValidatorUtils.validateEntity(userDO, UpdateGroup.class);
		userService.updateById(userDO);
		return R.ok();
	}
	
	/**
	 * 查询
	 * @param id
	 * @return R.ok().put("user", userDO)
	 */
	@RequestMapping(value = "/info/{id}", method = RequestMethod.GET)
	public R info(@PathVariable("id") Long id) {
		UserDO userDO = userService.getById(id);
		return R.ok().put("user", userDO);
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public R list(UserQuery query) {
		Page<UserDO> page = new Page<UserDO>(1, 2);
		QueryWrapper<UserDO> queryWrapper = new QueryWrapper<>();
		queryWrapper.likeRight("pass_word", "str");
		IPage<UserDO> iPage = userService.page(page, queryWrapper);
		return R.ok().put("page", iPage);
	}
}
