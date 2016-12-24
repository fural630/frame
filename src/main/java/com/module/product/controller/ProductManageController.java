package com.module.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sound.sampled.Port;

import org.apache.commons.lang.StringUtils;
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
import com.module.product.model.Product;
import com.module.product.model.ProductAudit;
import com.module.product.service.ProductService;
import com.util.Dumper;
import com.util.JsonUtil;

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
	
	@RequestMapping("saveProduct")
	@ResponseBody
	public String saveProduct(Product product, 
			@RequestParam(value = "productImageList[]", required = false) List<String> productImageList) {
		Dumper.dump(product);
		Dumper.dump(productImageList);
		if (null == product.getId()) {
			productService.createNewProduct(product, productImageList);
		} else {
			productService.updateProduct(product, productImageList);
		}
		ReturnMessage returnMessage = new ReturnMessage();
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("editProduct")
	@ResponseBody
	public String editProduct(Integer id) {
		Product product = productService.getProductById(id);
		List<String> imageList = productService.getProductImage(id);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("product", product);
		resultMap.put("imageList", imageList);
		return JsonUtil.toJsonStr(resultMap);
	}
	
	@RequestMapping("deleteProductById")
	@ResponseBody
	public String deleteProductById(Integer id) {
		productService.deleteProductById(id);
		ReturnMessage returnMessage = new ReturnMessage();
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("getProductEditUser")
	@ResponseBody
	public String getProductEditUser(Integer productId) {
		Integer userId = productService.getProductEditUser(productId);
		return JsonUtil.toJsonStr(String.valueOf(userId));
	}
	
	@RequestMapping("getProductPublishUser")
	@ResponseBody
	public String getProductPublishUser(Integer productId) {
		Integer userId = productService.getProductPublishUser(productId);
		return JsonUtil.toJsonStr(String.valueOf(userId));
	}
	
	@RequestMapping("saveProductEditUser")
	@ResponseBody
	public String saveProductEditUser(Integer userId, String productIds) {
		ReturnMessage returnMessage = new ReturnMessage();
		if (StringUtils.isNotEmpty(productIds)) {
			String ids[] = productIds.split(",");
			if (ids.length > 0) {
				for (String productIdStr : ids) {
					productService.saveProductEditUser(userId, Integer.parseInt(productIdStr));
				}
			}
		} else {
			returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
		}
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("saveProductPublishUser")
	@ResponseBody
	public String saveProductPublishUser(Integer userId, String productIds) {
		ReturnMessage returnMessage = new ReturnMessage();
		if (StringUtils.isNotEmpty(productIds)) {
			String ids[] = productIds.split(",");
			if (ids.length > 0) {
				for (String productIdStr : ids) {
					productService.saveProductPublishUser(userId, Integer.parseInt(productIdStr));
				}
			}
		} else {
			returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
		}
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("deleteProductByIds")
	@ResponseBody
	public String deleteProductByIds(String idList) {
		ReturnMessage returnMessage = new ReturnMessage();
		if (StringUtils.isNotEmpty(idList)) {
			String ids[] = idList.split(",");
			if (ids.length > 0) {
				for (String productIdStr : ids) {
					productService.deleteProductById(Integer.parseInt(productIdStr));
				}
			}
		} else {
			returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
		}
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("getProductAuditList")
	@ResponseBody
	public String getProductAuditList(Integer productId) {
		List<ProductAudit> productAuditList = productService.getProductAuditListByProductId(productId);
		return JsonUtil.toJsonStr(productAuditList);
	}
}
