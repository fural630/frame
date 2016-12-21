package com.module.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.code.Page;
import com.module.product.dao.ProductDao;

@Service
public class ProductService {
	
	@Autowired(required = false)
	private ProductDao productDao;
	
	public List<Map<String, Object>> getProductPage(Page page) {
		return productDao.getProductPage(page);
	}
}
