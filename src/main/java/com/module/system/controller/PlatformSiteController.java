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
import com.module.system.model.PlatformSite;
import com.module.system.service.PlatformSiteService;
import com.util.Dumper;
import com.util.JsonUtil;

@Controller
@RequestMapping("system")
public class PlatformSiteController extends MainPage{
	
	@Autowired
	private PlatformSiteService platformSiteService;
	
	@RequestMapping("platformSiteManage")
	public String platformSiteManage(Model model, Page page) {
		_execute(page, model);
		List<Map<String, Object>> collection = platformSiteService.getPlatformSitePage(page);
		model.addAttribute("collection", collection);
		return "system/platformSiteManage";
	}
	
	@RequestMapping("savePlatformSite")
	@ResponseBody
	public String savePlatformSite(PlatformSite platformSite) {
		ReturnMessage returnMessage = platformSiteService.savePlatformSite(platformSite);
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("editPlatformSite")
	@ResponseBody
	public String editPlatformSite(Integer id) {
		ReturnMessage returnMessage = new ReturnMessage();
		PlatformSite platformSite = platformSiteService.getPlatformById(id);
		if (null != platformSite) {
			returnMessage.setData(platformSite);
		}
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("deletePlatformById")
	@ResponseBody
	public String deletePlatformById(Integer id) {
		ReturnMessage returnMessage = new ReturnMessage();
		platformSiteService.deletePlatformById(id);
		return JsonUtil.toJsonStr(returnMessage);
	}
	
}
