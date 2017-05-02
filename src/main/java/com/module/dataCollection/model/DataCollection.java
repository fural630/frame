package com.module.dataCollection.model;

public class DataCollection {
	private String color;
	private String size;
	private String imageUrl;
	private Integer canBookCount;
	private Integer saleCount;
	private Integer beginAmount;
	private Double refPrice;
	private Double weight;
	private Double freight;
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
	public Integer getSaleCount() {
		return saleCount;
	}
	public void setSaleCount(Integer saleCount) {
		this.saleCount = saleCount;
	}
	public Integer getBeginAmount() {
		return beginAmount;
	}
	public void setBeginAmount(Integer beginAmount) {
		this.beginAmount = beginAmount;
	}
	public Double getRefPrice() {
		return refPrice;
	}
	public void setRefPrice(Double refPrice) {
		this.refPrice = refPrice;
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
}
