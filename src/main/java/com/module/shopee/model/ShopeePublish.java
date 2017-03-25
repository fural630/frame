package com.module.shopee.model;

public class ShopeePublish {
	private Integer id;
	private String sku;
	private String parentSku;
	private String categoryPath;
	private Integer categoryId;
	private String productName;
	private Double price;
	private Integer stock;
	private Double weight;
	private Integer shipOutIn;
	private String brand;
	private String description;
	private Integer status;
	private Integer publishUserId;
	private String mainImage;
	private String imageStr;
	private String variationName;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	public String getParentSku() {
		return parentSku;
	}
	public void setParentSku(String parentSku) {
		this.parentSku = parentSku;
	}
	public String getCategoryPath() {
		return categoryPath;
	}
	public void setCategoryPath(String categoryPath) {
		this.categoryPath = categoryPath;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public Integer getShipOutIn() {
		return shipOutIn;
	}
	public void setShipOutIn(Integer shipOutIn) {
		this.shipOutIn = shipOutIn;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getPublishUserId() {
		return publishUserId;
	}
	public void setPublishUserId(Integer publishUserId) {
		this.publishUserId = publishUserId;
	}
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public String getImageStr() {
		return imageStr;
	}
	public void setImageStr(String imageStr) {
		this.imageStr = imageStr;
	}
	public String getVariationName() {
		return variationName;
	}
	public void setVariationName(String variationName) {
		this.variationName = variationName;
	}
}
