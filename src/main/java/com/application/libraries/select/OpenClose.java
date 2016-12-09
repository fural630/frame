package com.application.libraries.select;

import java.util.LinkedHashMap;
import java.util.Map;

import com.application.libraries.constentEnum.OpenCloseEnum;
import com.util.MyLocale;

public class OpenClose {
	public Map<String, String> getOptions() {
        Map<String, String> options = new LinkedHashMap<String, String>();
        MyLocale myLocale = new MyLocale();
    	for (OpenCloseEnum status : OpenCloseEnum.values()) {
    		options.put(String.valueOf(status.getValue()), myLocale.getText(status.toString()));
    	}
        return options;
    }	
}
