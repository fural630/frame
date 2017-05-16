package com.application.libraries.constentEnum;

public enum LanguageEnum {
	CHINESE("zh-CN"), 
	ENGLISH("en"),
	JAPANESE("ja"),
	FRENCH("fr"),
	SPANISH("es"),
	GERMAN("de"),
	ITALIAN("it");
	      
	String value;
	private LanguageEnum(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}
}
