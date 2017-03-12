package com.module.shopee.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.code.Page;
import com.module.product.model.Product;
import com.module.shopee.model.ShopeePublish;

public interface ShopeePublishDao {

	public Integer getUserShopeeSkuCount(Integer userId);

	public List<Product> getShopeeSkuList(Integer userId);

	public void insertShopeePublish(ShopeePublish shopeePublish);

	public List<Map<String, Object>> getShopeePublishManagePage(Page page);

	public void deleteShopeeProduct(Integer id);

	public ShopeePublish getShopeePublishById(Integer id);
	
	public void updateShopeePublish(ShopeePublish shopeePublish);

	public List<ShopeePublish> getShopeePublishBySpuNoEnId(@Param("parentSku")String parentSku, @Param("id")Integer id);
	
}
