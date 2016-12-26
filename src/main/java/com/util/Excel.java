package com.util;
/*     */ 
/*     */ import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ public class Excel
/*     */ {
/*     */   private final String fileName;
/*     */   
/*     */   public Excel(String fileName)
/*     */   {
/*  52 */     this.fileName = fileName;
/*     */   }
/*     */   
/*     */   public ArrayList<ArrayList<String>> toArray() {
/*  56 */     ArrayList<ArrayList<String>> result = new ArrayList();
/*     */     try {
/*  58 */       InputStream is = new FileInputStream(this.fileName);
/*  59 */       Filename fn = new Filename(this.fileName);
/*  60 */       if ("xls".equals(fn.extension())) {
/*  61 */         result = _parseXSL(is, false);
/*  62 */       } else if ("xlsx".equals(fn.extension())) {
/*  63 */         result = _parseXSLX(is);
/*     */       }
/*  65 */       is.close();
/*     */     } catch (Exception e) {
/*  67 */       String message = "The supplied spreadsheet seems to be Excel 5.0/7.0 (BIFF5) format. POI only supports BIFF8 format (from Excel versions 97/2000/XP/2003)";
/*  68 */       if (message.equals(e.getMessage())) {
/*  69 */         result = null;
/*     */       }
/*  71 */       e.printStackTrace();
/*     */     }
/*     */     
/*  74 */     return result;
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */   public ArrayList<ArrayList<String>> toArray(boolean keepDigital)
/*     */   {
/*  81 */     ArrayList<ArrayList<String>> result = new ArrayList();
/*     */     try {
/*  83 */       InputStream is = new FileInputStream(this.fileName);
/*  84 */       Filename fn = new Filename(this.fileName);
/*  85 */       if ("xls".equals(fn.extension())) {
/*  86 */         result = _parseXSL(is, keepDigital);
/*  87 */       } else if ("xlsx".equals(fn.extension())) {
/*  88 */         result = _parseXSLX(is);
/*     */       }
/*  90 */       is.close();
/*  91 */     } catch (Exception e) { e.printStackTrace();
/*     */     }
/*  93 */     return result;
/*     */   }
/*     */   
/*     */   public File arrayToXSL(ArrayList<ArrayList<String>> data) {
/*  97 */     return arrayToXSL(data, null);
/*     */   }
/*     */   
/*     */   public File arrayToXSL(ArrayList<ArrayList<String>> data, String sheetName) {
/* 101 */     String path = "/tmp/" + this.fileName;
/*     */     try {
/* 103 */       FileOutputStream file = new FileOutputStream(path);
/* 104 */       HSSFWorkbook workbook = new HSSFWorkbook();
/* 105 */       HSSFSheet sheet = null;
/* 106 */       if (sheetName != null) {
/* 107 */         sheet = workbook.createSheet(sheetName);
/*     */       } else {
/* 109 */         sheet = workbook.createSheet();
/*     */       }
/* 111 */       int i = 0;
/* 112 */       Iterator localIterator2; for (Iterator localIterator1 = data.iterator(); localIterator1.hasNext(); 
/*     */           
/*     */ 
/* 115 */           localIterator2.hasNext())
/*     */       {
/* 112 */         List r = (List)localIterator1.next();
/* 113 */         HSSFRow row = sheet.createRow(i++);
/* 114 */         int j = 0;
/* 115 */         localIterator2 = r.iterator(); continue;Object column = localIterator2.next();
/* 116 */         HSSFCell cell = row.createCell(j++);
/* 117 */         if (column == null) {
/* 118 */           cell.setCellValue("");
/*     */         } else {
/* 120 */           cell.setCellValue(column.toString());
/*     */         }
/*     */       }
/*     */       
/* 124 */       workbook.write(file);
/* 125 */       file.close();
/* 126 */     } catch (Exception e) { e.printStackTrace();
/*     */     }
/* 128 */     return new File(path);
/*     */   }
/*     */   
/*     */   public File arrayToXSLNewline(ArrayList<ArrayList<String>> data, String sheetName) {
/* 132 */     String path = "/tmp/" + this.fileName;
/*     */     try {
/* 134 */       FileOutputStream file = new FileOutputStream(path);
/* 135 */       HSSFWorkbook workbook = new HSSFWorkbook();
/* 136 */       HSSFSheet sheet = null;
/* 137 */       if (sheetName != null) {
/* 138 */         sheet = workbook.createSheet(sheetName);
/*     */       } else {
/* 140 */         sheet = workbook.createSheet();
/*     */       }
/* 142 */       int i = 0;
/* 143 */       Iterator localIterator2; for (Iterator localIterator1 = data.iterator(); localIterator1.hasNext(); 
/*     */           
/*     */ 
/* 146 */           localIterator2.hasNext())
/*     */       {
/* 143 */         List r = (List)localIterator1.next();
/* 144 */         HSSFRow row = sheet.createRow(i++);
/* 145 */         int j = 0;
/* 146 */         localIterator2 = r.iterator(); continue;Object column = localIterator2.next();
/* 147 */         HSSFCell cell = row.createCell(j++);
/* 148 */         if (column == null) {
/* 149 */           cell.setCellValue("");
/*     */         } else {
/* 151 */           if (i == 2) {
/* 152 */             HSSFCellStyle cellStyle = workbook.createCellStyle();
/* 153 */             cellStyle.setWrapText(true);
/* 154 */             cellStyle.setVerticalAlignment((short)1);
/* 155 */             cell.setCellStyle(cellStyle);
/*     */           }
/* 157 */           cell.setCellValue(column.toString());
/*     */         }
/*     */       }
/*     */       
/* 161 */       workbook.write(file);
/* 162 */       file.close();
/* 163 */     } catch (Exception e) { e.printStackTrace();
/*     */     }
/* 165 */     return new File(path);
/*     */   }
/*     */   
/*     */   private ArrayList<ArrayList<String>> _parseXSL(InputStream is, boolean keepDigital) throws Exception {
/* 169 */     ArrayList<ArrayList<String>> result = new ArrayList();
/* 170 */     Workbook workbook = new HSSFWorkbook(is);
/* 171 */     HSSFSheet aSheet = (HSSFSheet)workbook.getSheetAt(0);
/* 172 */     for (int rowNumOfSheet = 0; rowNumOfSheet <= aSheet.getLastRowNum(); rowNumOfSheet++) {
/* 173 */       HSSFRow aRow = aSheet.getRow(rowNumOfSheet);
/* 174 */       ArrayList<String> row = new ArrayList();
/* 175 */       if (aRow != null) {
/* 176 */         for (int cellNumOfRow = 0; cellNumOfRow < aRow.getLastCellNum(); cellNumOfRow++) {
/* 177 */           HSSFCell aCell = aRow.getCell(cellNumOfRow);
/* 178 */           String value = null;
/* 179 */           if (aCell != null) {
/* 180 */             switch (aCell.getCellType()) {
/*     */             case 0: 
/* 182 */               if (keepDigital) {
/* 183 */                 aCell.setCellType(1);
/* 184 */                 value = aCell.getStringCellValue();
/*     */               } else {
/* 186 */                 value = new DecimalFormat("#.##").format(aCell.getNumericCellValue()).toString();
/*     */               }
/* 188 */               break;
/*     */             case 1: 
/* 190 */               value = aCell.getStringCellValue();
/* 191 */               if (value == null) {
/* 192 */                 value = "";
/*     */               }
/* 194 */               break;
/*     */             case 4: 
/* 196 */               value = new Boolean(aCell.getBooleanCellValue()).toString();
/*     */             }
/*     */             
/*     */           }
/* 200 */           if (value == null) {
/* 201 */             value = "";
/*     */           }
/* 203 */           row.add(value);
/*     */         }
/*     */       }
/*     */       
/* 207 */       result.add(row);
/*     */     }
/* 209 */     workbook.cloneSheet(0);
/*     */     
/* 211 */     return result;
/*     */   }
/*     */   
/*     */   private ArrayList<ArrayList<String>> _parseXSLX(InputStream is) throws Exception {
/* 215 */     ArrayList<ArrayList<String>> result = new ArrayList();
/* 216 */     Workbook workbook = new XSSFWorkbook(is);
/* 217 */     XSSFSheet aSheet = (XSSFSheet)workbook.getSheetAt(0);
/* 218 */     for (int rowNumOfSheet = 0; rowNumOfSheet <= aSheet.getLastRowNum(); rowNumOfSheet++) {
/* 219 */       XSSFRow aRow = aSheet.getRow(rowNumOfSheet);
/* 220 */       ArrayList<String> row = new ArrayList();
/*     */       
/* 222 */       if (aRow != null) {
/* 223 */         for (int cellNumOfRow = 0; cellNumOfRow < aRow.getLastCellNum(); cellNumOfRow++) {
/* 224 */           XSSFCell aCell = aRow.getCell(cellNumOfRow);
/* 225 */           String value = null;
/* 226 */           if (aCell != null) {
/* 227 */             switch (aCell.getCellType()) {
/*     */             case 0: 
/* 229 */               value = new Double(aCell.getNumericCellValue()).toString();
/* 230 */               break;
/*     */             case 1: 
/* 232 */               value = aCell.getStringCellValue();
/* 233 */               if (value == null) {
/* 234 */                 value = "";
/*     */               }
/* 236 */               break;
/*     */             case 4: 
/* 238 */               value = new Boolean(aCell.getBooleanCellValue()).toString();
/*     */             }
/*     */             
/*     */           }
/* 242 */           if (value == null) {
/* 243 */             value = "";
/*     */           }
/* 245 */           row.add(value);
/*     */         }
/*     */       }
/*     */       
/* 249 */       result.add(row);
/*     */     }
/* 251 */     workbook.cloneSheet(0);
/*     */     
/* 253 */     return result;
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   public File arrayToXSLFormat(ArrayList<ArrayList<String>> data)
/*     */   {
/* 262 */     return arrayToXSLFormat(data, null);
/*     */   }
/*     */   
/*     */   public File arrayToXSLFormat(ArrayList<ArrayList<String>> data, String sheetName) {
/* 266 */     String path = "/tmp/" + this.fileName;
/*     */     try {
/* 268 */       FileOutputStream file = new FileOutputStream(path);
/* 269 */       HSSFWorkbook workbook = new HSSFWorkbook();
/* 270 */       HSSFSheet sheet = null;
/* 271 */       if (sheetName != null) {
/* 272 */         sheet = workbook.createSheet(sheetName);
/*     */       } else {
/* 274 */         sheet = workbook.createSheet();
/*     */       }
/* 276 */       int i = 0;
/* 277 */       Iterator localIterator2; for (Iterator localIterator1 = data.iterator(); localIterator1.hasNext(); 
/*     */           
/*     */ 
/* 280 */           localIterator2.hasNext())
/*     */       {
/* 277 */         List r = (List)localIterator1.next();
/* 278 */         HSSFRow row = sheet.createRow(i++);
/* 279 */         int j = 0;
/* 280 */         localIterator2 = r.iterator(); continue;Object column = localIterator2.next();
/* 281 */         HSSFCell cell = row.createCell(j++);
/* 282 */         if (column == null) {
/* 283 */           cell.setCellValue("");
/*     */         } else {
/* 285 */           Pattern pattern = Pattern.compile("^\\d+(\\.\\d+)?$");
/* 286 */           Matcher matcher = pattern.matcher((CharSequence)column);
/* 287 */           if (matcher.matches()) {
					  Double valueDouble = new BigDecimal(column.toString()).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
/* 288 */             cell.setCellValue(valueDouble);
/*     */           } else {
/* 290 */             cell.setCellValue(column.toString());
/*     */           }
/*     */         }
/*     */       }
/*     */       
/* 295 */       workbook.write(file);
/* 296 */       file.close();
/* 297 */     } catch (Exception e) { e.printStackTrace();
/*     */     }
/* 299 */     return new File(path);
/*     */   }
/*     */ }

