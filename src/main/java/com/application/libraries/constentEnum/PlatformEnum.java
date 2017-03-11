package com.application.libraries.constentEnum;

public enum PlatformEnum {
	CDISCOUNT(5),
	AMAZON(10),
	SHOPEE(15),
	LAZADA(20),
	PAYTM(25);
	
	Integer value;
	private PlatformEnum (Integer value) {
		this.value = value;
	}
	
	public Integer getValue() {
		return value;
	}
}
