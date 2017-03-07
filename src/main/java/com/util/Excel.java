package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.collections.CollectionUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Excel {
	private final String fileName;
	private final String basePath = "/tmp/";
//	private final String basePath = "E:\\tmp\\";

	public Excel(String fileName) {
		this.fileName = fileName;
	}

	public ArrayList<ArrayList<String>> toArray() {
		ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
		try {
			InputStream is = new FileInputStream(this.fileName);
			Filename fn = new Filename(this.fileName);
			if ("xls".equals(fn.extension())) {
				result = _parseXSL(is, false);
			} else if ("xlsx".equals(fn.extension())) {
				result = _parseXSLX(is);
			}
			is.close();
		} catch (Exception e) {
			String message = "The supplied spreadsheet seems to be Excel 5.0/7.0 (BIFF5) format. POI only supports BIFF8 format (from Excel versions 97/2000/XP/2003)";
			if (message.equals(e.getMessage())) {
				result = null;
			}
			e.printStackTrace();
		}

		return result;
	}

	public ArrayList<ArrayList<String>> toArray(boolean keepDigital) {
		ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
		try {
			InputStream is = new FileInputStream(this.fileName);
			Filename fn = new Filename(this.fileName);
			if ("xls".equals(fn.extension())) {
				result = _parseXSL(is, keepDigital);
			} else if ("xlsx".equals(fn.extension())) {
				result = _parseXSLX(is);
			}
			is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public File arrayToXSL(ArrayList<ArrayList<String>> data) {
		return arrayToXSL(data, null);
	}

	public File arrayToXSL(ArrayList<ArrayList<String>> data, String sheetName) {
		String path = basePath + this.fileName;
		try {
			FileOutputStream file = new FileOutputStream(path);
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = null;
			if (sheetName != null) {
				sheet = workbook.createSheet(sheetName);
			} else {
				sheet = workbook.createSheet();
			}
			for (int i = 0; i < data.size(); i++) {
				HSSFRow row = sheet.createRow(i);
				List<String> r = data.get(i);
				if (CollectionUtils.isEmpty(r)) {
					continue;
				}
				for (int j = 0; j < r.size(); j++) {
					HSSFCell cell = row.createCell(j);
					Object column = r.get(j);
					if (column == null) {
						cell.setCellValue("");
					} else {
						cell.setCellValue(column.toString());
					}
				}
			}
			workbook.write(file);
			file.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new File(path);
	}

	public File arrayToXSLNewline(ArrayList<ArrayList<String>> data,
			String sheetName) {
		String path = basePath + this.fileName;
		try {
			FileOutputStream file = new FileOutputStream(path);
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = null;
			if (sheetName != null) {
				sheet = workbook.createSheet(sheetName);
			} else {
				sheet = workbook.createSheet();
			}
			for (int i = 0; i < data.size(); i++) {
				HSSFRow row = sheet.createRow(i);
				List<String> r = data.get(i);
				if (CollectionUtils.isEmpty(r)) {
					continue;
				}
				for (int j = 0; j < r.size(); j++) {
					HSSFCell cell = row.createCell(j);
					Object column = r.get(j);
					if (column == null) {
						cell.setCellValue("");
					} else {
						cell.setCellValue(column.toString());
					}
				}
			}
			workbook.write(file);
			file.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new File(path);
	}

	private ArrayList<ArrayList<String>> _parseXSL(InputStream is,
			boolean keepDigital) throws Exception {
		ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
		Workbook workbook = new HSSFWorkbook(is);
		HSSFSheet aSheet = (HSSFSheet) workbook.getSheetAt(0);
		for (int rowNumOfSheet = 0; rowNumOfSheet <= aSheet.getLastRowNum(); rowNumOfSheet++) {
			HSSFRow aRow = aSheet.getRow(rowNumOfSheet);
			ArrayList<String> row = new ArrayList<String>();
			if (aRow != null) {
				for (int cellNumOfRow = 0; cellNumOfRow < aRow.getLastCellNum(); cellNumOfRow++) {
					HSSFCell aCell = aRow.getCell(cellNumOfRow);
					String value = null;
					if (aCell != null) {
						switch (aCell.getCellType()) {
						case 0:
							if (keepDigital) {
								aCell.setCellType(1);
								value = aCell.getStringCellValue();
							} else {
								value = new DecimalFormat("#.##").format(aCell.getNumericCellValue()).toString();
							}
							break;
						case 1:
							value = aCell.getStringCellValue();
							if (value == null) {
								value = "";
							}
							break;
						case 4:
							value = new Boolean(aCell.getBooleanCellValue()).toString();
						}

					}
					if (value == null) {
						value = "";
					}
					row.add(value);
				}
			}

			result.add(row);
		}
		workbook.cloneSheet(0);

		return result;
	}

	private ArrayList<ArrayList<String>> _parseXSLX(InputStream is)
			throws Exception {
		ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
		Workbook workbook = new XSSFWorkbook(is);
		XSSFSheet aSheet = (XSSFSheet) workbook.getSheetAt(0);
		for (int rowNumOfSheet = 0; rowNumOfSheet <= aSheet.getLastRowNum(); rowNumOfSheet++) {
			XSSFRow aRow = aSheet.getRow(rowNumOfSheet);
			ArrayList<String> row = new ArrayList<String>();

			if (aRow != null) {
				for (int cellNumOfRow = 0; cellNumOfRow < aRow.getLastCellNum(); cellNumOfRow++) {
					XSSFCell aCell = aRow.getCell(cellNumOfRow);
					String value = null;
					if (aCell != null) {
						switch (aCell.getCellType()) {
						case 0:
							value = new Double(aCell.getNumericCellValue()).toString();
							break;
						case 1:
							value = aCell.getStringCellValue();
							if (value == null) {
								value = "";
							}
							break;
						case 4:
							value = new Boolean(aCell.getBooleanCellValue()).toString();
						}

					}
					if (value == null) {
						value = "";
					}
					row.add(value);
				}
			}

			result.add(row);
		}
		workbook.cloneSheet(0);

		return result;
	}

	public File arrayToXSLFormat(ArrayList<ArrayList<String>> data) {
		return arrayToXSLFormat(data, null);
	}

	public File arrayToXSLFormat(ArrayList<ArrayList<String>> data,
			String sheetName) {
		String path = basePath + this.fileName;
		try {
			FileOutputStream file = new FileOutputStream(path);
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = null;
			if (sheetName != null) {
				sheet = workbook.createSheet(sheetName);
			} else {
				sheet = workbook.createSheet();
			}
			for (int i = 0; i < data.size(); i++) {
				HSSFRow row = sheet.createRow(i);
				List<String> r = data.get(i);
				if (CollectionUtils.isEmpty(r)) {
					continue;
				}
				for (int j = 0; j < r.size(); j++) {
					HSSFCell cell = row.createCell(j);
					Object column = r.get(j);
					if (column == null) {
						cell.setCellValue("");
					} else {
						Pattern pattern = Pattern.compile("^\\d+(\\.\\d+)?$");
						Matcher matcher = pattern.matcher((CharSequence) column);
						if (matcher.matches()) {
							Double valueDouble = new BigDecimal(column.toString()).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
							cell.setCellValue(valueDouble);
						} else {
							cell.setCellValue(column.toString());
						}
					}
				}
			}
			workbook.write(file);
			file.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new File(path);
	}
}
