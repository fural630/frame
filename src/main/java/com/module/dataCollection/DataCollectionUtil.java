package com.module.dataCollection;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.application.libraries.constentEnum.DataCollectionStatusEnum;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.JavaScriptPage;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.WebClientOptions;
import com.gargoylesoftware.htmlunit.html.DomNodeList;
import com.gargoylesoftware.htmlunit.html.HtmlDivision;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.google.gson.Gson;
import com.module.dataCollection.model.DataCollection;
import com.module.dataCollection.model.DetailConfig;
import com.util.Dumper;
import com.util.MyDate;

public class DataCollectionUtil {
	
	private String url; 
	
	public static void main(String[] args) {
		String url = "https://detail.1688.com/offer/549003619896.html";
		WebClient client = new WebClient();
		WebClientOptions webClientOptions = client.getOptions();
		webClientOptions.setJavaScriptEnabled(false);
		webClientOptions.setCssEnabled(false);
		webClientOptions.setThrowExceptionOnScriptError(false);
		
		HtmlPage page;
		try {
			page = client.getPage(url);
			HtmlElement htmlElementBody = page.getBody();
			HtmlDivision div = (HtmlDivision) page.getByXPath("//div[@class='tab-content-container']").get(0);
			Document document = Jsoup.parse(div.asXml());
			Elements elements = document.select("li.tab-trigger");
			for (Element element : elements) {
				System.out.println(element.attr("data-imgs"));
			}
		} catch (FailingHttpStatusCodeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public DataCollectionUtil(String url) {
		this.url = url;
	}
	
	public List<DataCollection> split1688Product() {
		WebClient client = initNewWebClient();
		List<DataCollection> dataCollection = new ArrayList<DataCollection>();
		try {
			HtmlPage page = client.getPage(this.url);
			
			HtmlDivision div = (HtmlDivision) page.getByXPath("//div[@class='tab-content-container']").get(0);
			Document imageDocument = Jsoup.parse(div.asXml());
			Elements imageLiElements = imageDocument.select("li.tab-trigger");
			String mainImage = "";
			if (CollectionUtils.isNotEmpty(imageLiElements)) {
				Gson gson = new Gson();
				Element imageLiElement = imageLiElements.get(0);
				String imageJson = removeSpace(imageLiElement.attr("data-imgs"));
				if (StringUtils.isNotBlank(imageJson)) {
					Map<String, String> imageMap = gson.fromJson(imageJson, Map.class);
					if (!imageMap.isEmpty()) {
						mainImage = imageMap.get("original");
					}
				}
			}
			HtmlElement htmlElementBody = page.getBody();
			DomNodeList<HtmlElement> scriptList = htmlElementBody.getElementsByTagName("script");
			DetailConfig detailConfig = new DetailConfig();
			Map<String, Object> skuMap = new HashMap<String, Object>();
			for (HtmlElement htmlElement : scriptList) {
				String scriptData = htmlElement.asXml();
				if (scriptData.contains("skuProps")) {
					detailConfig = parseDetailConfig(scriptData);
					skuMap = paraseDetialData(scriptData);
					break;
				}
			}
			dataCollection = analysisSkuMap(skuMap, detailConfig, mainImage);
		} catch (FailingHttpStatusCodeException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			client.close();
		}
		return dataCollection;
	}
	
	private String getWidgetListDoUrlParam(DetailConfig detailConfig) {
		String paramUrl = detailConfig.getStaticUrl() + "?";
		Map<String, String> paramMap = new LinkedHashMap<String, String>();
		paramMap.put("callback", "jQuery" + ("1720" + Math.random()).replaceAll("\\D", "") + "_" + new Date().getTime());
		paramMap.put("blocks", "");
		paramMap.put("data", "offerdetail_ditto_postage");
		paramMap.put("offerId", detailConfig.getOfferid());
		paramMap.put("pageId", detailConfig.getPageid());
		for (String key : paramMap.keySet()) {
			paramUrl += key + "=" + paramMap.get(key) + "&";
		}
		paramUrl = paramUrl.substring(0, paramUrl.length() - 1);
		return paramUrl;
	}
	
	private String calculateFreight(DetailConfig detailConfig, Map<String, Object> offerdetailDittoPostageMap) {
		Gson gson = new Gson();
		String freightUrl = getFreightDoUrlParam(offerdetailDittoPostageMap, detailConfig);
		JavaScriptPage page;
		WebClient client = initNewWebClient();
		try {
			page = client.getPage(freightUrl);
			String content = page.getContent();
			content = content.substring(content.indexOf("(") + 1, content.length() - 1);
			Map<String, Object> freightMap = gson.fromJson(content, Map.class);
			Map<String, Object> dataMap = (Map<String, Object>) freightMap.get("data");
			List<Object> costs = (List<Object>) dataMap.get("costs");
			Map<String, String> costMap = (Map<String, String>) costs.get(0);
			String freight = costMap.get("cost");
			return freight;
		} catch (FailingHttpStatusCodeException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			client.close();
		}
		return null;
	}

	private String getFreightDoUrlParam(Map<String, Object> offerdetailDittoPostageMap,
			DetailConfig detailConfig) {
		String unitWeight = offerdetailDittoPostageMap.get("unitWeight").toString();
		Integer freightTemplateId = new Integer((int) (double) new Double(offerdetailDittoPostageMap.get("freightTemplateId").toString()));
		String freightUrl = "https://laputa.1688.com/offer/ajax/CalculateFreight.do?";
		Map<String, String> paramMap = new LinkedHashMap<String, String>();
		paramMap.put("callback", "jQuery" + ("1720" + Math.random()).replaceAll("\\D", "") + "_" + new Date().getTime());
		paramMap.put("amount", "1");
		paramMap.put("weight", unitWeight);
		paramMap.put("price", detailConfig.getRefPrice());
		paramMap.put("templateId", String.valueOf(freightTemplateId));
		paramMap.put("memberId", detailConfig.getMemberid());
		paramMap.put("volume", "0");
		paramMap.put("offerId", detailConfig.getOfferid());
		paramMap.put("countryCode", "1001");
		paramMap.put("provinceCode", "3478");
		paramMap.put("cityCode", "3522");
		for (String key : paramMap.keySet()) {
			freightUrl += key + "=" + paramMap.get(key) + "&";
		}
		freightUrl = freightUrl.substring(0, freightUrl.length() - 1);
		return freightUrl;
	}


	/**
	 * 获取商品重量等信息
	 * @param detailConfig
	 * @return
	 */
	private Map<String, Object> getUnitWeight(DetailConfig detailConfig) {
		WebClient client = initNewWebClient();
		try {
			Gson gson = new Gson();
			String widgetListDoUrl = getWidgetListDoUrlParam(detailConfig);
			HtmlPage page = client.getPage(widgetListDoUrl);
			String unitWidgetInfo = removeSpace(page.getBody().asText());
			unitWidgetInfo = unitWidgetInfo.substring(unitWidgetInfo.indexOf("(") + 1, unitWidgetInfo.length() - 1);
			Map<String, Object> widgetMap = gson.fromJson(unitWidgetInfo, Map.class);
			Map<String, Object> dataMap1 = (Map<String, Object>) widgetMap.get("data");
			Map<String, Object> dataMap2 = (Map<String, Object>) dataMap1.get("data");
			Map<String, Object> offerdetailDittoPostageMap = (Map<String, Object>) dataMap2.get("offerdetail_ditto_postage");
			Dumper.dump(offerdetailDittoPostageMap);
			return offerdetailDittoPostageMap;
		} catch (FailingHttpStatusCodeException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			client.close();
		}
		return null;
	}

	private List<DataCollection> analysisSkuMap(Map<String, Object> skuMap, DetailConfig detailConfig, String mainImage) {
		
		List<DataCollection> aliProductList = new ArrayList<DataCollection>();
		
		Map<String, Object> offerdetailDittoPostageMap = getUnitWeight(detailConfig);
		String freight = calculateFreight(detailConfig, offerdetailDittoPostageMap);
		
		Double unitWeight = new Double(offerdetailDittoPostageMap.get("unitWeight").toString());
		String unit = offerdetailDittoPostageMap.get("unit").toString();
		
		List<Object> skuProps =  (List<Object>) skuMap.get("skuProps");
		Map<String, Object> variatonColorMap = (Map<String, Object>) skuProps.get(0);
		List<Object> variationColorList = (List<Object>) variatonColorMap.get("value");
		Map<String, Object> variaitonDetailMap = (Map<String, Object>) skuMap.get("skuMap");
		
		if (CollectionUtils.isNotEmpty(variationColorList)) {
			Map<String, Object> variatonSizeMap = null;
			List<Object> variationSizeList = null;
			if (skuProps.size() == 2) {
				variatonSizeMap = (Map<String, Object>) skuProps.get(1);
				variationSizeList = (List<Object>) variatonSizeMap.get("value");
			}
			
			for (Object variationColorObj : variationColorList) {
				Map<String, String> detailVariationColorMap = (Map<String, String>) variationColorObj;
				String imageUrl = detailVariationColorMap.get("imageUrl");
				if (StringUtils.isEmpty(imageUrl)) {
					imageUrl = mainImage;
				}
				String variationColorName = detailVariationColorMap.get("name");
				if (CollectionUtils.isNotEmpty(variationSizeList)) {
					for (Object variationSizeObj : variationSizeList) {
						Map<String, String> detailVariationSizeMap = (Map<String, String>) variationSizeObj;
						String variationSizeName = detailVariationSizeMap.get("name");
						String variationKey = variationColorName + "&gt;" + variationSizeName;
						DataCollection aliProduct = mergeAliProduct(variationKey, 
								variaitonDetailMap, imageUrl, detailConfig, freight, unitWeight, unit);
						aliProductList.add(aliProduct);
					}
				} else {
					String variationKey = variationColorName;
					DataCollection aliProduct = mergeAliProduct(variationKey, 
							variaitonDetailMap, imageUrl, detailConfig, freight, unitWeight, unit);
					aliProductList.add(aliProduct);
				}
			}
		}
		return aliProductList;
	}

	private DataCollection mergeAliProduct(String variationKey,
			Map<String, Object> variaitonDetailMap, String imageUrl, 
			DetailConfig detailConfig, String freight, Double unitWeight, String unit) {
		Map<String, Object> detailMap = (Map<String, Object>) variaitonDetailMap.get(variationKey);

		Integer canBookCount = 0;
		Integer saleCount = 0;
		
		if (detailMap != null) {
			canBookCount = new Integer((int) (double) new Double(detailMap.get("canBookCount").toString()));
			saleCount = new Integer((int) (double) new Double(detailMap.get("saleCount").toString()));
		}
		
		DataCollection dataCollection = new DataCollection();
		dataCollection.setBeginAmount(Integer.parseInt(detailConfig.getBeginAmount()));
		dataCollection.setCanBookCount(saleCount);
		String color = "";
		String size = null;
		if (variationKey.contains("&gt;")) {
			color = variationKey.split("&gt;")[0];
			size = variationKey.split("&gt;")[1];
		} else {
			color = variationKey;
		}
		dataCollection.setColor(color);
		dataCollection.setPrice(Double.valueOf(detailConfig.getRefPrice()));
		dataCollection.setCanBookCount(canBookCount);
		dataCollection.setImageUrl(imageUrl);
		dataCollection.setSize(size);
		dataCollection.setFreight(Double.valueOf(freight));
		dataCollection.setUrl(this.url);
		dataCollection.setStatus(DataCollectionStatusEnum.WAIT_EDIT.getValue());
		dataCollection.setCollectionTime(new MyDate().getCurrentDateTime());
		dataCollection.setWeight(unitWeight * 1000);
		dataCollection.setUnit(unit);
		Dumper.dump(dataCollection);
		return dataCollection;
	}


	/**
	 * 解析
	 * @param scriptData
	 * @return
	 */
	private Map<String, Object> paraseDetialData(String scriptData) {
		Gson gson = new Gson();
		String detailDataStr = scriptData;
		int start = detailDataStr.indexOf("iDetailData = {");
		int end = detailDataStr.lastIndexOf("};");
		detailDataStr = detailDataStr.substring(start + 15, end);
		String dest = removeSpace(detailDataStr);
		dest = dest.replace("\"sku\":", "");
		Map<String, Object> skuMap = gson.fromJson(dest, Map.class);
		return skuMap;
	}


	
	/**
	 * 解析DetailConfig 保存成对象
	 * @param scriptData
	 * @return
	 */
	private DetailConfig parseDetailConfig(String scriptData) {
		Gson gson = new Gson();
		int start = scriptData.indexOf("iDetailConfig = ");
		int end = scriptData.indexOf("};");
		String detailConfigStr = scriptData.substring(start + 16, end + 1);
		String dest = removeSpace(detailConfigStr);
        DetailConfig detailConfig = gson.fromJson(dest, DetailConfig.class);
		return detailConfig;
	}
	
	/**
	 * 去除空格空白等信息
	 * @param data
	 * @return
	 */
	private String removeSpace(String data) {
		if (StringUtils.isNotEmpty(data)) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(data);
            String dest = m.replaceAll("");
            return dest;
        }
		return data;
	}
	
	/**
	 * 初始化webclient
	 * @return
	 */
	public WebClient initNewWebClient() {
		WebClient client = new WebClient();
		WebClientOptions webClientOptions = client.getOptions();
		webClientOptions.setJavaScriptEnabled(false);
		webClientOptions.setCssEnabled(false);
		webClientOptions.setThrowExceptionOnScriptError(false);
		return client;
	}
}
