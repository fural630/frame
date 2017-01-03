package com.application.libraries.constentEnum;

public enum RoleEnum {
	EMPLOYEE(5),		//员工
	SUPERVISOR(10),		//主管
	MANAGER(15),		//经理
	ADMIN(100);			//超级管理员
	
	Integer value;
	private RoleEnum (Integer value) {
		this.value = value;
	}
	
	public Integer getValue() {
		return value;
	}
}
