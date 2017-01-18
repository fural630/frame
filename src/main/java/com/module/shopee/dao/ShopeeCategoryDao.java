package com.module.shopee.dao;

import org.apache.ibatis.annotations.Param;

import com.module.shopee.model.ShopeeCategory;

public interface ShopeeCategoryDao {

	public ShopeeCategory getCategoryByNameAndParentId(@Param("categoryName") String categoryName,@Param("parentId") Integer parentId);

	public void insertShopeeCategory(ShopeeCategory shopeeCategory);

}
