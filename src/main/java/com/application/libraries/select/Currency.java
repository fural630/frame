package com.application.libraries.select;

import java.util.LinkedHashMap;
import java.util.Map;

import com.application.libraries.constentEnum.CurrencyEnum;
import com.util.MyLocale;

public class Currency {
	public Map<String, String> getOptions() {
        Map<String, String> options = new LinkedHashMap<String, String>();
        MyLocale myLocale = new MyLocale();
    	for (CurrencyEnum status : CurrencyEnum.values()) {
    		options.put(String.valueOf(status.getValue()), myLocale.getText(status.toString()).toUpperCase());
    	}
        return options;
    }	
}
