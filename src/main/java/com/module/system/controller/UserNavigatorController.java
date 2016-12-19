package com.module.system.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frame.service.NavigatorService;
import com.util.JsonUtil;

@Controller
@RequestMapping("system")
public class UserNavigatorController {
	
	@Autowired
	private NavigatorService navigatorService;
	
	@RequestMapping("userNavigator")
	public String userNavigator() {
		return "system/userNavigator";
	}
	
	@RequestMapping("loadNavigatorTree")
	@ResponseBody
	public String loadNavigatorTree(Integer userId) {
		List<Map<String, Object>> zTreeData = navigatorService.loadNavigatorTreeByUserId(userId);
		return JsonUtil.toJsonStr(zTreeData);
	}
	
	
}
