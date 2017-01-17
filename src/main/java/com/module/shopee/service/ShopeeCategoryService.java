package com.module.shopee.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.poi.hssf.record.PageBreakRecord.Break;
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
			String firstCategory = row.get(0);
			String secondCategory = row.get(1);
			String thirdCategory = row.get(2);
			Integer categoryId = Integer.parseInt(row.get(3));
			ShopeeCategory shopeeCategory1 = shopeeCategoryDao.getCategoryByNameAndParentId(firstCategory, 0);
			if (null == shopeeCategory1) {
				shopeeCategory1 = new ShopeeCategory();
				shopeeCategoryDao.insertShopeeCategory(shopeeCategory1);
				ShopeeCategory shopeeCategory2 = shopeeCategoryDao.getCategoryByNameAndParentId(secondCategory, shopeeCategory1.getId());
				if (null == shopeeCategory2) {
					shopeeCategory2 = new ShopeeCategory();
					shopeeCategoryDao.insertShopeeCategory(shopeeCategory2);
					ShopeeCategory shopeeCategory3 = shopeeCategoryDao.getCategoryByNameAndParentId(thirdCategory, shopeeCategory2.getId());
					if (null == shopeeCategory3) {
						shopeeCategory3 = new ShopeeCategory();
						shopeeCategoryDao.insertShopeeCategory(shopeeCategory3);
					}
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
