package com.team.app.utils;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.team.app.dao.RoleDao;
import com.team.app.dao.UserInfoDao;
import com.team.app.domain.Role;
import com.team.app.domain.TblUserInfo;
import com.team.app.domain.UserDeviceMapping;

@Component
public class UploadExcel {

	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	UserInfoDao usrdao;

	public HttpEntity<byte[]> excelDownloadTemplateForUserUpload(String appId, String appName) throws IOException {
		XSSFWorkbook workBook = new XSSFWorkbook();
		XSSFSheet sheet = workBook.createSheet();

		sheet.setDefaultColumnWidth(18);
		XSSFRow row = sheet.createRow(0);
		colorCellToGrey(row.createCell(0)).setCellValue("user name(unique)");
		colorCellToGrey(row.createCell(1)).setCellValue("email");
		colorCellToGrey(row.createCell(2)).setCellValue("phone");
		colorCellToGrey(row.createCell(3)).setCellValue("flat");
		ByteArrayOutputStream bytes = new ByteArrayOutputStream();
		workBook.write(bytes);

		byte[] excelContent = bytes.toByteArray();
		HttpHeaders header = new HttpHeaders();
		header.setContentType(new MediaType("application", "vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
		header.set(HttpHeaders.CONTENT_DISPOSITION,
				"attachment; filename=" + appId + "_" + appName + "_" + (new Date().toString()) + ".xlsx");
		header.setContentLength(excelContent.length);

		return new HttpEntity<byte[]>(excelContent, header);

	}

	public HttpEntity<byte[]> excelDownloadTemplateForUserDeviceUpload(String appId, String appName, String orgId,
			String orgName, JSONArray deviceList, List<UserDeviceMapping> mappedUserDevices) throws IOException {

		XSSFWorkbook workBook = new XSSFWorkbook();
		XSSFSheet sheet = workBook.createSheet();
		sheet.protectSheet("unizen");
		sheet.setDefaultColumnWidth(18);
		createHeaderForTemplate(sheet);
		List<String> mappedDevices = new ArrayList<String>();
		int rowcursor = 0;
		for (int i = 0; i < mappedUserDevices.size(); i++) {
			UserDeviceMapping udm = mappedUserDevices.get(i);
			XSSFRow row = sheet.createRow((rowcursor++) + 1);
			colorCellToOrange(row.createCell(0)).setCellValue(orgId);
			colorCellToOrange(row.createCell(1)).setCellValue(orgName);
			colorCellToOrange(row.createCell(2)).setCellValue(appId);
			colorCellToOrange(row.createCell(3)).setCellValue(appName);
			colorCellToOrange(row.createCell(4)).setCellValue("");
			colorCellToOrange(row.createCell(5)).setCellValue("");
			mappedDevices.add(udm.getDevEUI());
			colorCellToOrange(row.createCell(6)).setCellValue(udm.getDevEUI());
			colorCellToOrange(row.createCell(7)).setCellValue(udm.getDevNode());
			colorCellToYellow(row.createCell(8)).setCellValue(udm.getTblUserInfo().getUname());
			colorCellToYellow(row.createCell(9)).setCellValue(udm.getTblUserInfo().getContactnumber());
			colorCellToYellow(row.createCell(10)).setCellValue(udm.getTblUserInfo().getEmailId());
			colorCellToYellow(row.createCell(11)).setCellValue("");

		}

		for (int i = 0; i < deviceList.size(); i++) {

			JSONObject jsonObj = (JSONObject) deviceList.get(i);
			if (mappedDevices.contains(jsonObj.get("devEUI").toString())) {
				continue;
			}
			XSSFRow row = sheet.createRow((rowcursor++) + 1);
			colorCellToOrange(row.createCell(0)).setCellValue(orgId);
			colorCellToOrange(row.createCell(1)).setCellValue(orgName);
			colorCellToOrange(row.createCell(2)).setCellValue(appId);
			colorCellToOrange(row.createCell(3)).setCellValue(appName);
			colorCellToOrange(row.createCell(4)).setCellValue("");
			colorCellToOrange(row.createCell(5)).setCellValue("");
			colorCellToOrange(row.createCell(6)).setCellValue(jsonObj.get("devEUI").toString());
			colorCellToOrange(row.createCell(7)).setCellValue(jsonObj.get("name").toString());
			colorCellToGreenAndUnlock(row.createCell(8)).setCellValue("");
			colorCellToGreenAndUnlock(row.createCell(9)).setCellValue("");
			colorCellToGreenAndUnlock(row.createCell(10)).setCellValue("");
			colorCellToGreenAndUnlock(row.createCell(11)).setCellValue("");

		}

		ByteArrayOutputStream bytes = new ByteArrayOutputStream();
		workBook.write(bytes);

		byte[] excelContent = bytes.toByteArray();
		// prepare response
		HttpHeaders header = new HttpHeaders();
		header.setContentType(new MediaType("application", "vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
		header.set(HttpHeaders.CONTENT_DISPOSITION,
				"attachment; filename=" + orgName + "_" + appName + (new Date().toString()) + ".xlsx");
		header.setContentLength(excelContent.length);

		return new HttpEntity<byte[]>(excelContent, header);

	}

	public void createHeaderForTemplate(XSSFSheet sheet) {
		XSSFRow row = sheet.createRow(0);
		colorCellToGrey(row.createCell(0)).setCellValue("organisation Id");
		colorCellToGrey(row.createCell(1)).setCellValue("organisation Name");
		colorCellToGrey(row.createCell(2)).setCellValue("Application Id");
		colorCellToGrey(row.createCell(3)).setCellValue("Application Name");
		colorCellToGrey(row.createCell(4)).setCellValue("Residential Type Id");
		colorCellToGrey(row.createCell(5)).setCellValue("Residential Type");
		colorCellToGrey(row.createCell(6)).setCellValue("Device EUI");
		colorCellToGrey(row.createCell(7)).setCellValue("Device Name");
		colorCellToGrey(row.createCell(8)).setCellValue("User Name");
		colorCellToGrey(row.createCell(9)).setCellValue("Phone Details");
		colorCellToGrey(row.createCell(10)).setCellValue("Email Id");
		colorCellToGrey(row.createCell(11)).setCellValue("Address");
		colorCellToGrey(row.createCell(12)).setCellValue("Geotag location");

	}

	public XSSFCell colorCellToOrange(XSSFCell cell) {
		CellStyle cs = cell.getRow().getSheet().getWorkbook().createCellStyle();
		cs.setFillForegroundColor(IndexedColors.ORANGE.getIndex());
		cs.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		cell.setCellStyle(cs);
		return cell;
	}

	public XSSFCell colorCellToYellow(XSSFCell cell) {
		CellStyle cs = cell.getRow().getSheet().getWorkbook().createCellStyle();
		cs.setFillForegroundColor(IndexedColors.YELLOW.getIndex());
		cs.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		cell.setCellStyle(cs);
		return cell;
	}

	public XSSFCell colorCellToGreenAndUnlock(XSSFCell cell) {

		CellStyle cs = cell.getRow().getSheet().getWorkbook().createCellStyle();
		cs.setLocked(false);
		cs.setFillForegroundColor(IndexedColors.LIGHT_GREEN.getIndex());
		cs.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		cell.setCellStyle(cs);
		return cell;
	}

	public XSSFCell colorCellToGrey(XSSFCell cell) {
		CellStyle cs = cell.getRow().getSheet().getWorkbook().createCellStyle();
		cs.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		cs.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		cell.setCellStyle(cs);
		return cell;
	}

	public List<UserDeviceMapping> excelUpload(MultipartFile excelFile) {

		List<UserDeviceMapping> udmList = new ArrayList<UserDeviceMapping>();
		try {

			XSSFWorkbook workBook = new XSSFWorkbook(excelFile.getInputStream());
			Iterator<Row> itr = workBook.getSheetAt(0).iterator();

			int rowIndex = 0;

			while (itr.hasNext()) {

				if (rowIndex++ == 0) {

					try {

						Row headerrow = itr.next();

						if (!headerrow.getCell(11).getStringCellValue().equals("Address")
								|| !headerrow.getCell(10).getStringCellValue().equals("Email Id")
								|| !headerrow.getCell(9).getStringCellValue().equals("Phone Details")
								|| !headerrow.getCell(8).getStringCellValue().equals("User Name")
								|| !headerrow.getCell(7).getStringCellValue().equals("Device Name")
								|| !headerrow.getCell(6).getStringCellValue().equals("Device EUI")
								|| !headerrow.getCell(5).getStringCellValue().equals("Residential Type")
								|| !headerrow.getCell(4).getStringCellValue().equals("Residential Type Id")
								|| !headerrow.getCell(3).getStringCellValue().equals("Application Name")
								|| !headerrow.getCell(2).getStringCellValue().equals("Application Id")
								|| !headerrow.getCell(0).getStringCellValue().equals("organisation Id")
								|| !headerrow.getCell(1).getStringCellValue().equals("organisation Name")) {

							return udmList;

						}
					} catch (Exception e) {
						return udmList;

					}

					continue;
				}

				Row row = itr.next();

				TblUserInfo user = new TblUserInfo();

				user.setUname(getCellStringVal(row, 8));

				user.setEmailId(getCellStringVal(row, 10));
				user.setContactnumber("" + getCellStringVal(row, 9));
				user.setPassword(getCellStringVal(row, 9));
				Role role = roleDao.getRoleByRoleId("" + 5);
				user.setRoleBean(role);
				user.setCreateddt(new Date());
				user.setUpdateddt(new Date());
				user.setPwdChangeDt(new Date());
				user.setStatus("Y");
				UserDeviceMapping udm = new UserDeviceMapping();
				udm.setAppId(getCellStringVal(row, 2));
				udm.setOrgId(getCellStringVal(row, 0));
				udm.setOrgName(getCellStringVal(row, 1));
				udm.setAppName(getCellStringVal(row, 3));
				udm.setDevNode(getCellStringVal(row, 7));
				udm.setDevEUI(getCellStringVal(row, 6));
				udm.setTblUserInfo(user);
				udm.setCreateddt(new Date());
				udm.setUpdateddt(new Date());

				udmList.add(udm);

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return udmList;
		// return null;
	}

	public List<TblUserInfo> parseExcel(MultipartFile excelFile) {

		String filename = excelFile.getOriginalFilename();

		List<TblUserInfo> userList = new ArrayList<TblUserInfo>();
		int appId = 0;
		BigDecimal b1= new BigDecimal(0);
	//	DecimalFormat decimalFormat = new DecimalFormat(".");
		try {

			appId = Integer.parseInt(filename.split("_")[0]);
		} catch (Exception e) {
			return userList;

		}
		try {

			XSSFWorkbook workBook = new XSSFWorkbook(excelFile.getInputStream());
			Iterator<Row> itr = workBook.getSheetAt(0).iterator();

			int rowIndex = 0;

			while (itr.hasNext()) {

				if (rowIndex++ == 0) {

					try {

						Row headerrow = itr.next();

						if (!headerrow.getCell(0).getStringCellValue().equals("user name(unique)")
								|| !headerrow.getCell(1).getStringCellValue().equals("email")
								|| !headerrow.getCell(2).getStringCellValue().equals("phone")
								|| !headerrow.getCell(3).getStringCellValue().equals("flat")) {

							System.err.println("errerrereerrerer");
							return userList;

						}
					} catch (Exception e) {
						System.err.println("trrtee");
						return userList;

					}

					continue;
				}

				Row row = itr.next();

				TblUserInfo user = new TblUserInfo();
				
				
                user.setUname(getCellStringVal(row, 0));			    
				user.setAppId(appId);
				user.setEmailId(getCellStringVal(row, 1));
				// user.setContactnumber("" + getCellStringVal(row, 2));
				
			  if((getCellStringVal(row, 2)==null)){
				b1=null;
			  }else {
						b1 = new BigDecimal(getCellStringVal(row, 2));

						user.setContactnumber(String.valueOf(b1));
						/*user.setFlat(getCellStringVal(row, 3));
						user.setPassword(getCellStringVal(row, 0) + getCellStringVal(row, 3));*/
						user.setFlat(String.valueOf(getCellStringVal(row, 3)).replace(".0", ""));
						user.setPassword(getCellStringVal(row, 0) + getCellStringVal(row, 3).replace(".0", ""));
						
						Role role = roleDao.getRoleByRoleId("" + 5);
						user.setRoleBean(role);
						user.setCreateddt(new Date());
						user.setUpdateddt(new Date());
						//user.setPwdChangeDt(new Date());
						user.setStatus("Y");
				}
				userList.add(user);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			return userList;
		}

		return userList;
	}

	public String getCellStringVal(Row row, int index) {
		String returnString = null;
		
		if(row.getCell(index)==null || row.getCell(index).getCellType()==Cell.CELL_TYPE_BLANK) {
			returnString=null;
		}
		else if (row.getCell(index).getCellType() == 0) {
			
		//	returnString = ""+row.getCell(index).getNumericCellValue();
		  returnString = String.valueOf(row.getCell(index).getNumericCellValue());
		}
		
		else if (row.getCell(index).getCellType() == 1) {
			returnString =  row.getCell(index).getStringCellValue();	
		
		} 
		
         
		return returnString;
	}

	public long getNumberVal(Row row, int index) {
		return (long) row.getCell(index).getNumericCellValue();
	}

}
