package com.module.system.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.libraries.constentEnum.ReturnMessageEnum;
import com.code.Page;
import com.code.view.MainPage;
import com.code.view.ReturnMessage;
import com.module.system.model.Platform;
import com.module.system.service.PlatformService;
import com.util.JsonUtil;
import com.util.MyLocale;

@Controller
@RequestMapping("system")
public class PlatformSiteLanguageManageController extends MainPage{
	
	@Autowired
	private PlatformService platformService;
	
	@RequestMapping("platformSiteLanguageManage")
	public String platfromSiteLanguageManage(Model model, Page page) {
		_execute(page, model);
		List<Map<String, Object>> collection = new ArrayList<Map<String, Object>>();
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
	
	@RequestMapping("savePlatform")
	@ResponseBody
	public String savePlatform(Platform platform) {
		MyLocale myLocale = new MyLocale();
		ReturnMessage message = new ReturnMessage();
		boolean success = platformService.checkPlatformCanSave(platform);
		if (success) {
			if (null == platform.getId()) {
				platformService.insertPlatform(platform);
			} else {
				platformService.updatePlatform(platform);
			}
		} else {
			message.setStatus(ReturnMessageEnum.FAIL.getValue());
			message.setMessage(myLocale.getText("this.platform.is.exist", platform.getName()));
		}
		return JsonUtil.toJsonStr(message);
	}
	
	@RequestMapping("removePlatform")
	@ResponseBody
	public String removePlatform(Integer id) {
		platformService.deletePlatformById(id);
		ReturnMessage message = new ReturnMessage();
		return JsonUtil.toJsonStr(message);
	}
	
}
