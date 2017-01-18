package com.module.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.application.libraries.constentEnum.ProductAuditStatusEnum;
import com.application.libraries.constentEnum.ReturnMessageEnum;
import com.application.libraries.select.ProductAuditStatus;
import com.code.Page;
import com.code.frame.Constant;
import com.code.session.UserSingleton;
import com.code.view.MainPage;
import com.code.view.ReturnMessage;
import com.module.product.model.Product;
import com.module.product.model.ProductAudit;
import com.module.product.service.ProductService;
import com.util.Excel;
import com.util.JsonUtil;
import com.util.MyDate;
import com.util.MyLocale;

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
		ReturnMessage returnMessage = new ReturnMessage();
		if (null == product.getId()) {
//			if (productService.checkSkuExist(product.getSku())) {
//				returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
//				returnMessage.setMessage(message)
//			}
			productService.createNewProduct(product, productImageList);
		} else {
			productService.updateProduct(product, productImageList);
		}
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
					Integer productId = Integer.parseInt(productIdStr);
					productService.saveProductEditUser(userId, productId);
					productService.updateProductAuditStatus(productId, ProductAuditStatusEnum.WAIT_EDIT);
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
	
	@RequestMapping("uploadProduct")
	public String uploadProduct(HttpServletRequest request, Model model) {
		Map outputData = new HashMap();
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next().toString());
				if (file != null) {
					String path = Constant.TMP_PATH + file.getOriginalFilename();
//					path = "E:\\" + file.getOriginalFilename();
					File tmpFile = new File(path);
					try {
						file.transferTo(tmpFile);
						Excel excel = new Excel(tmpFile.toString());
						outputData = productService.uploadPorduct(excel.toArray());
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		model.addAttribute("outputData", outputData);
		return "template/upload-message-page";
	}
	
	
	@RequestMapping("submitReview")
	@ResponseBody
	public String submitReview(Integer productId, String auditMessage) {
		Integer auditStatus = productService.getProductAuditStatus(productId);
		ReturnMessage returnMessage = new ReturnMessage();
		if (auditStatus.intValue() != ProductAuditStatusEnum.WAIT_EDIT.getValue()) {
			Map<String, String> statusMap = new ProductAuditStatus().getOptions();
			String statusName = statusMap.get(String.valueOf(auditStatus));
			String errorMessage = new MyLocale().getText("operation.fail.current.status.is", statusName);
			returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
			returnMessage.setMessage(errorMessage);
			return JsonUtil.toJsonStr(returnMessage);
		}
		ProductAudit productAudit = new ProductAudit();
		productAudit.setComment(auditMessage);
		productAudit.setCreateTime(new MyDate().getCurrentDateTime());
		productAudit.setUserId(UserSingleton.getInstance().getUser().getId());
		productAudit.setProductId(productId);
		productService.insertProductAudit(productAudit);
		productService.updateProductAuditStatus(productId, ProductAuditStatusEnum.WAIT_AUDITED);
		List<ProductAudit> productAuditList = productService.getProductAuditListByProductId(productId);
		returnMessage.setData(productAuditList);
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("pendingReExamination")
	@ResponseBody
	public String pendingReExamination(Integer productId, String auditMessage) {
		ProductAudit productAudit = new ProductAudit();
		productAudit.setComment(auditMessage);
		productAudit.setCreateTime(new MyDate().getCurrentDateTime());
		productAudit.setUserId(UserSingleton.getInstance().getUser().getId());
		productAudit.setProductId(productId);
		productService.insertProductAudit(productAudit);
		productService.updateProductAuditStatus(productId, ProductAuditStatusEnum.WAIT_EDIT);
		List<ProductAudit> productAuditList = productService.getProductAuditListByProductId(productId);
		ReturnMessage returnMessage = new ReturnMessage();
		returnMessage.setData(productAuditList);
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("passProductAudit")
	@ResponseBody
	public String passProductAudit(Integer productId, String auditMessage) {
		ProductAudit productAudit = new ProductAudit();
		productAudit.setComment(auditMessage);
		productAudit.setCreateTime(new MyDate().getCurrentDateTime());
		productAudit.setUserId(UserSingleton.getInstance().getUser().getId());
		productAudit.setProductId(productId);
		productService.insertProductAudit(productAudit);
		productService.updateProductAuditStatus(productId, ProductAuditStatusEnum.AUDITED);
		List<ProductAudit> productAuditList = productService.getProductAuditListByProductId(productId);
		ReturnMessage returnMessage = new ReturnMessage();
		returnMessage.setData(productAuditList);
		return JsonUtil.toJsonStr(returnMessage);
	}
	
}
