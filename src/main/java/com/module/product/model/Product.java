package com.module.product.model;

public class Product {
	private Integer id;
	
	private String sku;
	private String spu;
	
	private String nameCn;
	private String nameEn;
	private String nameFr;
	private String nameDe;
	private String nameJp;
	private String nameIt;
	private String nameEs;
	
	private String declarationNameCn;//中文报关名
	private String declarationNameEn;//英文报关名
	
	private String purchaseUrl;//采购链接
	private Double purchasePrice;//采购价格
	private String purchaseNotes;//采购备注
	private String salesNotes;//销售备注
	
	private Double packageWeight;
	private Double packageLength;
	private Double packageWidth;
	private Double packageHeight;
	
	private String descriptionCn;
	private String descriptionEn;
	private String descriptionFr;
	private String descriptionDe;
	private String descriptionJp;
	private String descriptionIt;
	private String descriptionEs;
	
	private String briefDescriptionCn;
	private String briefDescriptionEn;
	private String briefDescriptionFr;
	private String briefDescriptionDe;
	private String briefDescriptionJp;
	private String briefDescriptionEs;
	private String briefDescriptionIt;
	
	private String optionLog;
	private Integer creatorId;
	private Integer editorId;
	private Integer publishUserId;
	private Integer auditStatus;
	
	private String createTime;
	private String updateTime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	public String getSpu() {
		return spu;
	}
	public void setSpu(String spu) {
		this.spu = spu;
	}
	public String getNameCn() {
		return nameCn;
	}
	public void setNameCn(String nameCn) {
		this.nameCn = nameCn;
	}
	public String getNameEn() {
		return nameEn;
	}
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	public String getNameFr() {
		return nameFr;
	}
	public void setNameFr(String nameFr) {
		this.nameFr = nameFr;
	}
	public String getNameDe() {
		return nameDe;
	}
	public void setNameDe(String nameDe) {
		this.nameDe = nameDe;
	}
	public String getNameJp() {
		return nameJp;
	}
	public void setNameJp(String nameJp) {
		this.nameJp = nameJp;
	}
	public String getNameIt() {
		return nameIt;
	}
	public void setNameIt(String nameIt) {
		this.nameIt = nameIt;
	}
	public String getNameEs() {
		return nameEs;
	}
	public void setNameEs(String nameEs) {
		this.nameEs = nameEs;
	}
	public String getDeclarationNameCn() {
		return declarationNameCn;
	}
	public void setDeclarationNameCn(String declarationNameCn) {
		this.declarationNameCn = declarationNameCn;
	}
	public String getDeclarationNameEn() {
		return declarationNameEn;
	}
	public void setDeclarationNameEn(String declarationNameEn) {
		this.declarationNameEn = declarationNameEn;
	}
	public String getPurchaseUrl() {
		return purchaseUrl;
	}
	public void setPurchaseUrl(String purchaseUrl) {
		this.purchaseUrl = purchaseUrl;
	}
	public Double getPurchasePrice() {
		return purchasePrice;
	}
	public void setPurchasePrice(Double purchasePrice) {
		this.purchasePrice = purchasePrice;
	}
	public String getPurchaseNotes() {
		return purchaseNotes;
	}
	public void setPurchaseNotes(String purchaseNotes) {
		this.purchaseNotes = purchaseNotes;
	}
	public String getSalesNotes() {
		return salesNotes;
	}
	public void setSalesNotes(String salesNotes) {
		this.salesNotes = salesNotes;
	}
	public Double getPackageWeight() {
		return packageWeight;
	}
	public void setPackageWeight(Double packageWeight) {
		this.packageWeight = packageWeight;
	}
	public Double getPackageLength() {
		return packageLength;
	}
	public void setPackageLength(Double packageLength) {
		this.packageLength = packageLength;
	}
	public Double getPackageWidth() {
		return packageWidth;
	}
	public void setPackageWidth(Double packageWidth) {
		this.packageWidth = packageWidth;
	}
	public Double getPackageHeight() {
		return packageHeight;
	}
	public void setPackageHeight(Double packageHeight) {
		this.packageHeight = packageHeight;
	}
	public String getDescriptionCn() {
		return descriptionCn;
	}
	public void setDescriptionCn(String descriptionCn) {
		this.descriptionCn = descriptionCn;
	}
	public String getDescriptionEn() {
		return descriptionEn;
	}
	public void setDescriptionEn(String descriptionEn) {
		this.descriptionEn = descriptionEn;
	}
	public String getDescriptionFr() {
		return descriptionFr;
	}
	public void setDescriptionFr(String descriptionFr) {
		this.descriptionFr = descriptionFr;
	}
	public String getDescriptionDe() {
		return descriptionDe;
	}
	public void setDescriptionDe(String descriptionDe) {
		this.descriptionDe = descriptionDe;
	}
	public String getDescriptionJp() {
		return descriptionJp;
	}
	public void setDescriptionJp(String descriptionJp) {
		this.descriptionJp = descriptionJp;
	}
	public String getDescriptionIt() {
		return descriptionIt;
	}
	public void setDescriptionIt(String descriptionIt) {
		this.descriptionIt = descriptionIt;
	}
	public String getDescriptionEs() {
		return descriptionEs;
	}
	public void setDescriptionEs(String descriptionEs) {
		this.descriptionEs = descriptionEs;
	}
	public String getOptionLog() {
		return optionLog;
	}
	public void setOptionLog(String optionLog) {
		this.optionLog = optionLog;
	}
	public Integer getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(Integer creatorId) {
		this.creatorId = creatorId;
	}
	public Integer getEditorId() {
		return editorId;
	}
	public void setEditorId(Integer editorId) {
		this.editorId = editorId;
	}
	public Integer getPublishUserId() {
		return publishUserId;
	}
	public void setPublishUserId(Integer publishUserId) {
		this.publishUserId = publishUserId;
	}
	public Integer getAuditStatus() {
		return auditStatus;
	}
	public void setAuditStatus(Integer auditStatus) {
		this.auditStatus = auditStatus;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getBriefDescriptionCn() {
		return briefDescriptionCn;
	}
	public void setBriefDescriptionCn(String briefDescriptionCn) {
		this.briefDescriptionCn = briefDescriptionCn;
	}
	public String getBriefDescriptionEn() {
		return briefDescriptionEn;
	}
	public void setBriefDescriptionEn(String briefDescriptionEn) {
		this.briefDescriptionEn = briefDescriptionEn;
	}
	public String getBriefDescriptionFr() {
		return briefDescriptionFr;
	}
	public void setBriefDescriptionFr(String briefDescriptionFr) {
		this.briefDescriptionFr = briefDescriptionFr;
	}
	public String getBriefDescriptionDe() {
		return briefDescriptionDe;
	}
	public void setBriefDescriptionDe(String briefDescriptionDe) {
		this.briefDescriptionDe = briefDescriptionDe;
	}
	public String getBriefDescriptionJp() {
		return briefDescriptionJp;
	}
	public void setBriefDescriptionJp(String briefDescriptionJp) {
		this.briefDescriptionJp = briefDescriptionJp;
	}
	public String getBriefDescriptionEs() {
		return briefDescriptionEs;
	}
	public void setBriefDescriptionEs(String briefDescriptionEs) {
		this.briefDescriptionEs = briefDescriptionEs;
	}
	public String getBriefDescriptionIt() {
		return briefDescriptionIt;
	}
	public void setBriefDescriptionIt(String briefDescriptionIt) {
		this.briefDescriptionIt = briefDescriptionIt;
	}
	
}
