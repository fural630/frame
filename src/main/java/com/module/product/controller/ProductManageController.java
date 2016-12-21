package com.module.product.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.code.Page;
import com.code.view.MainPage;
import com.module.product.service.ProductService;

@Controller
@RequestMapping("product")
public class ProductManageController extends MainPage{
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("productManage")
	public String userManage(Model model, Page page){
		_execute(page, model);
		List<Map<String, Object>> collection = productService.getProductPage(page);
		model.addAttribute("collection", collection);
		return "product/productManage";
	}
	
	@RequestMapping("test")
	public String test() {
		return "product/test";
	}
}
