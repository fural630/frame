package com.module.dataCollection.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.module.dataCollection.DataCollectionUtil;
import com.module.dataCollection.model.DataCollection;

@Service
public class DataCollectionService {
	
	

	public List<DataCollection> spiderProduct(String collectionUrl) {
		DataCollectionUtil dataCollection = new DataCollectionUtil(collectionUrl);
		List<DataCollection> aliProductList = dataCollection.split1688Product();
		return aliProductList;
	}

	public void saveCollectionResult(List<DataCollection> aliProductList) {
		
		
	}
	
}
