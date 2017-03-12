package com.module.system.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.code.Page;
import com.code.view.MainPage;
import com.code.view.ReturnMessage;
import com.module.system.model.Platform;
import com.module.system.service.PlatformService;
import com.util.JsonUtil;

@Controller
@RequestMapping("system")
public class PlatformSiteLanguageManageController extends MainPage{
	
	@Autowired
	private PlatformService platformService;
	
	@RequestMapping("platformSiteLanguageManage")
	public String platfromSiteLanguageManage(Model model, Page page) {
		_execute(page, model);
		List<Map<String, Object>> collection = new ArrayList<>();
		model.addAttribute("collection", collection);
		return "system/platformSiteLanguageManage";
	}
	
	@RequestMapping("getPlatformList")
	@ResponseBody
	public String getPlatformList() {
		List<Platform> platformList = platformService.getPlatformList();
		return JsonUtil.toJsonStr(platformList);
	}
	
	@RequestMapping("getPlatformById")
	@ResponseBody
	public String getPlatformById(Integer id) {
		Platform platform = platformService.getPlatformById(id);
		return JsonUtil.toJsonStr(platform);
	}
	
}
