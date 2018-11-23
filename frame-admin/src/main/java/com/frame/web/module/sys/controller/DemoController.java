package com.frame.web.module.sys.controller;


import java.util.Collection;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.frame.util.Query;
import com.frame.util.R;
import com.frame.web.module.sys.entity.Demo;
import com.frame.web.module.sys.service.impl.DemoServiceImpl;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangzm
 * @since 2018-11-23
 */
@RestController
@RequestMapping("/sys/demo")
public class DemoController {
	
private static final Logger log = LoggerFactory.getLogger(DemoController.class);
	
	@Autowired
	private DemoServiceImpl demoServiceImpl;

	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params) {
		Query query = new Query(params);
		Collection<Demo> demoList = demoServiceImpl.list(null);
		return R.ok().put("page", demoList);
	}
}
