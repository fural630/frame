package com.module.shopee.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.module.shopee.dao.ShopeeCategoryDao;
import com.module.shopee.model.ShopeeCategory;

@Service
public class ShopeeCategoryService {
	
	@Autowired(required = false)
	private ShopeeCategoryDao shopeeCategoryDao;

	public Map uploadCategory(ArrayList<ArrayList<String>> data) {
		Map outputData = new HashMap();
    	for (int i = 1; i < data.size(); i++) {
			List<String> row = data.get(i);
			if (CollectionUtils.isEmpty(row)) {
				continue;
			}
			Integer parentId = 0;
			Integer categoryId = Integer.parseInt(row.get(3));
			for (int j = 0; j < 3; j++) {
				String categoryName = row.get(j);
				ShopeeCategory tempShopeeCategory = shopeeCategoryDao.getCategoryByNameAndParentId(categoryName, parentId);
				if (null != tempShopeeCategory) {
					parentId = tempShopeeCategory.getId();
				} else {
					ShopeeCategory shopeeCategory = new ShopeeCategory();
					shopeeCategory.setCategoryName(categoryName);
					shopeeCategory.setLevel((j+1));
					shopeeCategory.setParentId(parentId);
					if (j == 2) {
						shopeeCategory.setCategoryId(categoryId);
					}
					shopeeCategoryDao.insertShopeeCategory(shopeeCategory);
					parentId = shopeeCategory.getId();
				}
				
			}
    	}
		outputData.put("result", "T");
    	return outputData;
	}
	
	private ShopeeCategory parseShopeeCategory(String categoryName, Integer parentId, int level, Integer categoryId) {
		ShopeeCategory shopeeCategory = shopeeCategoryDao.getCategoryByNameAndParentId(categoryName, parentId);
		if (null == shopeeCategory) {
			ShopeeCategory category = new ShopeeCategory();
			if (level == 3) {
				category.setCategoryId(categoryId);
			}
			category.setCategoryName(categoryName);
			category.setLevel(level);
			category.setParentId(parentId);
			shopeeCategoryDao.insertShopeeCategory(category);
			if (level == 3) {
//				return;
			} else {
//				parseShopeeCategory()
			}
		}
		return null;
	}
	
	
	
}
