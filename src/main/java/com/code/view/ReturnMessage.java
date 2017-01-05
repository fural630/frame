package com.code.view;

import com.application.libraries.constentEnum.ReturnMessageEnum;

public class ReturnMessage {
	private Integer status = ReturnMessageEnum.SUCCESS.getValue();
	private String message;
	private Object data;
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
}
