package com.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.axis2.databinding.types.soapencoding.Array;

import com.google.api.translate.Language;
import com.google.api.translate.Translate;

public class Test {
	public static void main(String[] args) {
//		Translate.setHttpReferrer("http://code.google.com/p/google-api-translate-java/");
//		String str = "apple";
//		try {
//			String result=Translate.execute(str, Language.ENGLISH, Language.CHINESE);
//			System.out.println(result);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		List<Integer> list1 = new ArrayList<Integer>();
		list1.add(1);
		list1.add(35);
		List<Integer> list2 = new ArrayList<Integer>();
		list2.add(3);
		list2.add(1);
		list1.retainAll(list2);
		Dumper.dump(list1);
	}
}
