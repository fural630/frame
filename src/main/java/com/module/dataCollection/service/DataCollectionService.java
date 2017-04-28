package com.module.dataCollection.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.module.dataCollection.AliProduct;
import com.module.dataCollection.DataCollection;

@Service
public class DataCollectionService {

	public List<AliProduct> spiderProduct(String collectionUrl) {
		DataCollection dataCollection = new DataCollection(collectionUrl);
		List<AliProduct> aliProductList = dataCollection.split1688Product();
		return aliProductList;
	}
	
}
