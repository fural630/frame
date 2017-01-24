package com.module.shopee.dao;

import java.util.List;

import com.module.product.model.Product;

public interface ShopeePublishDao {

	public Integer getUserShopeeSkuCount(Integer userId);

	public List<Product> getShopeeSkuList(Integer userId);
	
}
