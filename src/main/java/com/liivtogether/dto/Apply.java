package com.liivtogether.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Apply {
    private int applyId;
    private String topicBig;
    private int contentsId;
    private String custId;
    private String rdate;
    private String memo;
    // contents 테이블과 조인
    private String title;
    private String location;
    private String edate;
    private String ddate;
    private String imageMain;
    private String content;
    private String rewordCoin;
    private String agree;
	public int getApplyId() {
		return applyId;
	}
	public void setApplyId(int applyId) {
		this.applyId = applyId;
	}
	public String getTopicBig() {
		return topicBig;
	}
	public void setTopicBig(String topicBig) {
		this.topicBig = topicBig;
	}
	public int getContentsId() {
		return contentsId;
	}
	public void setContentsId(int contentsId) {
		this.contentsId = contentsId;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getDdate() {
		return ddate;
	}
	public void setDdate(String ddate) {
		this.ddate = ddate;
	}
	public String getImageMain() {
		return imageMain;
	}
	public void setImageMain(String imageMain) {
		this.imageMain = imageMain;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRewordCoin() {
		return rewordCoin;
	}
	public void setRewordCoin(String rewordCoin) {
		this.rewordCoin = rewordCoin;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
    
}
