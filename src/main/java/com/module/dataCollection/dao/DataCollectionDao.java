package com.module.dataCollection.dao;

import java.util.List;
import java.util.Map;

import com.code.Page;
import com.module.dataCollection.model.DataCollection;

public interface DataCollectionDao {
	public void insertDataCollection(DataCollection dataCollection);

	public List<Map<String, Object>> getCollectionPage(Page page);

	public void deleteDataCollectionById(Integer id);
}
