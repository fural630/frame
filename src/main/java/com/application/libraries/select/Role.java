package com.application.libraries.select;

import java.util.LinkedHashMap;
import java.util.Map;

import com.application.libraries.constentEnum.RoleEnum;
import com.util.MyLocale;

public class Role {
	public Map<String, String> getOptions() {
        Map<String, String> options = new LinkedHashMap<String, String>();
        MyLocale myLocale = new MyLocale();
    	for (RoleEnum status : RoleEnum.values()) {
    		options.put(String.valueOf(status.getValue()), myLocale.getText(status.toString()));
    	}
        return options;
    }	
}
