package com.module.shopee.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.libraries.constentEnum.ShopeeProductStatusEnum;
import com.code.Page;
import com.code.session.UserSingleton;
import com.google.gson.Gson;
import com.module.product.dao.ProductDao;
import com.module.product.model.Product;
import com.module.shopee.dao.ShopeePublishDao;
import com.module.shopee.model.ShopeePublish;
import com.module.system.model.User;
import com.util.MyDate;
import com.util.MyLocale;
import com.util.SystemInfo;

@Service
public class ShopeePublishService {
	
	@Autowired(required = false)
	private ShopeePublishDao shopeePublishDao;
	
	@Autowired(required = false)
	private ProductDao productDao;

	public Integer getUserShopeeSkuCount() {
		User user = UserSingleton.getInstance().getUser();
		Integer count = shopeePublishDao.getUserShopeeSkuCount(user.getId());
		return count;
	}

	public List<Product> getShopeeSkuList() {
		User user = UserSingleton.getInstance().getUser();
		List<Product> productList = shopeePublishDao.getShopeeSkuList(user.getId());
		return productList;
	}

	public boolean obtainShopeePublishSku(List<String> productIdList) {
		for (String id : productIdList) {
			Integer productId = Integer.parseInt(id);
			Product product = productDao.getProductById(productId);
			if (null != product) {
				ShopeePublish shopeePublish = new ShopeePublish();
				shopeePublish.setSku(product.getSku());
				shopeePublish.setParentSku(product.getSpu());
				shopeePublish.setDescription(product.getDescriptionCn());
				shopeePublish.setProductName(product.getNameCn());
				shopeePublish.setPublishUserId(product.getPublishUserId());
				Double weight = product.getPackageWeight() == null ? null :  product.getPackageWeight() / 1000;
				shopeePublish.setWeight(weight);
				shopeePublish.setMainImage(product.getMainImage());
				shopeePublish.setStatus(ShopeeProductStatusEnum.EDIT_ING.getValue());
				insertShopeePublish(shopeePublish);
			}
		}
		return true;
	}
	
	public void insertShopeePublish(ShopeePublish shopeePublish) {
		User user = UserSingleton.getInstance().getUser();
		shopeePublish.setPublishUserId(user.getId());
		shopeePublishDao.insertShopeePublish(shopeePublish);
	}

	public List<Map<String, Object>> getShopeePublishManagePage(Page page) {
		return shopeePublishDao.getShopeePublishManagePage(page);
	}

	public void deleteShopeeProduct(Integer id) {
		shopeePublishDao.deleteShopeeProduct(id);
	}

	public ShopeePublish getShopeePublishById(Integer id) {
		return shopeePublishDao.getShopeePublishById(id);
	}

	public void updateShopeePublish(ShopeePublish shopeePublish) {
		shopeePublishDao.updateShopeePublish(shopeePublish);
	}

	public List<ShopeePublish> getShopeePublishBySpuNoEnId(String parentSku, Integer id) {
		return shopeePublishDao.getShopeePublishBySpuNoEnId(parentSku, id);
	}

	public File exportShopeeUploadData(String params) {
		if (StringUtils.isNotEmpty(params)) {
			List<Integer> ids = new ArrayList<Integer>();
			String idList[] = params.split(",");
			if (idList.length > 0) {
				for (int i = 0; i < idList.length; i++) {
					Integer productId = Integer.parseInt(idList[i]);
					ids.add(productId);
				}
				
			}
			if (CollectionUtils.isNotEmpty(ids)) {
				Gson gson = new Gson();
				CopyOnWriteArrayList<ArrayList<String>> productData = new CopyOnWriteArrayList<ArrayList<String>>();
				String fileName = "upload-shopee-product-" + new MyDate().getCurrentFullDateTime() + ".xlsm";
				String path = SystemInfo.getAppPath()+"download/template/shopee_product.xls";
				try {
					XSSFWorkbook wb = new XSSFWorkbook(path);
					Map<String, List<ShopeePublish>> groupMap = new LinkedHashMap<String, List<ShopeePublish>>(); 
					for (Integer shopeeId : ids) {
						ShopeePublish shopeePublish = shopeePublishDao.getShopeePublishById(shopeeId);
						if (null != shopeePublish) {
							String parentSku = shopeePublish.getParentSku();
							List<ShopeePublish> shopeePublishList = null;
 							if (null == groupMap.get(parentSku)) {
 								shopeePublishList = new ArrayList<ShopeePublish>();
 								shopeePublishList.add(shopeePublish);
 								groupMap.put(parentSku, shopeePublishList);
							} else {
								shopeePublishList = groupMap.get(parentSku);
								shopeePublishList.add(shopeePublish);
								groupMap.put(parentSku, shopeePublishList);
							}
							
						}
					}
					if (null != groupMap && !groupMap.isEmpty()) {
						for (String parentSku : groupMap.keySet()) {
							List<ShopeePublish> shopeePublishList = groupMap.get(parentSku);
							ArrayList<String> row = new ArrayList<String>();
							ShopeePublish baseShopeePublish = shopeePublishList.get(0);
							String categoryId = String.valueOf(baseShopeePublish.getCategoryId());
							String productName = baseShopeePublish.getProductName();
							String description = baseShopeePublish.getDescription();
							String price = String.valueOf(baseShopeePublish.getPrice());
							String stock = String.valueOf(baseShopeePublish.getStock());
							String weight = String.valueOf(baseShopeePublish.getWeight());
							String shopInOut = String.valueOf(baseShopeePublish.getShipOutIn());
							String imageStr = baseShopeePublish.getImageStr();
							List<String> imageList = gson.fromJson(imageStr, ArrayList.class);
							row.add(categoryId);
							row.add(productName);
							row.add(description);
							row.add(price);
							row.add(stock);
							row.add(weight);
							row.add(shopInOut);
							row.add(parentSku);
							row.add("");
							if (shopeePublishList.size() < 15){
								for (int i = 0; i < shopeePublishList.size(); i++) {
									row.add(shopeePublishList.get(i).getSku()); // Variation 1: SKU Ref. No. ：SKU 1
									row.add(shopeePublishList.get(i).getVariationName()); 
									row.add(String.valueOf(shopeePublishList.get(i).getPrice())); 
									row.add(String.valueOf(shopeePublishList.get(i).getStock()));
								}
								for(int i = 0 ; i < 15 - shopeePublishList.size(); i++){
									row.add(null);
									row.add(null);
									row.add(null);
									row.add(null);
								}
							}else{
								for (int i = 0; i < 15; i++) {
									row.add(shopeePublishList.get(i).getSku()); // Variation 1: SKU Ref. No. ：SKU 1
									row.add(shopeePublishList.get(i).getVariationName()); 
									row.add(String.valueOf(shopeePublishList.get(i).getPrice())); 
									row.add(String.valueOf(shopeePublishList.get(i).getStock()));
								}
							}
							if (CollectionUtils.isNotEmpty(imageList)) {
								for (String image : imageList) {
									row.add(image);
								}
							}
							productData.add(row);
						}
						ArrayList<ArrayList<String>> templists = new ArrayList<ArrayList<String>>();
						for (ArrayList<String> cl : productData) {
							templists.add(cl);
						}
						File file = arrayToXSL(templists, wb, true, fileName);
						return file;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	
	public File arrayToXSL(ArrayList<ArrayList<String>> data, XSSFWorkbook workbook, boolean flag, String fileName) {
		MyLocale myLocale = new MyLocale();
		String path = "/tmp/" + fileName;
		FileOutputStream file = null;
		try {
			List<ArrayList<String>> arrayList = data;
			file = new FileOutputStream(path);
			XSSFSheet sheet;
			if(flag){
				sheet = workbook.getSheetAt(0);
			}else{
				sheet = workbook.createSheet();
			}
			XSSFRow row ;
			int size = arrayList.size();
			if(flag){
				for (int i = 6; i < size + 6; i++) {
					row = sheet.createRow(i);
					for (int j = 0; j < arrayList.get(i-6).size(); j++) {
						if (null == arrayList.get(i-6).get(j)) {
							continue;
						} else {
							XSSFCell cell = row.createCell(j);
							String value = arrayList.get(i-6).get(j);
							if (value.length() >= 32767) {
								value = myLocale.getText("value.beyond.cell.limit.maximum.length");
							}
							Pattern pattern = Pattern.compile( "^[0-9]\\d*$", Pattern.CASE_INSENSITIVE); 
							
							Matcher matcher = pattern.matcher(value);
							if(matcher.find()  ){
								cell.setCellValue(Integer.parseInt(value));
							
							}else{
								cell.setCellValue(value);
							}
						}
					}
				}
			}else{
				for (int i = 0; i < size ; i++) {
					row = sheet.createRow(i);
					for (int j = 0; j < arrayList.get(i).size(); j++) {
						XSSFCell cell = row.createCell(j);
						if (null == arrayList.get(i).get(j)) {
							cell.setCellValue("");
						} else {
							String value = arrayList.get(i).get(j);
							if (value.length() >= 32767) {
								value = myLocale.getText("value.beyond.cell.limit.maximum.length");
							}
							cell.setCellValue(value);
						}
					}
				}
			}
			workbook.write(file);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				file.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return new File(path);
	}
}
