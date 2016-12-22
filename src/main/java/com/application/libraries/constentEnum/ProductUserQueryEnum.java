package com.application.libraries.constentEnum;

public enum ProductUserQueryEnum {
	CREATOR("creator"),
	EDITOR("editor"),
	PUBLISH_USER("publishUser");
	
	String value;
	private ProductUserQueryEnum(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}
}
