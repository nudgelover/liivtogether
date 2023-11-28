package com.liivtogether.controller;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfWriter;
import com.liivtogether.dto.Apply;
import com.liivtogether.dto.Cust;
import com.liivtogether.service.ApplyService;
import com.liivtogether.service.CustService;
import com.liivtogether.service.DonationService;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Slf4j
@Controller
public class PdfController {
	@Autowired
	CustService custService;
	
	@Autowired
	ApplyService applyService;
	
	@Autowired
	DonationService donationService;
	
    @GetMapping("/generatePdf")
    public void generatePdf(HttpServletResponse response, HttpSession session, Integer applyId) throws Exception {
        try {
            log.info(applyId.toString());

            Cust cust = (Cust) session.getAttribute("logincust");
            session.setAttribute("logincust", cust);      
            String custNm = cust.getCustName();
            
             Apply apply = applyService.get(applyId);      
           
             Integer contentsId = apply.getContentsId();
             
             String title = donationService.get(contentsId).getTitle();
             
             Integer DonationAmount= apply.getDonationAmount();
        	
        	 LocalDate today = LocalDate.now();
             DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
             String formatToday = today.format(formatter);
        	
            // PDF document creation
            Document document = new Document();
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            PdfWriter writer = PdfWriter.getInstance(document, byteArrayOutputStream);
            
            Image backImg = Image.getInstance("classpath:/static/assets/img/logo/certificateBack.png");
         
            
            document.open();

            backImg.setAbsolutePosition(0, 0);
            backImg.scaleAbsoluteWidth(570f);
            backImg.scaleAbsoluteHeight(800f);
            document.add(backImg);
            
            // PdfContentByte
            PdfContentByte cb = writer.getDirectContent();

            // 폰트 파일 경로
            String fontPath = "/font/JalnanGothicTTF.ttf";

            // 나눔고딕 폰트를 사용하여 BaseFont 생성
            BaseFont baseFont = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        
            cb.beginText();

            cb.setTextMatrix(80, document.getPageSize().getTop() - 130);
            cb.setFontAndSize(baseFont, 12);
            cb.showText("KB 리브투게더 2023-"+applyId);
	
	         // Set the position for "기부증서" at the top center
	         cb.setFontAndSize(baseFont, 50);
	         float centerX = (document.getPageSize().getWidth() - baseFont.getWidthPoint("기부증서", 50)) / 2;
	         float topY = document.getPageSize().getTop() - 200;
	         cb.setTextMatrix(centerX, topY);
	         cb.showText("기부증서");
	
	         
	         // Set the position for "기부자 : 김진희"
	         cb.setTextMatrix(80, 550); 
	         cb.setFontAndSize(baseFont, 20);
	         cb.showText("기부자 : "+custNm);
	         
	         // Set the position for "기부금액"
	         cb.setTextMatrix(80, 510); 
	         cb.setFontAndSize(baseFont, 20);
	         cb.showText("기부금액 : "+DonationAmount+"만원");
	
	         
	         cb.setTextMatrix(50, 400); 
	         cb.setFontAndSize(baseFont, 25);
	         cb.showText("귀 기부자는 " +title+"에");
	         
	         cb.setTextMatrix(50, 360); 
	         cb.setFontAndSize(baseFont, 25);
	         cb.showText("따뜻한 선행을 베풀어주셨습니다.");
	         
	         cb.setTextMatrix(50, 320); 
	         cb.setFontAndSize(baseFont, 25);
	         cb.showText("이에 존경과 감사의 마음을 담아");
	         
	         cb.setTextMatrix(50, 280); // Adjust the values as needed
	         cb.setFontAndSize(baseFont, 25);
	         cb.showText("이 증서를 드립니다.");
	         
	         // Set the position for the formatted date at the bottom center
	         float centerX2 = (document.getPageSize().getWidth() - baseFont.getWidthPoint(formatToday, 12)) / 2;
	         cb.setTextMatrix(centerX2, 130);
	         cb.setFontAndSize(baseFont, 12);
	         cb.showText(formatToday);
	
	         
	         
	         float centerX3 = (document.getPageSize().getWidth() - baseFont.getWidthPoint("KB국민은행 리브투게더 장", 20)) / 2;
	         cb.setTextMatrix(centerX3, 100);
	         cb.setFontAndSize(baseFont, 20);
	         cb.showText("KB국민은행 리브투게더 장");
	         
	         
	         cb.endText();
	         
	         
            // 도장 이미지 추가
            Image image = Image.getInstance("classpath:/static/assets/img/logo/kb도장.png");
            image.scaleAbsolute(100, 100);

            // 이미지를 하단 오른쪽으로 이동
            float x = document.getPageSize().getWidth() - 100 - image.getScaledWidth();
            float y = 50;

            image.setAbsolutePosition(x, y);
            document.add(image);

           // addBackgroundImage(document, writer, "classpath:/static/assets/img/logo/certificateBack.png");

            // Other graphic elements can be added

            // Document closure
            document.close();

            // Set response headers
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=example.pdf");

            // Write the PDF content to the response output stream
            response.getOutputStream().write(byteArrayOutputStream.toByteArray());
            response.getOutputStream().flush();
        } catch (DocumentException e) {
            log.error("Error generating PDF.", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating PDF.");
        }
    }


}
