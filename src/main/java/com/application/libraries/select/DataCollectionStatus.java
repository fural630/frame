package com.application.libraries.select;

import java.util.LinkedHashMap;
import java.util.Map;

import com.application.libraries.constentEnum.DataCollectionStatusEnum;
import com.util.MyLocale;

public class DataCollectionStatus {
	public Map<String, String> getOptions() {
        Map<String, String> options = new LinkedHashMap<String, String>();
        MyLocale myLocale = new MyLocale();
    	for (DataCollectionStatusEnum status : DataCollectionStatusEnum.values()) {
    		options.put(String.valueOf(status.getValue()), myLocale.getText(status.toString()));
    	}
        return options;
    }	
}
