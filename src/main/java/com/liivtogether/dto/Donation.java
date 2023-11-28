package com.liivtogether.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Donation {
	private int donaId;
	private String topicBig;
	private String topicSmall;
	private String title;
	private String location;
	private String edate;
	private String ddate;
	private int target;
	private int targetIn;
	private String imageMain;
	private String imageSub;
	private String comment;
	private String content;
	private int rewardCoin;
	private int view;
	private String rdate;
	private int dDay;
	private String currentDate;
    private int mount;   
    private int likesCount;

	
	public int getdDay() {
		return dDay;
	}
	public void setdDay(int dDay) {
		this.dDay = dDay;
	}
	public void setTargetIn(int targetIn) {
	    this.targetIn = targetIn;
	}
}
