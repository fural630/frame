package com.module.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.libraries.constentEnum.ProductAuditStatusEnum;
import com.code.Page;
import com.code.session.UserSingleton;
import com.module.product.dao.ProductDao;
import com.module.product.model.Product;
import com.module.system.model.User;
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
		product.setAuditStatus(ProductAuditStatusEnum.WAIT_EDIT.getValue());
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

	public void deleteProductById(Integer id) {
		productDao.deleteProductById(id);
		productDao.deleteProductImageByProductId(id);
	}
}
