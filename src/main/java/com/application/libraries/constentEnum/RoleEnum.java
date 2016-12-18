package com.application.libraries.constentEnum;

public enum RoleEnum {
	EMPLOYEE(5),
	SUPERVISOR(10),
	MANAGER(15),
	ADMIN(100);
	
	Integer value;
	private RoleEnum (Integer value) {
		this.value = value;
	}
	
	public Integer getValue() {
		return value;
	}
}
