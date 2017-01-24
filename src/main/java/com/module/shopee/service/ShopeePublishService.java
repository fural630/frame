package com.module.shopee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.code.session.UserSingleton;
import com.module.product.model.Product;
import com.module.shopee.dao.ShopeePublishDao;
import com.module.system.model.User;

@Service
public class ShopeePublishService {
	
	@Autowired(required = false)
	private ShopeePublishDao shopeePublishDao;

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
	
}
