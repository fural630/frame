package com.module.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.code.view.ReturnMessage;
import com.ctc.wstx.util.StringUtil;
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
	
	@RequestMapping("saveUserNavigator")
	@ResponseBody
	public String saveUserNavigator(Integer userId, String ids) {
		navigatorService.deleteNavigatoryByUserId(userId);
		if (StringUtils.isNotEmpty(ids)) {
			String idList[] = ids.split(",");
			for (String navId : idList) {
				Map<String, Integer> userNavigatorMap = new HashMap<String, Integer>();
				userNavigatorMap.put("userId", userId);
				userNavigatorMap.put("navigatorId", Integer.parseInt(navId));
				navigatorService.insertUserNavigator(userNavigatorMap);
			}
		}
		ReturnMessage returnMessage = new ReturnMessage();
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	
}
