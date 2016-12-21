package com.module.product.dao;

import java.util.List;
import java.util.Map;

import com.code.Page;

public interface ProductDao {

	public List<Map<String, Object>> getProductPage(Page page);

}
