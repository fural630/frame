package com.frame.util;

import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.frame.xss.SQLFilter;


public class Query extends LinkedHashMap<String, Object>{
	private static final long serialVersionUID = 1L;
	
	protected final String FIELD = "field";
	protected final String ORDER = "order";
	
	
	public Query(Map<String, Object> params) {
        this.putAll(params);
        //防止SQL注入（因为sidx、order是通过拼接SQL实现排序的，会有SQL注入风险）
        if (null != params.get(FIELD) && null != params.get(ORDER)) {
        	String field = params.get(FIELD).toString();
        	String order = params.get(ORDER).toString();
        	this.put("field", SQLFilter.sqlInject(field));
        	this.put("order", SQLFilter.sqlInject(order));
        }
    }

}
