package com.module.dataCollection;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;

import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.WebClientOptions;
import com.gargoylesoftware.htmlunit.html.DomNodeList;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.google.gson.Gson;
import com.util.Dumper;

public class DataCollection {
	
	
	public static void main(String[] args) {
		String url = "https://detail.1688.com/offer/43204628325.html";
//		String url = "http://139.162.109.79:8080/";
		WebClient client = new WebClient();
		
		WebClientOptions webClientOptions = client.getOptions();
		webClientOptions.setJavaScriptEnabled(false);
		webClientOptions.setCssEnabled(false);
		webClientOptions.setThrowExceptionOnScriptError(false);
		
		try {
			HtmlPage page = client.getPage(url);
			HtmlElement htmlElement = page.getBody();
			DomNodeList<HtmlElement> scriptList = htmlElement.getElementsByTagName("script");
			String variationData = "";
			for (HtmlElement htmlElement2 : scriptList) {
				String scriptData = htmlElement2.asXml();
				System.out.println(scriptData);
//				if (scriptData.contains("priceRangeOriginal")) {
//					variationData = scriptData;
//					break;
//				}
			}
			
			if (StringUtils.isEmpty(variationData)) {
				return;
			}
			
			int start = variationData.indexOf("iDetailData = {");
			int end = variationData.lastIndexOf("};");
			variationData = variationData.substring(start + 15, end);
			String dest = "";
	        if (variationData!=null) {
	            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
	            Matcher m = p.matcher(variationData);
	            dest = m.replaceAll("");
	        }
	        dest = dest.replace("\"sku\":", "");
			System.out.println(dest);
			Gson gson = new Gson();
			Map<String, Object> skuMap = gson.fromJson(dest, Map.class);
			
			Dumper.dump(skuMap);
			
//			Document pageBody = Jsoup.parse(page.getBody().asXml());
//			System.out.println(pageBody.toString());
//			Elements ulList = pageBody.select("ul.list-leading");
//			if (CollectionUtils.isNotEmpty(ulList)) {
//				Elements variationList = ulList.get(0).children();
//				for (Element variationElement : variationList) {
//					Elements aList = variationElement.getElementsByTag("a");
//					if (CollectionUtils.isNotEmpty(aList)) {
//						Element aElement = aList.get(0);
//						String variationName = aElement.attr("title");
//						System.out.println(variationName);
//					}
//				}
//			}
//			
//			Element variationTable = pageBody.select("table.table-sku").get(0);
//			Elements trList = variationTable.getElementsByTag("tr");
//			if (CollectionUtils.isNotEmpty(trList)) {
//				for (Element trElement : trList) {
//					String name = trElement.select("td.name span").get(0).ownText();
//					String price = "";
//					String count = "";
//					Element priceElement = trElement.select("td.price span").get(0);
//					Elements priceEmList = priceElement.getElementsByTag("em");
//					if (CollectionUtils.isNotEmpty(priceEmList)) {
//						for (Element element : priceEmList) {
//							price += element.ownText();
//						}
//					}
//					Element countElement = trElement.select("td.count span").get(0);
//					Elements countEmList = countElement.getElementsByTag("em");
//					if (CollectionUtils.isNotEmpty(countEmList)) {
//						for (Element element : countEmList) {
//							count += element.ownText();
//						}
//					}
//					System.out.println(name + " : " + price + " : " + count);
//				}
//			}
			
//			HtmlElement element = (HtmlElement) page.getByXPath("//ul[@class='list-leading']").get(0);
//			DomNodeList<HtmlElement> elements = element.getElementsByTagName("li");
//			for (HtmlElement htmlElement : elements) {
//				HtmlElement a = htmlElement.getElementsByTagName("a").get(0);
//				String result = a.asXml();
//				HtmlPage variationPage = a.click();
//				Document variationPageBody = Jsoup.parse(variationPage.getBody().asXml());
//				System.out.println(variationPageBody.select("ul.list-leading").first().toString());
//				Element variationTable = variationPageBody.select("table.table-sku").get(0);
//				Elements trList = variationTable.getElementsByTag("tr");
//				if (CollectionUtils.isNotEmpty(trList)) {
//					for (Element trElement : trList) {
//						String name = trElement.select("td.name span").get(0).ownText();
//						String price = "";
//						String count = "";
//						Element priceElement = trElement.select("td.price span").get(0);
//						Elements priceEmList = priceElement.getElementsByTag("em");
//						if (CollectionUtils.isNotEmpty(priceEmList)) {
//							for (Element element2 : priceEmList) {
//								price += element2.ownText();
//							}
//						}
//						Element countElement = trElement.select("td.count span").get(0);
//						Elements countEmList = countElement.getElementsByTag("em");
//						if (CollectionUtils.isNotEmpty(countEmList)) {
//							for (Element element2 : countEmList) {
//								count += element2.ownText();
//							}
//						}
//						System.out.println(name + " : " + price + " : " + count);
//					}
//					System.out.println();
//				}
//			}
 			
		} catch (FailingHttpStatusCodeException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
