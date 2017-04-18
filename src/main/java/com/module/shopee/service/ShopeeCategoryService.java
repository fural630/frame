package com.module.shopee.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.code.Page;
import com.module.frame.model.TranslateBean;
import com.module.frame.service.TranslateService;
import com.module.shopee.dao.ShopeeCategoryDao;
import com.module.shopee.model.ShopeeCategory;
import com.util.MyDate;

@Service
public class ShopeeCategoryService {
	
	@Autowired(required = false)
	private ShopeeCategoryDao shopeeCategoryDao;
	
	@Autowired
	private TranslateService translateService;

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
					shopeeCategory.setImportTime(new MyDate().getCurrentDateTime());
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

	public String appendCategoryPath(Integer categoryId) {
		String categoryPath = "";
		ShopeeCategory shopeeCategory3 = shopeeCategoryDao.getShopeeCategoryByCategoryId(categoryId);
		if (null == shopeeCategory3) {
			return categoryPath;
		}
		categoryPath += shopeeCategory3.getCategoryName() + " > ";
		ShopeeCategory shopeeCategory2 = shopeeCategoryDao.getShopeeCategoryById(shopeeCategory3.getParentId());
		categoryPath += shopeeCategory2.getCategoryName() + " > ";
		ShopeeCategory shopeeCategory1 = shopeeCategoryDao.getShopeeCategoryById(shopeeCategory2.getParentId());
		categoryPath += shopeeCategory1.getCategoryName();
		return categoryPath;
	}

	public void translateToCn() {
		List<String> categoryNameList = shopeeCategoryDao.getDistinctCategoryName();
		if (CollectionUtils.isNotEmpty(categoryNameList)) {
			for (String categoryNameEn : categoryNameList) {
				String text = categoryNameEn;
				System.out.println("==== 89 ===> " + text);
				TranslateBean translateBean = new TranslateBean();
				translateBean.setText(text);
				translateBean.setSourceLanguage("en");
				translateBean.setTargetLanguage("zh-CN");
				String result = translateService.translate(translateBean, false);
				System.out.println("==== 97 ===> " + result);
				if (StringUtils.isNotEmpty(result)) {
					String categoryNameCn = result;
					String value = categoryNameEn + "(" + categoryNameCn + ")";
					shopeeCategoryDao.updateCategoryToCn(categoryNameEn, value);
				}
			}
		}
	}
	
	
	
}
