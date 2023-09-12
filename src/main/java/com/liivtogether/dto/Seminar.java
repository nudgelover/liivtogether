package com.liivtogether.dto;


import lombok.*;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Seminar {
	private int semiId;
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
	private int likesCount;
	private String isLike;
	
	
	
	
	public int getdDay() {
		return dDay;
	}
	public void setdDay(int dDay) {
		this.dDay = dDay;
	}

	
	
}
