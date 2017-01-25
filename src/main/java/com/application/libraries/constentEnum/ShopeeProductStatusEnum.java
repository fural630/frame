package com.application.libraries.constentEnum;

public enum ShopeeProductStatusEnum {
	EDIT_ING(5),
	FINISH_EDIT(10);
	
	Integer value;
	private ShopeeProductStatusEnum(Integer value) {
		this.value = value;
	}
	
	public Integer getValue() {
		return value;
	}
}
