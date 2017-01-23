package com.module.shopee.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.code.Page;
import com.code.view.MainPage;

@Controller
@RequestMapping("shopee")
public class ShopeePublishManageController extends MainPage{
	
	@RequestMapping("shopeePublishManage")
	public String shopeeCategoryManage(Model model, Page page){
		_execute(page, model);
		List<Map<String, Object>> collection = new ArrayList<>();
		model.addAttribute("collection", collection);
		return "shopee/shopeePublishManage";
	}
}
