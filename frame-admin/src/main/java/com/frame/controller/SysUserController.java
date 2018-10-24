package com.frame.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frame.entity.UserPO;
import com.frame.service.SysUserService;

@Controller
@RequestMapping("user")
public class SysUserController {
	
	@Autowired
	private SysUserService sysUserService;
	
	@RequestMapping("list")
	public String list() {
		List<UserPO> userPOList = sysUserService.getUserList();
		System.out.println(userPOList.size());
		return "user/list";
	}
}
