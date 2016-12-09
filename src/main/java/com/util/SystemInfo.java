package com.util;

import javax.servlet.ServletContext;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

public class SystemInfo
/*    */ {
/*    */   public SystemInfo() {}
/*    */   
/*    */   public static String getAppPath()
/*    */   {
/*    */     String appPath;
/*    */     try
/*    */     {
				WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();  
			    ServletContext servletContext = webApplicationContext.getServletContext();  
/* 28 */       	appPath = servletContext.getRealPath("/");
/* 29 */       if (!appPath.endsWith("/")) {
/* 30 */         appPath = appPath + "/";
/*    */       }
/*    */     } catch (Exception e) {
/* 33 */       appPath = "/project/SmartErp/web/";
/*    */     }
/*    */     
/* 36 */     return appPath;
/*    */   }
/*    */   
/*    */   public static String getScriptPath() {
/* 46 */     return getAppPath() + "WEB-INF/classes/com/script/";
/*    */   }
/*    */   
/*    */   public static String getClassesPath() {
/* 50 */     return getAppPath() + "WEB-INF/classes/";
/*    */   }
/*    */   
/*    */   public static String getProjectPath() {
/* 54 */     return getAppPath() + "WEB-INF/classes/com/";
/*    */   }
/*    */ }