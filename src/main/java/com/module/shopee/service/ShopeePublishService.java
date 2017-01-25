package com.module.shopee.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.libraries.constentEnum.ShopeeProductStatusEnum;
import com.code.Page;
import com.code.session.UserSingleton;
import com.module.product.dao.ProductDao;
import com.module.product.model.Product;
import com.module.shopee.dao.ShopeePublishDao;
import com.module.shopee.model.ShopeePublish;
import com.module.system.model.User;

@Service
public class ShopeePublishService {
	
	@Autowired(required = false)
	private ShopeePublishDao shopeePublishDao;
	
	@Autowired(required = false)
	private ProductDao productDao;

	public Integer getUserShopeeSkuCount() {
		User user = UserSingleton.getInstance().getUser();
		Integer count = shopeePublishDao.getUserShopeeSkuCount(user.getId());
		return count;
	}

	public List<Product> getShopeeSkuList() {
		User user = UserSingleton.getInstance().getUser();
		List<Product> productList = shopeePublishDao.getShopeeSkuList(user.getId());
		return productList;
	}

	public boolean obtainShopeePublishSku(List<String> productIdList) {
		for (String id : productIdList) {
			Integer productId = Integer.parseInt(id);
			Product product = productDao.getProductById(productId);
			if (null != product) {
				ShopeePublish shopeePublish = new ShopeePublish();
				shopeePublish.setSku(product.getSku());
				shopeePublish.setParentSku(product.getSpu());
				shopeePublish.setDescription(product.getDescriptionEn());
				shopeePublish.setProductName(product.getNameEn());
				shopeePublish.setPublishUserId(product.getPublishUserId());
				Double weight = product.getPackageWeight() == null ? null :  product.getPackageWeight() / 1000;
				shopeePublish.setWeight(weight);
				shopeePublish.setMainImage(product.getMainImage());
				shopeePublish.setStatus(ShopeeProductStatusEnum.EDIT_ING.getValue());
				insertShopeePublish(shopeePublish);
			}
		}
		return true;
	}
	
	public void insertShopeePublish(ShopeePublish shopeePublish) {
		shopeePublishDao.insertShopeePublish(shopeePublish);
	}

	public List<Map<String, Object>> getShopeePublishManagePage(Page page) {
		return shopeePublishDao.getShopeePublishManagePage(page);
	}

	public void deleteShopeeProduct(Integer id) {
		shopeePublishDao.deleteShopeeProduct(id);
	}
	
}
