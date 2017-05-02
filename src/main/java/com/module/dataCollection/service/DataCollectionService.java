package com.module.dataCollection.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.code.Page;
import com.module.dataCollection.DataCollectionUtil;
import com.module.dataCollection.dao.DataCollectionDao;
import com.module.dataCollection.model.DataCollection;

@Service
public class DataCollectionService {
	
	@Autowired(required = false)
	private DataCollectionDao dataCollectionDao;

	public List<DataCollection> spiderProduct(String collectionUrl) {
		DataCollectionUtil dataCollection = new DataCollectionUtil(collectionUrl);
		List<DataCollection> aliProductList = dataCollection.split1688Product();
		return aliProductList;
	}

	public void saveCollectionResult(List<DataCollection> dataCollectionList) {
		for (DataCollection dataCollection : dataCollectionList) {
			dataCollectionDao.insertDataCollection(dataCollection);
		}
	}

	public List<Map<String, Object>> getCollectionPage(Page page) {
		return dataCollectionDao.getCollectionPage(page);
	}

	public void deleteDataCollectionById(Integer id) {
		dataCollectionDao.deleteDataCollectionById(id);
	}
	
}
