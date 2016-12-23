package com.util;

import java.util.ArrayList;
import java.util.List;

public class MyJsUtil {
	public static void main(String[] args) {
		List<String> list = new ArrayList<String>();
		list.add("id");
		list.add("sku");
		list.add("spu");
		list.add("nameCn");
		list.add("nameEn");
		list.add("nameFr");
		list.add("nameDe");
		list.add("nameIt");
		list.add("nameJp");
		list.add("nameEs");
		list.add("declarationNameCn");
		list.add("declarationNameEn");
		list.add("purchasePrice");
		list.add("purchaseUrl");
		list.add("purchaseNotes");
		list.add("salesNotes");
		list.add("packageWeight");
		list.add("packageWidth");
		list.add("packageHeight");
		list.add("packageLength");
		list.add("descriptionCn");
		list.add("descriptionEn");
		list.add("descriptionFr");
		list.add("descriptionDe");
		list.add("descriptionJp");
		list.add("descriptionEs");
		list.add("descriptionIt");
		list.add("briefDescriptionCn");
		list.add("briefDescriptionEn");
		list.add("briefDescriptionFr");
		list.add("briefDescriptionDe");
		list.add("briefDescriptionJp");
		list.add("briefDescriptionEs");
		list.add("briefDescriptionIt");
		list.add("optionLog");
		list.add("editorId");
		list.add("publishUserId");
		list.add("auditStatus");
		list.add("updateTime");
		list.add("creatorId");
		list.add("createTime");
		
		String result = "";
		for (String field : list) {
//			result += "dialog.find(\"input[name="+field+"]\").val(product."+field+");\n";
//			result += "CKEDITOR.instances[\""+field+"\"].setData(product."+field+");\n";
			result += "<if test=\""+field+" !=null and "+field+" !=''\">" + "\n";
			result += "	" + field + " = " + "#{" + field + "}" + "," + "\n";
			result += "</if>"  + "\n";
		}
		System.out.println(result);
	}
}
