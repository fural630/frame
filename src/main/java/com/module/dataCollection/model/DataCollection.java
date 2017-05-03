package com.module.dataCollection.model;

import com.application.libraries.constentEnum.DataCollectionStatusEnum;

public class DataCollection {
	private Integer id;
	private String sku;
	private String spu;
	private Integer status = DataCollectionStatusEnum.WAIT_EDIT.getValue();
	private String url;
	private String color;
	private String size;
	private String imageUrl;
	private Integer canBookCount;
	private Integer beginAmount;
	private Double price;
	private Double weight;
	private Double freight;
	private String collectionTime;
	private String unit;
	
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	public String getSpu() {
		return spu;
	}
	public void setSpu(String spu) {
		this.spu = spu;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getCollectionTime() {
		return collectionTime;
	}
	public void setCollectionTime(String collectionTime) {
		this.collectionTime = collectionTime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public Integer getCanBookCount() {
		return canBookCount;
	}
	public void setCanBookCount(Integer canBookCount) {
		this.canBookCount = canBookCount;
	}
	public Integer getBeginAmount() {
		return beginAmount;
	}
	public void setBeginAmount(Integer beginAmount) {
		this.beginAmount = beginAmount;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public Double getFreight() {
		return freight;
	}
	public void setFreight(Double freight) {
		this.freight = freight;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
}
