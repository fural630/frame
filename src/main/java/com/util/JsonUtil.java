package com.util;

import com.google.gson.Gson;

public class JsonUtil {
	public static String toJsonStr(Object object) {
		Gson gson = new Gson();
		return gson.toJson(object);
	}
}
