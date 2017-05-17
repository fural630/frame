package com.module.system.model;

public class PlatformSite {
	private Integer id;
	private Integer platformId;
	private Integer currencyId;
	private String language;
	private String siteNameCn;
	private String siteNameEn;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPlatformId() {
		return platformId;
	}
	public void setPlatformId(Integer platformId) {
		this.platformId = platformId;
	}
	public Integer getCurrencyId() {
		return currencyId;
	}
	public void setCurrencyId(Integer currencyId) {
		this.currencyId = currencyId;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getSiteNameCn() {
		return siteNameCn;
	}
	public void setSiteNameCn(String siteNameCn) {
		this.siteNameCn = siteNameCn;
	}
	public String getSiteNameEn() {
		return siteNameEn;
	}
	public void setSiteNameEn(String siteNameEn) {
		this.siteNameEn = siteNameEn;
	}
	
}
