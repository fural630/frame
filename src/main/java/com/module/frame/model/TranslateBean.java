package com.module.frame.model;

public class TranslateBean {
	private String text;
	private String targetLanguage;		//要翻译的语言
	private String sourceLanguage;		//原语言
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getTargetLanguage() {
		return targetLanguage;
	}
	public void setTargetLanguage(String targetLanguage) {
		this.targetLanguage = targetLanguage;
	}
	public String getSourceLanguage() {
		return sourceLanguage;
	}
	public void setSourceLanguage(String sourceLanguage) {
		this.sourceLanguage = sourceLanguage;
	}
}
