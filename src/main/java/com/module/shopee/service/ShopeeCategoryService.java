package com.module.shopee.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.code.Page;
import com.module.shopee.dao.ShopeeCategoryDao;
import com.module.shopee.model.ShopeeCategory;

@Service
public class ShopeeCategoryService {
	
	@Autowired(required = false)
	private ShopeeCategoryDao shopeeCategoryDao;

	public void uploadCategory(ArrayList<ArrayList<String>> data) {
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
	}

	public void deleteShopeeCategory() {
		shopeeCategoryDao.deleteAllCategory();
	}

	public List<Map<String, Object>> getCategoryPage(Page page) {
		return shopeeCategoryDao.getCategoryPage(page);
	}

	public List<ShopeeCategory> getShopeeCategoryByParentId(Integer parentId) {
		return shopeeCategoryDao.getShopeeCategoryByParentId(parentId);
	}
	
	
	
}
