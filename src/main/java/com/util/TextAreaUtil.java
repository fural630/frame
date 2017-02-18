package com.util;

import org.apache.commons.lang.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.TextNode;

public class TextAreaUtil {
	
	public static String removeHtmlTag(String text) {
		if (StringUtils.isNotEmpty(text)) {
			StringBuilder sb = new StringBuilder();
			Document document = Jsoup.parseBodyFragment(text);
			Document translated = document.clone();
			System.out.println("-----------去除HTML标签前："+ text);
			for (Node elm : translated.childNodes()) {
				processElement(elm, sb);
			}
			System.out.println("-----------去除HTML标签后："+ sb.toString());
			return sb.toString();
		}
		return text;
	}
	
	private static void processElement(Node elm, StringBuilder sb) {
		if (elm instanceof TextNode) {
			TextNode tn = (TextNode) elm;
			appendTerm(sb, tn.text());
		}
		for (Node c : elm.childNodes()) {
			processElement(c, sb);
		}
	}
	
	private static void appendTerm(StringBuilder sb, String text) {
		sb.append(text);
		sb.append("");
	}

}
