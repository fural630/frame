package com.module.product.model;

import java.util.List;

public class ZtreeNode {
	
	private String name;
	private boolean open;
	private boolean isParent;
	private boolean nocheck;
	private List<ZtreeNode> children;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	public boolean isParent() {
		return isParent;
	}
	public void setParent(boolean isParent) {
		this.isParent = isParent;
	}
	public List<ZtreeNode> getChildren() {
		return children;
	}
	public void setChildren(List<ZtreeNode> children) {
		this.children = children;
	}
	public boolean isNocheck() {
		return nocheck;
	}
	public void setNocheck(boolean nocheck) {
		this.nocheck = nocheck;
	}
}
