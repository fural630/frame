package com.frame.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frame.entity.UserPO;
import com.frame.page.Page;
import com.frame.page.RePage;
import com.frame.service.SysUserService;

@Controller
@RequestMapping("/user")
public class SysUserController {
    
    private static final Logger logger = LoggerFactory.getLogger(SysUserController.class);
	
	@Autowired
	private SysUserService sysUserService;
	
	@RequestMapping("/getUserTable")
	@ResponseBody
	public RePage<UserPO> getUserTable(Page page) {
		return sysUserService.getUserTable(page);
	}
}
