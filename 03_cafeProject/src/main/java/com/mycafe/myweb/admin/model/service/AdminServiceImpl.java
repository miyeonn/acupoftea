package com.mycafe.myweb.admin.model.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycafe.myweb.admin.model.dao.AdminDao;
import com.mycafe.myweb.admin.model.vo.CafeFile;
import com.mycafe.myweb.order.model.vo.OrderList;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	

	@Override
	public int enrollCafeEnd(Map param, List<String> fileMultiName) {
		// TODO Auto-generated method stub
		int result=0;
		int cafeResult=dao.enrollCafeEnd(param, session);
		System.out.println("현재 cafeNo:"+param.get("cafeNo"));
		int cafeNo=Integer.parseInt(String.valueOf(param.get("cafeNo")));
		if(cafeResult>0) {
		CafeFile cf=new CafeFile();
		//카페파일 테이블에 들어갈 객체 설정
		cf.setFile_Path((String) param.get("filePath"));
		cf.setCafe_no(cafeNo);
		
		for(int i=0;i<fileMultiName.size();i++) {
			cf.setFile_Name(fileMultiName.get(i));
			result=dao.enrollCafeFiles(cf,session);
			System.out.println("카페파일:"+result);
			}
		}
		return result;
	}


	@Override
	public List<OrderList> checkStock() {
		// TODO Auto-generated method stub
		return dao.checkStock(session);
	}


	@Override
	public void getExcelDown(HttpServletResponse response) {
		 Map<String, Object> map = new HashMap<String, Object>();
	       // List<?> list = homeMapper.testDbList(map); 
		 	//데이터로 넣을것 가져오기
		 	List<OrderList> list=dao.checkStock(session);
		 
	        try{
	            //Excel Down 시작
	            Workbook workbook = new HSSFWorkbook();
	            //시트생성
	            Sheet sheet = workbook.createSheet("게시판");
	            
	            //행, 열, 열번호
	            Row row = null;
	            Cell cell = null;
	            int rowNo = 0;
	            
	            // 테이블 헤더용 스타일
	            CellStyle headStyle = workbook.createCellStyle();
	    
	            // 가는 경계선을 가집니다.
	         
	            headStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
	            headStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	            headStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	            headStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    
	            // 배경색은 노란색입니다.
	            headStyle.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
	            headStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
	    
	            // 데이터는 가운데 정렬합니다.
	            headStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	    
	            // 데이터용 경계 스타일 테두리만 지정
	            CellStyle bodyStyle = workbook.createCellStyle();
	            bodyStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
	            bodyStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	            bodyStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	            bodyStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    
	            // 헤더 생성
	            row = sheet.createRow(rowNo++);
	    
	            cell = row.createCell(0);
	            cell.setCellStyle(headStyle);
	            cell.setCellValue("번호");
	    
	            cell = row.createCell(1);
	            cell.setCellStyle(headStyle);
	            cell.setCellValue("이름");
	    
	            cell = row.createCell(2);
	            cell.setCellStyle(headStyle);
	            cell.setCellValue("제목");
	    
	            // 데이터 부분 생성
	            for(OrderList ol: list) {

	                
	                row = sheet.createRow(rowNo++);
	                cell = row.createCell(0);
	                cell.setCellStyle(bodyStyle);
	                cell.setCellValue(ol.getOrder_no());
	                cell = row.createCell(1);
	                cell.setCellStyle(bodyStyle);
	                cell.setCellValue(ol.getOrder_date());
	                cell = row.createCell(2);
	                cell.setCellStyle(bodyStyle);
	                cell.setCellValue(ol.getOrder_no());
	            }
	    
	            // 컨텐츠 타입과 파일명 지정
	            response.setContentType("ms-vnd/excel");
	            response.setHeader("Content-Disposition", "attachment;filename=test.xls");
	 
	            // 엑셀 출력
	            workbook.write(response.getOutputStream());
	            response.getOutputStream().close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        

		
	}

}
