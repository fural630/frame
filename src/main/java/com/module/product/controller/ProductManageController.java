package com.module.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.sound.sampled.Port;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.application.libraries.constentEnum.ReturnMessageEnum;
import com.code.Page;
import com.code.frame.Constant;
import com.code.view.MainPage;
import com.code.view.ReturnMessage;
import com.module.product.model.Product;
import com.module.product.model.ProductAudit;
import com.module.product.service.ProductService;
import com.util.Dumper;
import com.util.Excel;
import com.util.JsonUtil;
import com.util.MyDate;

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
	
	@RequestMapping("uploadProduct")
	public String uploadProduct(HttpServletRequest request) {
		MyDate myDate = new MyDate();
		TreeMap messageOutput = new TreeMap(); 
		Map countData = new HashMap();
		int number = 0;
		int successCounts = 0;
    	int failureCounts = 0;
		
		
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next().toString());
				if (file != null) {
					String path = Constant.TMP_PATH + file.getOriginalFilename();
					File tmpFile = new File(path);
					try {
						file.transferTo(tmpFile);
						Excel excel = new Excel(tmpFile.toString());
						ArrayList<ArrayList<String>> dataArrayList = excel.toArray();
						Dumper.dump(dataArrayList);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}

//		try {
//			if (marketingOrderFileFileName.indexOf(".xlsx") > 0 || marketingOrderFileFileName.indexOf(".xls") > 0) {
//				File tmpFile = new File(Constant.TMP_PATH + marketingOrderFileFileName);
//				FileUtils.copyFile(marketingOrderFile, tmpFile);
//				List<String> transationIdList = processImportMarketingOrder(tmpFile.toString());
//				if (CollectionUtils.isEmpty(transationIdList)) {
//					uploadMessage = new MyLocale().getText("file.content.format.error"); 
//					return INPUT;
//				}
//				AmazonMarketingOrderDao amazonMarketingOrderDao = new AmazonMarketingOrderDao();
//				for (String transationId : transationIdList) {
//					if (StringUtils.isNotEmpty(transationId)) {
//						number++;
//						if (!amazonMarketingOrderDao.checkExist(transationId)) {
//							AmazonMarketingOrder amazonMarketingOrder = new AmazonMarketingOrder();
//							amazonMarketingOrder.setCreateTime(myDate.getCurrentDateTime());
//							amazonMarketingOrder.setCreator(UserSingleton.getInstance().getUser().getId());
//							amazonMarketingOrder.setOrderLevel(OrderLevel.SEO.getOrderLevel());
//							amazonMarketingOrder.setStatus(0);
//							amazonMarketingOrder.setTransactionId(transationId);
//							amazonMarketingOrderDao.saveOrUpate(amazonMarketingOrder);
//							successCounts++;
//							messageOutput.put(number, new MyLocale().getText("upload.is.successfull") + "!");
//						} else {
//							failureCounts++;
//							messageOutput.put(number, new MyLocale().getText("upload.amazon.marketing.order.failure", transationId.trim()));
//						}
//					}
//				}
//			} else {
//				uploadMessage = "只能上传.xlsx或.xls";
//				return INPUT;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			return INPUT;
//		}
//		countData.put("finalNumber", number);
//		countData.put("successCounts", successCounts);
//		countData.put("failureCounts" ,failureCounts);
//		outputData.put("countData", countData);
//		outputData.put("messageOutput", messageOutput);
		return "template/upload-message-page";
	}
}