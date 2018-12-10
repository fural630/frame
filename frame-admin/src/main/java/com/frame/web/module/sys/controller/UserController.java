package com.frame.web.module.sys.controller;


import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.frame.util.Query;
import com.frame.util.R;
import com.frame.validator.ValidatorUtils;
import com.frame.validator.group.AddGroup;
import com.frame.validator.group.UpdateGroup;
import com.frame.web.module.sys.entity.UserDO;
import com.frame.web.module.sys.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

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
	
	/**
	 * 分页查询
	 * @param params
	 * @return R.ok().put("page", pageInfo);
	 */
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public R page(@RequestParam Map<String, Object> params) {
		Query query = new Query(params);
		PageHelper.startPage(query.getPage(), query.getLimit());
		PageInfo<UserDO> pageInfo = new PageInfo<UserDO>(userService.queryPage(query));
		return R.ok().put("page", pageInfo);
	}
}
