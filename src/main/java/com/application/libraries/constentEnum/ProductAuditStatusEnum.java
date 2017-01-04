package com.application.libraries.constentEnum;

public enum ProductAuditStatusEnum {
	WAIT_DISTRIBUTE(5),		//待分配
	WAIT_EDIT(10),		//待编辑
	WAIT_AUDITED(15),		//待审核
	AUDITED(20);		//审核通过
	
	Integer value;
	private ProductAuditStatusEnum(Integer value) {
		this.value = value;
	}
	
	public Integer getValue() {
		return value;
	}
}
