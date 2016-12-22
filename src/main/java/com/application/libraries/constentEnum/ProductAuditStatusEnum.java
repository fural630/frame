package com.application.libraries.constentEnum;

public enum ProductAuditStatusEnum {
	WAIT_DISTRIBUTE(5),
	WAIT_EDIT(10),
	WAIT_AUDITED(15),
	AUDITED(20);
	
	Integer value;
	private ProductAuditStatusEnum(Integer value) {
		this.value = value;
	}
	
	public Integer getValue() {
		return value;
	}
}
