package com.application.libraries.select;

import java.util.LinkedHashMap;
import java.util.Map;

import com.application.libraries.constentEnum.TimeQueryEnum;
import com.util.MyLocale;

public class TimeQuery {
	public Map<String, String> getOptions() {
        Map<String, String> options = new LinkedHashMap<String, String>();
        MyLocale myLocale = new MyLocale();
    	for (TimeQueryEnum status : TimeQueryEnum.values()) {
    		options.put(status.getValue(), myLocale.getText(status.toString()));
    	}
        return options;
    }
}
