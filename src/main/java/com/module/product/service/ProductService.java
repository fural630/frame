package com.module.product.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.application.libraries.constentEnum.ProductAuditStatusEnum;
import com.code.Page;
import com.code.frame.Constant;
import com.code.session.UserSingleton;
import com.module.product.dao.ProductDao;
import com.module.product.model.Product;
import com.module.product.model.ProductAudit;
import com.module.system.model.User;
import com.util.Excel;
import com.util.MyDate;
import com.util.MyLocale;
import com.util.SysRemark;

@Service
public class ProductService {
	
	@Autowired(required = false)
	private ProductDao productDao;
	
	public List<Map<String, Object>> getProductPage(Page page) {
		return productDao.getProductPage(page);
	}

	public void createNewProduct(Product product, List<String> productImageList) {
		User user = UserSingleton.getInstance().getUser();
		MyDate myDate = new MyDate();
		MyLocale myLocale = new MyLocale();
		product.setAuditStatus(ProductAuditStatusEnum.WAIT_DISTRIBUTE.getValue());
		product.setOptionLog(SysRemark.appendMore("", myLocale.getText("create.product")));
		product.setCreatorId(user.getId());
		product.setCreateTime(myDate.getCurrentDateTime());
		product.setUpdateTime(myDate.getCurrentDateTime());
		productDao.insertProduct(product);
		
		if(CollectionUtils.isNotEmpty(productImageList)) {
			Map<String, Object> productImageMap = new HashMap<String, Object>();
			productImageMap.put("productId", product.getId());
			productImageMap.put("imageList", productImageList);
			productDao.insertProductImage(productImageMap);
		}
	}
	
	public Product getProductById(Integer id) {
		return productDao.getProductById(id);
	}
	
	public List<String> getProductImage(Integer productId) {
		return productDao.getProductImage(productId);
	}

	public void updateProduct(Product product, List<String> productImageList) {
		Product oldProduct = productDao.getProductById(product.getId());
		MyDate myDate = new MyDate();
		MyLocale myLocale = new MyLocale();
		product.setUpdateTime(myDate.getCurrentDateTime());
		product.setOptionLog(SysRemark.appendMore(oldProduct.getOptionLog(), myLocale.getText("modify.product")));
		productDao.updateProduct(product);
		productDao.deleteProductImageByProductId(product.getId());
		if(CollectionUtils.isNotEmpty(productImageList)) {
			Map<String, Object> productImageMap = new HashMap<String, Object>();
			productImageMap.put("productId", product.getId());
			productImageMap.put("imageList", productImageList);
			productDao.insertProductImage(productImageMap);
		}
	}
	
	public void updateProductAuditStatus(Integer productId, ProductAuditStatusEnum status) {
		productDao.updateProductAuditStatus(productId, status.getValue());
	}

	public void deleteProductById(Integer id) {
		productDao.deleteProductById(id);
		productDao.deleteProductImageByProductId(id);
	}

	public Integer getProductEditUser(Integer productId) {
		return productDao.getProductEditUser(productId);
	}
	
	public Integer getProductPublishUser(Integer productId) {
		return productDao.getProductPublishUser(productId);
	}

	public void saveProductEditUser(Integer userId, Integer productId) {
		productDao.saveProductEditUser(userId, productId);
	}

	public void saveProductPublishUser(Integer userId, Integer productId) {
		productDao.saveProductPublishUser(userId, productId);
	}
	
	public List<ProductAudit> getProductAuditListByProductId(Integer productId) {
		return productDao.getProductAuditListByProductId(productId);
	}
	
	public void insertProductAudit(ProductAudit productAudit) {
		productDao.insertProductAudit(productAudit);
	}
	
	public boolean checkSkuExist(String sku) {
		Product product = productDao.getProductBySku(sku);
		if (null == product) {
			return false;
		} 
		return true;
	}
	
	public boolean checkCanUpdateSku(String sku, Integer productId) {
		List<Product> productList = productDao.checkCanUpdateSku(sku, productId);
		if (CollectionUtils.isNotEmpty(productList)) {
			return false;
		} 
		return true;
	}
	
	public Product getProductBySku(String sku) {
		return productDao.getProductBySku(sku);
	}

	public Map uploadPorduct(ArrayList<ArrayList<String>> data) {
		MyLocale myLocale = new MyLocale();
		TreeMap messageOutput = new TreeMap(); 
		Map countData = new HashMap();
		Map outputData = new HashMap();
		int number = 1;
		int successCounts = 0;
    	int failureCounts = 0;
    	for (int i = 1; i < data.size(); i++) {
			List<String> row = data.get(i);
			if (CollectionUtils.isEmpty(row)) {
				continue;
			}
			number++;
			boolean flag = true;
			String errorMessage = "";
			String sku = null;
			String spu = null;
			String color = null;
			String size = null;
			String nameCn = null;
			String nameEn = null;
			String purchaseUrl = null;
			Double purchasePrice = 0D;
			Double packageWeight = 0D;
			Double packageLength = 0D;
			Double packageHeight = 0D;
			Double packageWidth = 0D;
			String declarationNameCn = null;
			String declarationNameEn = null;
			String mainImage = null;
			List<String> iamgeList = new ArrayList<String>();
			if (row.size() < 15) {
				flag = false;
				errorMessage = myLocale.getText("import.fail.error.format");
			} else {
				sku = row.get(0);
				if (StringUtils.isBlank(sku)) {
					errorMessage += myLocale.getText("field.can.not.be.empty", "SKU");
					flag = false;
				} else if (checkSkuExist(sku)) {
					errorMessage += myLocale.getText("sku.repeat", sku);
					errorMessage += ",";
					flag = false;
				} else {
					spu = StringUtils.isBlank(row.get(1)) ? null : row.get(1);
					color = StringUtils.isBlank(row.get(2)) ? null : row.get(2);
					size = StringUtils.isBlank(row.get(3)) ? null : row.get(3);
					nameCn = row.get(4);
					if (StringUtils.isBlank(nameCn)) {
						errorMessage += myLocale.getText("field.can.not.be.empty", myLocale.getText("name.cn"));
						errorMessage += ",";
						flag = false;
					}
					nameEn = row.get(5);
					if (StringUtils.isBlank(nameEn)) {
						errorMessage += myLocale.getText("field.can.not.be.empty", myLocale.getText("name.en"));
						errorMessage += ",";
						flag = false;
					}
					purchaseUrl = row.get(6);
					if (StringUtils.isBlank(purchaseUrl)) {
						errorMessage += myLocale.getText("field.can.not.be.empty", myLocale.getText("purchase.url"));
						errorMessage += ",";
						flag = false;
					}
					try {
						purchasePrice = Double.parseDouble(row.get(7));
					} catch (Exception e) {
						errorMessage += myLocale.getText("wrong.format", myLocale.getText("purchase.price"));
						errorMessage += ",";
						flag = false;
					}
					try {
						packageWeight = Double.parseDouble(row.get(8));
					} catch (Exception e) {
						errorMessage += myLocale.getText("wrong.format", myLocale.getText("package.weight"));
						errorMessage += ",";
						flag = false;
					}
					try {
						packageLength = Double.parseDouble(row.get(9));
					} catch (Exception e) {
						errorMessage += myLocale.getText("wrong.format", myLocale.getText("package.length"));
						errorMessage += ",";
						flag = false;
					}
					try {
						packageWidth = Double.parseDouble(row.get(10));
					} catch (Exception e) {
						errorMessage += myLocale.getText("wrong.format", myLocale.getText("package.width"));
						errorMessage += ",";
						flag = false;
					}
					try {
						packageHeight = Double.parseDouble(row.get(11));
					} catch (Exception e) {
						errorMessage += myLocale.getText("wrong.format", myLocale.getText("package.height"));
						errorMessage += ",";
						flag = false;
					}
					declarationNameCn = row.get(12);
					if (StringUtils.isBlank(declarationNameCn)) {
						errorMessage += myLocale.getText("field.can.not.be.empty", myLocale.getText("declaration.name.cn"));
						errorMessage += ",";
						flag = false;
					}
					declarationNameEn = row.get(13);
					if (StringUtils.isBlank(declarationNameEn)) {
						errorMessage += myLocale.getText("field.can.not.be.empty", myLocale.getText("declaration.name.en"));
						errorMessage += ",";
						flag = false;
					}
					mainImage = row.get(14);
					if (StringUtils.isBlank(mainImage)) {
						errorMessage += myLocale.getText("field.can.not.be.empty", myLocale.getText("main.image"));
						errorMessage += ",";
						flag = false;
					}
					iamgeList.add(mainImage);
					if (row.size() > 15) {
						if(StringUtils.isNotBlank(row.get(15))) {
							iamgeList.add(row.get(15));
						}
					}
					if (row.size() > 16) {
						if(StringUtils.isNotBlank(row.get(16))) {
							iamgeList.add(row.get(16));
						}
					}
					if (row.size() > 17) {
						if(StringUtils.isNotBlank(row.get(17))) {
							iamgeList.add(row.get(17));
						}
					}
					if (row.size() > 18) {
						if(StringUtils.isNotBlank(row.get(18))) {
							iamgeList.add(row.get(18));
						}
					}
					if (row.size() > 19) {
						if(StringUtils.isNotBlank(row.get(19))) {
							iamgeList.add(row.get(19));
						}
					}
				}
			}
			if (flag) {
				successCounts++;
				messageOutput.put(String.valueOf(number), myLocale.getText("upload.is.successfull"));
				Product product = new Product();
				product.setSku(sku);
				product.setSpu(spu);
				product.setColor(color);
				product.setSize(size);
				product.setNameCn(nameCn);
				product.setNameEn(nameEn);
				product.setPurchaseUrl(purchaseUrl);
				product.setPurchasePrice(purchasePrice);
				product.setPackageHeight(packageHeight);
				product.setPackageLength(packageLength);
				product.setPackageWeight(packageWeight);
				product.setPackageWidth(packageWidth);
				product.setDeclarationNameCn(declarationNameCn);
				product.setDeclarationNameEn(declarationNameEn);
				product.setMainImage(mainImage);
				this.createNewProduct(product, iamgeList);
			} else {
				failureCounts++;
				if (errorMessage.endsWith(",")) {
					errorMessage = errorMessage.substring(0, errorMessage.length() -1);
				}
				messageOutput.put(String.valueOf(number), myLocale.getText("upload.is.fail", errorMessage));
			}
		}
		countData.put("finalNumber", number-1);
		countData.put("successCounts", successCounts);
		countData.put("failureCounts" ,failureCounts);
		outputData.put("countData", countData);
		outputData.put("messageOutput", messageOutput);
    	return outputData;
	}

	public Integer getProductAuditStatus(Integer productId) {
		return productDao.getProductAuditStatus(productId);
	}

	public String getProductPurchaseUrl(Integer productId) {
		return productDao.getProductPurchaseUrl(productId);
	}

	public List<Product> getProductBySpu(String spu) {
		return productDao.getProductBySpu(spu);
	}

	public File exportProductData(String params) {
		if (StringUtils.isNotEmpty(params)) {
			List<Integer> ids = new ArrayList<Integer>();
			String idList[] = params.split(",");
			if (idList.length > 0) {
				for (int i = 0; i < idList.length; i++) {
					Integer productId = Integer.parseInt(idList[i]);
					ids.add(productId);
				}
				
			}
			if (CollectionUtils.isNotEmpty(ids)) {
				ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>> ();
				ArrayList<String> titleList = new ArrayList<String>();
				MyLocale myLocale = new MyLocale();
				titleList.add(myLocale.getText("export.product.sku"));
				titleList.add(myLocale.getText("export.product.name.cn"));
				titleList.add(myLocale.getText("export.product.weight"));
				titleList.add(myLocale.getText("export.product.length"));
				titleList.add(myLocale.getText("export.product.width"));
				titleList.add(myLocale.getText("export.product.height"));
				titleList.add(myLocale.getText("export.product.price"));
				
				titleList.add(myLocale.getText("export.product.declaration.name.cn"));
				titleList.add(myLocale.getText("export.product.declaration.name.en"));
				titleList.add(myLocale.getText("export.product.declared.value"));
				titleList.add(myLocale.getText("export.product.tag"));
				titleList.add(myLocale.getText("export.product.image.url"));
				titleList.add(myLocale.getText("export.product.warehouse"));
				
				titleList.add(myLocale.getText("export.product.shelf.position"));
				titleList.add(myLocale.getText("export.product.stock"));
				titleList.add(myLocale.getText("export.product.fbc.freight"));
				data.add(titleList);
				
				for (Integer id : ids) {
					ArrayList<String> contentList = new ArrayList<String>();
					Product product = productDao.getProductById(id);
					contentList.add(StringUtils.isEmpty(product.getSku()) ? "" : product.getSku());
					contentList.add(StringUtils.isEmpty(product.getNameCn()) ? "" : product.getNameCn());
					contentList.add(product.getPackageWeight() == null ? "" : String.valueOf(product.getPackageWeight()));
					contentList.add(product.getPackageLength() == null ? "" : String.valueOf(product.getPackageLength()));
					contentList.add(product.getPackageWidth() == null ? "" :  String.valueOf(product.getPackageWidth()));
					contentList.add(product.getPackageHeight() == null ? "" :  String.valueOf(product.getPackageHeight()));
					contentList.add(product.getPurchasePrice() == null ? "" : String.valueOf(product.getPurchasePrice()));
					contentList.add(StringUtils.isEmpty(product.getDeclarationNameCn()) ? "" : product.getDeclarationNameCn());
					contentList.add(StringUtils.isEmpty(product.getDeclarationNameEn()) ? "" : product.getDeclarationNameEn());
					contentList.add("");
					contentList.add("");
					contentList.add(StringUtils.isEmpty(product.getMainImage()) ? "" : product.getMainImage());
					contentList.add("");
					contentList.add("");
					contentList.add("");
					contentList.add("");
					data.add(contentList);
				}
				
				if (CollectionUtils.isNotEmpty(data)) {
					String fileName = "exportProductInfo_" + new MyDate().getCurrentFullDateTime() + "." +Constant.XSLEXTENSION;
					Excel excel = new Excel(fileName);
					File file = excel.arrayToXSL(data);
					return file;
				}
			}
		}
		return null;
	}

	public List<String> getSpuList() {
		return productDao.getSpuList();
	}

	public List<String> getSkuListBySpu(String spu) {
		return productDao.getSkuListBySpu(spu);
	}
}
