package com.module.system.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.code.Page;
import com.code.view.MainPage;
import com.module.system.service.PlatformSiteService;

@Controller
@RequestMapping("system")
public class PlatformSiteController extends MainPage{
	
	@Autowired
	private PlatformSiteService platformSiteService;
	
	@RequestMapping("platformSiteManage")
	public String platformSiteManage(Model model, Page page) {
		_execute(page, model);
		List<Map<String, Object>> collection = new ArrayList<Map<String, Object>>();
		model.addAttribute("collection", collection);
		return "system/platformSiteManage";
	}
	
}
