package com.module.shopee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.hamcrest.core.IsNot;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.libraries.constentEnum.ReturnMessageEnum;
import com.code.Page;
import com.code.view.MainPage;
import com.code.view.ReturnMessage;
import com.google.gson.Gson;
import com.module.product.model.Product;
import com.module.product.service.ProductService;
import com.module.shopee.model.ShopeeCategory;
import com.module.shopee.model.ShopeePublish;
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
		Gson gson = new Gson();
		ReturnMessage message = new ReturnMessage();
		Product product = productService.getProductBySku(sku);
		if (null == product) {
			MyLocale myLocale = new MyLocale();
			message.setStatus(ReturnMessageEnum.WARRING.getValue());
			message.setMessage(myLocale.getText("not.found.product.info.by.sku", sku));
		} else {
			ShopeePublish shopeePublish = new ShopeePublish();
			shopeePublish.setSku(product.getSku());
			shopeePublish.setParentSku(product.getSpu());
			shopeePublish.setProductName(product.getNameCn());
			shopeePublish.setWeight(product.getPackageWeight());
			String descriptionCn = product.getDescriptionCn();
			String tempDescription = TextAreaUtil.removeHtmlTag(descriptionCn);
			shopeePublish.setDescription(tempDescription);
			shopeePublish.setImageStr(gson.toJson(productService.getProductImage(product.getId())));
			if (StringUtils.isNotEmpty(product.getSpu())) {
				List<Product> productList = productService.getProductBySpu(product.getSpu());
				if (CollectionUtils.isNotEmpty(productList)) {
					List<String> spuImageList = new ArrayList<String>();
					for (Product spuProduct : productList) {
						List<String> images = productService.getProductImage(spuProduct.getId());
						spuImageList.addAll(images);
					}
					shopeePublish.setImageStr(null);	//有spu的时候先清空
					shopeePublish.setImageStr(gson.toJson(spuImageList));
				}
			}
			message.setData(shopeePublish);
		}
		return JsonUtil.toJsonStr(message);
	}
	
	@RequestMapping("getProductInfoBySpu")
	@ResponseBody
	public String getProductInfoBySpu(String spu) {
		List<Product> productList = productService.getProductBySpu(spu);
		List<ShopeePublish> shopeePublishList = new ArrayList<ShopeePublish>();
		ReturnMessage message = new ReturnMessage();
		Gson gson = new Gson();
		if (CollectionUtils.isNotEmpty(productList)) {
			for (Product product : productList) {
				List<String> imageList = productService.getProductImage(product.getId());
				ShopeePublish shopeePublish = new ShopeePublish();
				shopeePublish.setSku(product.getSku());
				shopeePublish.setProductName(product.getNameCn());
				shopeePublish.setImageStr(gson.toJson(imageList));
				shopeePublishList.add(shopeePublish);
			}
			message.setData(shopeePublishList);
		} else {
			MyLocale myLocale = new MyLocale();
			message.setStatus(ReturnMessageEnum.WARRING.getValue());
			message.setMessage(myLocale.getText("not.found.product.info.by.spu", spu));
		}
		return JsonUtil.toJsonStr(message);
	}
	
	@RequestMapping("getShopeeMultiSkuInfo")
	@ResponseBody
	public String getShopeeMultiSkuInfo(String sku) {
		Product product = productService.getProductBySku(sku);
		ReturnMessage message = new ReturnMessage();
		Map<String, Object> productMap = new HashMap<String, Object>();
		if (null == product) {
			MyLocale myLocale = new MyLocale();
			message.setStatus(ReturnMessageEnum.WARRING.getValue());
			message.setMessage(myLocale.getText("not.found.product.info.by.sku", sku));
		} else {
			List<String> imageList = productService.getProductImage(product.getId());
			productMap.put("imageList", imageList);
			productMap.put("productName", product.getNameCn());
			message.setData(productMap);
		}
		return JsonUtil.toJsonStr(message);
	}
	
	@RequestMapping("getShopeeCategoryPath")
	@ResponseBody
	public String getShopeeCategoryPath(Integer categoryId) {
		String categoryPath = shopeeCategoryService.appendCategoryPath(categoryId);
		ReturnMessage message = new ReturnMessage();
		if (StringUtils.isNotEmpty(categoryPath)) {
			message.setData(categoryPath);
		} else {
			MyLocale myLocale = new MyLocale();
			message.setStatus(ReturnMessageEnum.WARRING.getValue());
			message.setMessage(myLocale.getText("shopee.categroy.no.import.or.id.error", String.valueOf(categoryId)));
		}
		return JsonUtil.toJsonStr(message);
	}
	
	@RequestMapping("saveShopeeProduct")
	@ResponseBody
	public String saveShopeeProduct(@RequestBody List<ShopeePublish> shopeePublishList) {
		if (CollectionUtils.isNotEmpty(shopeePublishList)) {
			for (ShopeePublish shopeePublish : shopeePublishList) {
				if (null == shopeePublish.getId()) {
					shopeePublishService.insertShopeePublish(shopeePublish);
				} else {
					shopeePublishService.updateShopeePublish(shopeePublish);
				}
			}
		}
		ReturnMessage message = new ReturnMessage();
		return JsonUtil.toJsonStr(message);
	}
	
	@RequestMapping("getShopeeInfoById")
	@ResponseBody
	public String getShopeeInfoById(Integer id) {
		ShopeePublish shopeePublish = shopeePublishService.getShopeePublishById(id);
		return JsonUtil.toJsonStr(shopeePublish);
	}
	
	@RequestMapping("getMultiShopeeInfo")
	@ResponseBody
	public String getMultiShopeeInfo(Integer id) {
		ReturnMessage message = new ReturnMessage();
		List<ShopeePublish> shopeePublishs = new ArrayList<ShopeePublish>();
		MyLocale myLocale = new MyLocale();
		ShopeePublish shopeePublish = shopeePublishService.getShopeePublishById(id);
		if (null != shopeePublish) {
			shopeePublishs.add(shopeePublish);
			String parentSku = shopeePublish.getParentSku();
			if (StringUtils.isNotEmpty(parentSku)) {
				List<ShopeePublish> shopeePublishList = shopeePublishService.getShopeePublishBySpuNoEnId(parentSku, id);
				if (CollectionUtils.isNotEmpty(shopeePublishList)) {
					shopeePublishs.addAll(shopeePublishList);
				}
			} else {
				message.setStatus(ReturnMessageEnum.WARRING.getValue());
				message.setMessage(myLocale.getText("this.sku.without.parentSku"));
			}
		}
		message.setData(shopeePublishs);
		return JsonUtil.toJsonStr(message);
	}
	
	@RequestMapping("getAllProductImageBySpu")
	@ResponseBody
	public String getAllProductImageBySpu(String spu) {
		ReturnMessage message = new ReturnMessage();
		List<String> imageList = new ArrayList<String>();
		List<Product> productList = productService.getProductBySpu(spu);
		if (CollectionUtils.isNotEmpty(productList)) {
			for (Product product : productList) {
				imageList.addAll(productService.getProductImage(product.getId()));
			}
		}
		message.setData(imageList);
		return JsonUtil.toJsonStr(message);
	}
}
