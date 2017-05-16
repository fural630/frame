package com.application.libraries.constentEnum;

public enum CurrencyEnum {
	CNY(1),
	MYR(2),
	USD(3),
	EUR(4),
	HKD(5),
	GBP(6);
	
	Integer value;
	private CurrencyEnum(Integer value) {
		this.value = value;
	}
	public Integer getValue() {
		return value;
	}
}
