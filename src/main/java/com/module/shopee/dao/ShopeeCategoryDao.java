package com.module.shopee.dao;

import com.module.shopee.model.ShopeeCategory;

public interface ShopeeCategoryDao {

	public ShopeeCategory getCategoryByNameAndParentId(String categoryName, Integer parentId);

	public void insertShopeeCategory(ShopeeCategory shopeeCategory);

}
