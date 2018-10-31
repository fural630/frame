package com.frame.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.frame.entity.SysUserEntity;
import com.frame.page.Page;
import com.frame.page.RePage;
import com.frame.service.SysUserService;
import com.frame.util.Dumper;

@RestController
@RequestMapping("/sys/user")
public class SysUserController {
    
    private static final Logger logger = LoggerFactory.getLogger(SysUserController.class);
	
	@Autowired
	private SysUserService sysUserService;
	
	@RequestMapping("/list")
	public RePage<SysUserEntity> list(@RequestParam Map<String, Object> params, Page page) {
		Dumper.dump(params);
		return sysUserService.getUserTable(page);
	}
}
