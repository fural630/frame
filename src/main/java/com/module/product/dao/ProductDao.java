package com.module.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.code.Page;
import com.module.product.model.Product;
import com.module.product.model.ProductAudit;

public interface ProductDao {

	public List<Map<String, Object>> getProductPage(Page page);
	public void insertProduct(Product product);
	public void insertProductImage(Map<String, Object> productImageMap);
	public Product getProductById(Integer id);
	public List<String> getProductImage(Integer productId);
	public void updateProduct(Product product);
	public void deleteProductImageByProductId(Integer productId);
	public void deleteProductById(Integer id);
	public Integer getProductEditUser(Integer productId);
	public Integer getProductPublishUser(Integer productId);
	public void saveProductEditUser(@Param("userId")Integer userId, @Param("productId")Integer productId);
	public void saveProductPublishUser(@Param("userId")Integer userId, @Param("productId")Integer productId);
	
	public List<ProductAudit> getProductAuditListByProductId(Integer productId);
	public void insertProductAudit(ProductAudit productAudit);
	public Product getProductBySku(String sku);
	public void updateProductAuditStatus(@Param("productId")Integer productId, @Param("status")Integer status);
	public Integer getProductAuditStatus(Integer productId);
	public String getProductPurchaseUrl(Integer productId);
	public List<Product> checkCanUpdateSku(@Param("sku")String sku, @Param("productId")Integer productId);
	public List<Product> getProductBySpu(String spu);

}
