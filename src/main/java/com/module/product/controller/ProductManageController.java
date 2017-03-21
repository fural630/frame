package com.module.product.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import com.application.libraries.constentEnum.RoleEnum;
import com.application.libraries.select.ProductAuditStatus;
import com.code.Page;
import com.code.frame.Constant;
import com.code.session.UserSingleton;
import com.code.view.MainPage;
import com.code.view.ReturnMessage;
import com.module.product.model.Product;
import com.module.product.model.ProductAudit;
import com.module.product.service.ProductService;
import com.module.system.model.User;
import com.module.product.model.ZtreeNode;
import com.util.Dumper;
import com.util.Excel;
import com.util.JsonUtil;
import com.util.MyDate;
import com.util.MyLocale;

@Controller
@RequestMapping("product")
public class ProductManageController extends MainPage{
	
	private static Logger logger = Logger.getLogger(ProductManageController.class);  
	
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
			@RequestParam(value = "productImageList[]", required = false) List<String> productImageList,
			@RequestParam(value = "multiSkuList[]",required = false) List<String> multiSkuList,
			@RequestParam(value = "multiColorList[]",required = false) List<String> multiColorList,
			@RequestParam(value = "multiSizeList[]",required = false) List<String> multiSizeList) {
		ReturnMessage returnMessage = new ReturnMessage();
		MyLocale myLocale = new MyLocale();
		if (null == product.getId()) {
			if (productService.checkSkuExist(product.getSku())) {
				returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
				returnMessage.setMessage(myLocale.getText("operating.fail.this.sku.is.exist", product.getSku()));
				return JsonUtil.toJsonStr(returnMessage);
			}
			if (CollectionUtils.isNotEmpty(multiSkuList)) {
				for (String multiSku : multiSkuList) {
					if (productService.checkSkuExist(multiSku)) {
						returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
						returnMessage.setMessage(myLocale.getText("operating.fail.this.sku.is.exist", multiSku));
						return JsonUtil.toJsonStr(returnMessage);
					}
				}
				for (int i = 0; i < multiSkuList.size(); i++) {
					Product multiProduct = new Product();
					try {
						BeanUtils.copyProperties(multiProduct, product);
						multiProduct.setSku(multiSkuList.get(i));
						multiProduct.setColor(multiColorList.get(i));
						multiProduct.setSize(multiSizeList.get(i));
						productService.createNewProduct(multiProduct, productImageList);
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						e.printStackTrace();
					}
				}
			}
			productService.createNewProduct(product, productImageList);
		} else {
			User user = UserSingleton.getInstance().getUser();
			System.out.println(user.getRole().intValue());
			System.out.println(RoleEnum.EMPLOYEE.getValue());
			if (user.getRole().intValue() < RoleEnum.SUPERVISOR.getValue()) {
				Product tmpProduct = productService.getProductById(product.getId());
				Integer auditStatus = tmpProduct.getAuditStatus().intValue();
				Map<String, String> statusMap = new ProductAuditStatus().getOptions();
				String statusName = statusMap.get(String.valueOf(auditStatus));
				if (auditStatus != ProductAuditStatusEnum.WAIT_EDIT.getValue() && auditStatus != ProductAuditStatusEnum.WAIT_SUBMIT_AUDIT.getValue()) {
					returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
					returnMessage.setMessage(myLocale.getText("operation.fail.current.status.is", statusName));
					return JsonUtil.toJsonStr(returnMessage);
				}
			}
			if (productService.checkCanUpdateSku(product.getSku(), product.getId())) {
				productService.updateProduct(product, productImageList);
			} else {
				returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
				returnMessage.setMessage(myLocale.getText("operating.fail.this.sku.is.exist", product.getSku()));
				return JsonUtil.toJsonStr(returnMessage);
			}
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
	public String saveProductEditUser(Integer userId, String spuList) {
		ReturnMessage returnMessage = new ReturnMessage();
		if (StringUtils.isNotEmpty(spuList)) {
			String spus[] = spuList.split(",");
			if (spus.length > 0) {
				for (String spu : spus) {
					List<Product> products = productService.getProductBySpu(spu);
					for (Product product : products) {
						productService.saveProductEditUser(userId, product.getId());
						productService.updateProductAuditStatus(product.getId(), ProductAuditStatusEnum.WAIT_EDIT);
					}
				}
			}
		} else {
			returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
		}
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("saveProductPublishUser")
	@ResponseBody
	public String saveProductPublishUser(Integer userId, String spuList) {
		ReturnMessage returnMessage = new ReturnMessage();
		if (StringUtils.isNotEmpty(spuList)) {
			String spus[] = spuList.split(",");
			if (spus.length > 0) {
				for (String spu : spus) {
					List<Product> products = productService.getProductBySpu(spu);
					for (Product product : products) {
						productService.saveProductPublishUser(userId, product.getId());
					}
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
		if (auditStatus.intValue() != ProductAuditStatusEnum.WAIT_SUBMIT_AUDIT.getValue()) {
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
	
	@RequestMapping("getProductPurchaseUrl")
	@ResponseBody
	public String getProductPurchaseUrl(Integer productId) {
		String purchaseUrl = productService.getProductPurchaseUrl(productId);
		return JsonUtil.toJsonStr(purchaseUrl);
	}
	
	@RequestMapping("finishEdit")
	@ResponseBody
	public String finishEdit(Integer productId) {
		ReturnMessage returnMessage = new ReturnMessage();
		Product product = productService.getProductById(productId);
		if (null != product && product.getAuditStatus() != ProductAuditStatusEnum.WAIT_EDIT.getValue()) {
			Integer auditStatus = product.getAuditStatus();
			Map<String, String> statusMap = new ProductAuditStatus().getOptions();
			String statusName = statusMap.get(String.valueOf(auditStatus));
			String errorMessage = new MyLocale().getText("operation.fail.current.status.is", statusName);
			returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
			returnMessage.setMessage(errorMessage);
			return JsonUtil.toJsonStr(returnMessage);
		} else {
			productService.updateProductAuditStatus(productId, ProductAuditStatusEnum.WAIT_SUBMIT_AUDIT);
		}
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("batchSubmitAudit")
	@ResponseBody
	public String batchSubmitAudit(String idList) {
		ReturnMessage returnMessage = new ReturnMessage();
		MyLocale myLocale = new MyLocale();
		if (StringUtils.isNotEmpty(idList)) {
			String ids[] = idList.split(",");
			if (ids.length > 0) {
				Map<String, String> statusMap = new ProductAuditStatus().getOptions();
				String statusName = statusMap.get(String.valueOf(ProductAuditStatusEnum.WAIT_SUBMIT_AUDIT.getValue()));
				for (String productIdStr : ids) {
					Product product = productService.getProductById(Integer.parseInt(productIdStr));
					if (product.getAuditStatus().intValue() != ProductAuditStatusEnum.WAIT_SUBMIT_AUDIT.getValue()) {
						returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
						returnMessage.setMessage(myLocale.getText("all.product.status.mast.be", statusName));
						return JsonUtil.toJsonStr(returnMessage);
					}
				}
				for (String productIdStr : ids) {
					productService.updateProductAuditStatus(Integer.parseInt(productIdStr), ProductAuditStatusEnum.WAIT_AUDITED);
				}
			}
		} else {
			returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
		}
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("exportProductData")
	public ResponseEntity<byte[]> exportProductData(String params) throws Exception{
		logger.info("==> params : " + params);
		File file = productService.exportProductData(params);
		if (null != file) {
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.setContentDispositionFormData("attachment", file.getName());
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
					headers, HttpStatus.CREATED);
		}
		return null;
	}
	
	
	@RequestMapping("getProductImageBySku")
	@ResponseBody
	public String getProductImageBySku(String sku) {
		Product product = productService.getProductBySku(sku);
		List<String> imageList = productService.getProductImage(product.getId());
		return JsonUtil.toJsonStr(imageList);
	}
	
	@RequestMapping("loadEditorUserTree")
	@ResponseBody
	public String loadEditorUserTree() {
		List<String> spuList = productService.getSpuList();
		List<ZtreeNode> ztreeNodeList = new ArrayList<ZtreeNode>();
		MyLocale myLocale = new MyLocale();
		String defaultName = myLocale.getText("not.assigned");
		if (CollectionUtils.isNotEmpty(spuList)) {
			for (String spu : spuList) {
				ZtreeNode spuNode = new ZtreeNode();
				List<String> editorNameList = productService.getEditorBySpu(spu);
				if (CollectionUtils.isNotEmpty(editorNameList) && StringUtils.isNotEmpty(editorNameList.get(0))) {
					spuNode.setName(spu + "("+editorNameList.get(0)+")");
				} else {
					spuNode.setName(spu + "("+defaultName+")");
				}
				List<String> skuList = productService.getSkuListBySpu(spu);
				if (CollectionUtils.isNotEmpty(skuList)) {
//					spuNode.setOpen(true);
					List<ZtreeNode> childNoteList = new ArrayList<ZtreeNode>();
					for (String sku : skuList) {
						ZtreeNode skuNode = new ZtreeNode();
						skuNode.setName(sku);
						childNoteList.add(skuNode);
					}
					spuNode.setChildren(childNoteList);
				}
				ztreeNodeList.add(spuNode);
			}
		}
		Dumper.dump(ztreeNodeList);
		return JsonUtil.toJsonStr(ztreeNodeList);
	}
	
	@RequestMapping("loadPublishUserTree")
	@ResponseBody
	public String loadPublishUserTree() {
		List<String> spuList = productService.getSpuList();
		List<ZtreeNode> ztreeNodeList = new ArrayList<ZtreeNode>();
		MyLocale myLocale = new MyLocale();
		String defaultName = myLocale.getText("not.assigned");
		if (CollectionUtils.isNotEmpty(spuList)) {
			for (String spu : spuList) {
				ZtreeNode spuNode = new ZtreeNode();
				List<String> publishUserNameList = productService.getPublishUserBySpu(spu);
				if (CollectionUtils.isNotEmpty(publishUserNameList) && StringUtils.isNotEmpty(publishUserNameList.get(0))) {
					spuNode.setName(spu + "("+publishUserNameList.get(0)+")");
				} else {
					spuNode.setName(spu + "("+defaultName+")");
				}
				List<String> skuList = productService.getSkuListBySpu(spu);
				if (CollectionUtils.isNotEmpty(skuList)) {
//					spuNode.setOpen(true);
					List<ZtreeNode> childNoteList = new ArrayList<ZtreeNode>();
					for (String sku : skuList) {
						ZtreeNode skuNode = new ZtreeNode();
						skuNode.setName(sku);
						childNoteList.add(skuNode);
					}
					spuNode.setChildren(childNoteList);
				}
				ztreeNodeList.add(spuNode);
			}
		}
		Dumper.dump(ztreeNodeList);
		return JsonUtil.toJsonStr(ztreeNodeList);
	}
}
