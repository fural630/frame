package com.module.shopee.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.libraries.constentEnum.ReturnMessageEnum;
import com.code.Page;
import com.code.view.MainPage;
import com.code.view.ReturnMessage;
import com.module.product.model.Product;
import com.module.product.service.ProductService;
import com.module.shopee.model.ShopeeCategory;
import com.module.shopee.service.ShopeeCategoryService;
import com.module.shopee.service.ShopeePublishService;
import com.util.JsonUtil;
import com.util.MyLocale;
import com.util.TextAreaUtil;

@Controller
@RequestMapping("shopee")
public class ShopeePublishManageController extends MainPage{
	
	@Autowired
	private ShopeeCategoryService shopeeCategoryService;
	@Autowired
	private ShopeePublishService shopeePublishService;
	@Autowired
	private ProductService productService;
	
	@RequestMapping("shopeePublishManage")
	public String shopeePublishManage(Model model, Page page){
		_execute(page, model);
		List<Map<String, Object>> collection = shopeePublishService.getShopeePublishManagePage(page);
		Integer userShopeeSkuCount = shopeePublishService.getUserShopeeSkuCount();
		model.addAttribute("collection", collection);
		model.addAttribute("userShopeeSkuCount", userShopeeSkuCount);
		return "shopee/shopeePublishManage";
	}
	
	@RequestMapping("getShopeeCategoryByParentId")
	@ResponseBody
	public String getShopeeCategoryByParentId(Integer parentId) {
		List<ShopeeCategory> categories = shopeeCategoryService.getShopeeCategoryByParentId(parentId);
		return JsonUtil.toJsonStr(categories);
	}
	
	@RequestMapping("getShopeeSkuList")
	@ResponseBody
	public String getShopeeSkuList() {
		List<Product> productList = shopeePublishService.getShopeeSkuList();
		return JsonUtil.toJsonStr(productList);
	}
	
	@RequestMapping("obtainShopeePublishSku")
	@ResponseBody
	public String obtainShopeePublishSku(@RequestParam(value = "productIdList[]", required = false) List<String> productIdList) {
		ReturnMessage message = new ReturnMessage();
		boolean flag = shopeePublishService.obtainShopeePublishSku(productIdList);
		return JsonUtil.toJsonStr(message);
	}
	
	@RequestMapping("deleteShopeeProduct")
	@ResponseBody
	public String deleteShopeeProduct(Integer id) {
		ReturnMessage message = new ReturnMessage();
		shopeePublishService.deleteShopeeProduct(id);
		return JsonUtil.toJsonStr(message);
	}
	
	@RequestMapping("getProductInfoBySku")
	@ResponseBody
	public String getProductInfoBySku(String sku) {
		Product product = productService.getProductBySku(sku);
		ReturnMessage message = new ReturnMessage();
		if (null == product) {
			MyLocale myLocale = new MyLocale();
			message.setStatus(ReturnMessageEnum.WARRING.getValue());
			message.setMessage(myLocale.getText("not.found.product.info.by.sku", sku));
		} else {
			Map<String, Object> resutMap = new HashMap<String, Object>();
			List<String> imageList = productService.getProductImage(product.getId());
			resutMap.put("sku", sku);
			resutMap.put("spu", product.getSpu());
			resutMap.put("productName", product.getNameEn());
			resutMap.put("weight", product.getPackageWeight());
			String descriptionEn = product.getDescriptionEn();
			String tempDescription = TextAreaUtil.removeHtmlTag(descriptionEn);
			resutMap.put("description", tempDescription);
			resutMap.put("imageList", imageList);
			message.setData(resutMap);
		}
		return JsonUtil.toJsonStr(message);
	}
}
