package com.module.product.dao;

import java.util.List;
import java.util.Map;

import com.code.Page;
import com.module.product.model.Product;

public interface ProductDao {

	public List<Map<String, Object>> getProductPage(Page page);
	public void insertProduct(Product product);
	public void insertProductImage(Map<String, Object> productImageMap);
	public Product getProductById(Integer id);
	public List<String> getProductImage(Integer productId);
	public void updateProduct(Product product);
	public void deleteProductImageByProductId(Integer productId);
	public void deleteProductById(Integer id);

}
