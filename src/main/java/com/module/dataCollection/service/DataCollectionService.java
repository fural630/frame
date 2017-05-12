package com.module.dataCollection.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.libraries.constentEnum.DataCollectionStatusEnum;
import com.application.libraries.constentEnum.ProductAuditStatusEnum;
import com.application.libraries.constentEnum.ReturnMessageEnum;
import com.code.Page;
import com.code.session.UserSingleton;
import com.code.view.ReturnMessage;
import com.module.dataCollection.DataCollectionUtil;
import com.module.dataCollection.dao.DataCollectionDao;
import com.module.dataCollection.model.DataCollection;
import com.module.product.dao.ProductDao;
import com.module.product.model.Product;
import com.module.system.model.User;
import com.util.MyDate;
import com.util.MyLocale;
import com.util.SysRemark;

@Service
public class DataCollectionService {
	
	@Autowired(required = false)
	private DataCollectionDao dataCollectionDao;
	
	@Autowired(required = false)
	private ProductDao productDao;

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

	public DataCollection getDataCollectionById(Integer id) {
		return dataCollectionDao.getDataCollectionById(id);
	}
	
	public List<DataCollection> getDataCollectionListByUrl(String url) {
		return dataCollectionDao.getDataCollectionListByUrl(url);
	}

	public void updateDataCollection(DataCollection dataCollection) {
		dataCollectionDao.updateDataCollection(dataCollection);
	}

	public synchronized ReturnMessage moveToProduct(String idList) {
		ReturnMessage message = new ReturnMessage();
		String resultMessage = "";
		MyLocale myLocale = new MyLocale();
		if (StringUtils.isNotEmpty(idList)) {
			List<DataCollection> dataCollections = new ArrayList<DataCollection>();
			for (String idStr : idList.split(",")) {
				Integer dataCollectionId = Integer.parseInt(idStr);
				DataCollection dataCollection = dataCollectionDao.getDataCollectionById(dataCollectionId);
				if (null != dataCollection) {
					dataCollections.add(dataCollection);
				}
			}
			
			List<String> statusErrorIdList = new ArrayList<String>(); 
			
			for (DataCollection dataCollection : dataCollections) {
				if (!dataCollection.getStatus().equals(DataCollectionStatusEnum.FINISH_EDIT.getValue())) {
					statusErrorIdList.add(String.valueOf(dataCollection.getId()));
				}
			}
			
			if (CollectionUtils.isNotEmpty(statusErrorIdList)) {
				resultMessage = myLocale.getText("status.is.error.to.move.product.id.is", statusErrorIdList.toString());
				message.setStatus(ReturnMessageEnum.FAIL.getValue());
				message.setMessage(resultMessage);
				return message;
			}
			
			if (CollectionUtils.isNotEmpty(dataCollections)) {
				for (DataCollection dataCollection : dataCollections) {
					String idStr = String.valueOf(dataCollection.getId());
					String sku = dataCollection.getSku();
					if (StringUtils.isEmpty(sku)) {
						resultMessage = myLocale.getText("sku.is.required", idStr);
						message.setStatus(ReturnMessageEnum.FAIL.getValue());
						message.setMessage(resultMessage);
						return message;
					} else {
						Product product = productDao.getProductBySku(sku);
						if (null != product) {
							resultMessage = myLocale.getText("sku.is.exist.in.product", idStr, sku);
							message.setStatus(ReturnMessageEnum.FAIL.getValue());
							message.setMessage(resultMessage);
							return message;
						}
					}
				}
				User user = UserSingleton.getInstance().getUser();
				MyDate myDate = new MyDate();
				for (DataCollection dataCollection : dataCollections) {
					String sku = dataCollection.getSku();
					Product oldProduct = productDao.getProductBySku(sku);
					if (null != oldProduct) {
						continue;
					}
					Product product = new Product();
					product.setSku(dataCollection.getSku());
					product.setSpu(dataCollection.getSpu());
					product.setColor(dataCollection.getColor());
					product.setSize(dataCollection.getSize());
					product.setCreatorId(user.getId());
					product.setPurchaseUrl(dataCollection.getUrl());
					product.setPurchasePrice(dataCollection.getPrice());
					product.setCreateTime(myDate.getCurrentDateTime());
					product.setMainImage(dataCollection.getImageUrl());
					product.setPackageWeight(dataCollection.getWeight());
					product.setAuditStatus(ProductAuditStatusEnum.WAIT_DISTRIBUTE.getValue());
					product.setOptionLog(SysRemark.appendMore("", myLocale.getText("create.by.spider")));
					product.setFreight(dataCollection.getFreight());
					
					productDao.insertProduct(product);
					
					List<String> productImageList = new ArrayList<String>();
					productImageList.add(dataCollection.getImageUrl());
					if(CollectionUtils.isNotEmpty(productImageList)) {
						Map<String, Object> productImageMap = new HashMap<String, Object>();
						productImageMap.put("productId", product.getId());
						productImageMap.put("imageList", productImageList);
						productDao.insertProductImage(productImageMap);
					}
					
					dataCollection.setStatus(DataCollectionStatusEnum.MOVE_TO_PRODUCT.getValue());
					dataCollectionDao.updateDataCollection(dataCollection);
				}
			}
		}
		return message;
	}

}
