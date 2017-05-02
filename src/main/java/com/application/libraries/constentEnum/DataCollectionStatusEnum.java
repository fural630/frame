package com.application.libraries.constentEnum;


public enum DataCollectionStatusEnum {
	WAIT_EDIT(5),
	FINISH_EDIT(10),
	MOVE_TO_PRODUCT(15);
	
	Integer value;
	private DataCollectionStatusEnum(Integer value) {
		this.value = value;
	}
	public Integer getValue() {
		return value;
	}
}
