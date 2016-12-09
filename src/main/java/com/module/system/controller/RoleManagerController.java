package com.module.system.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.code.Page;
import com.code.view.MainPage;
import com.code.view.ReturnMessage;
import com.module.system.model.Role;
import com.module.system.service.RoleService;
import com.util.JsonUtil;
import com.util.MyLocale;

@Controller
@RequestMapping("system")
public class RoleManagerController extends MainPage{
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("roleManage")
	public String roleManage(Model model, Page page){
		_execute(page, model);
		List<Map<String, Object>> collection = new ArrayList<Map<String,Object>>();
		model.addAttribute("collection", collection);
		return "system/roleManage";
	}
	
	@RequestMapping("saveRole")
	@ResponseBody
	public String saveRole (Role role) {
		ReturnMessage returnMessage = new ReturnMessage();
		if (null == role.getId()) {
			roleService.insertRole(role);
		} else {
			roleService.updateRole(role);
		}
		return JsonUtil.toJsonStr(returnMessage);
	}
	
}
