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
import com.module.system.service.PlatformService;

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
//		platformService.getPlatformList();
		return null;
	}
	
}
