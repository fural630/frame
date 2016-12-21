package com.application.libraries.constentEnum;

public enum ProductNameQueryEnum {
	NAME_CN("nameCn"),
	NAME_EN("nameEn");
	
	String value;
	private ProductNameQueryEnum(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}
}
