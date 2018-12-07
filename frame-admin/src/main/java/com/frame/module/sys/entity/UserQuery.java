package com.frame.module.sys.entity;

public class UserQuery {
	
	private Long idEq;
	
	private String nameEq;

    /**
     * 1-男、0-女、其他-未知
     */
    private Integer sexEq;

    /**
     * 部门编号ID
     */
    private Long departmentCidEq;

    /**
     * 账号
     */
    private String accountEq;

    /**
     * 状态：1-正常，0-删除
     */
    private Integer statusEq;


    private Long updateUserIdEq;


	public Long getIdEq() {
		return idEq;
	}


	public void setIdEq(Long idEq) {
		this.idEq = idEq;
	}


	public String getNameEq() {
		return nameEq;
	}


	public void setNameEq(String nameEq) {
		this.nameEq = nameEq;
	}


	public Integer getSexEq() {
		return sexEq;
	}


	public void setSexEq(Integer sexEq) {
		this.sexEq = sexEq;
	}


	public Long getDepartmentCidEq() {
		return departmentCidEq;
	}


	public void setDepartmentCidEq(Long departmentCidEq) {
		this.departmentCidEq = departmentCidEq;
	}


	public String getAccountEq() {
		return accountEq;
	}


	public void setAccountEq(String accountEq) {
		this.accountEq = accountEq;
	}


	public Integer getStatusEq() {
		return statusEq;
	}


	public void setStatusEq(Integer statusEq) {
		this.statusEq = statusEq;
	}


	public Long getUpdateUserIdEq() {
		return updateUserIdEq;
	}


	public void setUpdateUserIdEq(Long updateUserIdEq) {
		this.updateUserIdEq = updateUserIdEq;
	}
}
