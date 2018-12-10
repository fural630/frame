package com.frame.web.module.sys.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.frame.web.module.sys.service.RegionService;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhangzm
 * @since 2018-12-10
 */
 
@RestController
@RequestMapping("/sys/region")
public class RegionController {

	private static final Logger logger = LoggerFactory.getLogger(RegionController.class);

	@Autowired
	private RegionService regionService;

}
