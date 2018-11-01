package com.frame.controller;

import java.util.List;
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
import com.frame.util.Query;
import com.github.pagehelper.PageHelper;

@RestController
@RequestMapping("/sys/user")
public class SysUserController {
    
    private static final Logger logger = LoggerFactory.getLogger(SysUserController.class);
	
	@Autowired
	private SysUserService sysUserService;
	
	@RequestMapping("/list")
	public RePage<SysUserEntity> list(@RequestParam Map<String, Object> params, Page page) {
		Query query = new Query(params);
		PageHelper.startPage(page.getNowPage(), page.getPageSize());
		List<SysUserEntity> userList = sysUserService.queryList(query);
		RePage<SysUserEntity> rePage = new RePage<SysUserEntity>(page, userList);
		return rePage;
	}
}
