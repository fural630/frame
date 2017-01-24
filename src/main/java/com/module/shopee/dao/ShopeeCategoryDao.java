package com.module.shopee.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.code.Page;
import com.module.shopee.model.ShopeeCategory;

public interface ShopeeCategoryDao {

	public ShopeeCategory getCategoryByNameAndParentId(@Param("categoryName") String categoryName, @Param("parentId") Integer parentId);

	public void insertShopeeCategory(ShopeeCategory shopeeCategory);
	
	public void deleteAllCategory();

	public List<Map<String, Object>> getCategoryPage(Page page);
	
	public List<ShopeeCategory> getShopeeCategoryByParentId(Integer parentId);

}
