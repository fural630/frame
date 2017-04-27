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

import org.apache.axis2.databinding.types.soapencoding.Array;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.JavaScriptPage;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.WebClientOptions;
import com.gargoylesoftware.htmlunit.html.DomNodeList;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.google.gson.Gson;
import com.util.Dumper;

public class DataCollection {
	
//	private String url = "https://detail.1688.com/offer/43204628325.html";
//	private String url = "https://detail.1688.com/offer/544194014037.html";
//	private String url = "https://detail.1688.com/offer/532801295431.html";
	private String url = "https://detail.1688.com/offer/42882683215.html?spm=a262l.8315111.j1oag3t7.50.FC2qRD";
	
	public static void main(String[] args) {
		DataCollection dataCollection = new DataCollection();
		dataCollection.split1688Product();
	}
	
	public void split1688Product() {
		WebClient client = initNewWebClient();
		try {
			HtmlPage page = client.getPage(url);
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
			String freight = calculateFreight(detailConfig);
			analysisSkuMap(skuMap, detailConfig, freight);
		} catch (FailingHttpStatusCodeException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
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
	
	private String calculateFreight(DetailConfig detailConfig) {
		Gson gson = new Gson();
		Map<String, Object> offerdetailDittoPostageMap = getUnitWeight(detailConfig);
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
		}
		return null;
	}

	private void analysisSkuMap(Map<String, Object> skuMap, DetailConfig detailConfig, String freight) {
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
				String variationColorName = detailVariationColorMap.get("name");
				if (CollectionUtils.isNotEmpty(variationSizeList)) {
					for (Object variationSizeObj : variationSizeList) {
						Map<String, String> detailVariationSizeMap = (Map<String, String>) variationSizeObj;
						String variationSizeName = detailVariationSizeMap.get("name");
						String variationKey = variationColorName + "&gt;" + variationSizeName;
						mergeAliProduct(variationKey, variaitonDetailMap, imageUrl, detailConfig, freight);
						
					}
				} else {
					String variationKey = variationColorName;
					mergeAliProduct(variationKey, variaitonDetailMap, imageUrl, detailConfig, freight);
				}
			}
		}
	}



	private void mergeAliProduct(String variationKey,
			Map<String, Object> variaitonDetailMap, String imageUrl, DetailConfig detailConfig, String freight) {
		Map<String, Object> detailMap = (Map<String, Object>) variaitonDetailMap.get(variationKey);

		Integer canBookCount = 0;
		Integer saleCount = 0;
		
		if (detailMap != null) {
			canBookCount = new Integer((int) (double) new Double(detailMap.get("canBookCount").toString()));
			saleCount = new Integer((int) (double) new Double(detailMap.get("saleCount").toString()));
		}
		
		AliProduct aliProduct = new AliProduct();
		aliProduct.setBeginAmount(Integer.parseInt(detailConfig.getBeginAmount()));
		aliProduct.setCanBookCount(saleCount);
		String color = "";
		String size = null;
		if (variationKey.contains("&gt;")) {
			color = variationKey.split("&gt;")[0];
			size = variationKey.split("&gt;")[1];
		} else {
			color = variationKey;
		}
		aliProduct.setColor(color);
		aliProduct.setRefPrice(Double.valueOf(detailConfig.getRefPrice()));
		aliProduct.setCanBookCount(canBookCount);
		aliProduct.setImageUrl(imageUrl);
		aliProduct.setSaleCount(saleCount);
		aliProduct.setSize(size);
		aliProduct.setFeight(Double.valueOf(freight));
		Dumper.dump(aliProduct);
	}



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



	private DetailConfig parseDetailConfig(String scriptData) {
		Gson gson = new Gson();
		int start = scriptData.indexOf("iDetailConfig = ");
		int end = scriptData.indexOf("};");
		String detailConfigStr = scriptData.substring(start + 16, end + 1);
		String dest = removeSpace(detailConfigStr);
        DetailConfig detailConfig = gson.fromJson(dest, DetailConfig.class);
		return detailConfig;
	}
	
	private String removeSpace(String data) {
		if (StringUtils.isNotEmpty(data)) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(data);
            String dest = m.replaceAll("");
            return dest;
        }
		return data;
	}
	
	public WebClient initNewWebClient() {
		WebClient client = new WebClient();
		WebClientOptions webClientOptions = client.getOptions();
		webClientOptions.setJavaScriptEnabled(false);
		webClientOptions.setCssEnabled(false);
		webClientOptions.setThrowExceptionOnScriptError(false);
		return client;
	}
}
