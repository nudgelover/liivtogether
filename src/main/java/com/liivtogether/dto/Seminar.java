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
	public int getSemiId() {
		return semiId;
	}
	public void setSemiId(int semiId) {
		this.semiId = semiId;
	}
	public String getTopicBig() {
		return topicBig;
	}
	public void setTopicBig(String topicBig) {
		this.topicBig = topicBig;
	}
	public String getTopicSmall() {
		return topicSmall;
	}
	public void setTopicSmall(String topicSmall) {
		this.topicSmall = topicSmall;
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
	public int getTarget() {
		return target;
	}
	public void setTarget(int target) {
		this.target = target;
	}
	public int getTargetIn() {
		return targetIn;
	}
	public void setTargetIn(int targetIn) {
		this.targetIn = targetIn;
	}
	public String getImageMain() {
		return imageMain;
	}
	public void setImageMain(String imageMain) {
		this.imageMain = imageMain;
	}
	public String getImageSub() {
		return imageSub;
	}
	public void setImageSub(String imageSub) {
		this.imageSub = imageSub;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRewardCoin() {
		return rewardCoin;
	}
	public void setRewardCoin(int rewardCoin) {
		this.rewardCoin = rewardCoin;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getdDay() {
		return dDay;
	}
	public void setdDay(int dDay) {
		this.dDay = dDay;
	}
	public String getCurrentDate() {
		return currentDate;
	}
	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
	}
	public int getLikesCount() {
		return likesCount;
	}
	public void setLikesCount(int likesCount) {
		this.likesCount = likesCount;
	}
	public String getIsLike() {
		return isLike;
	}
	public void setIsLike(String isLike) {
		this.isLike = isLike;
	}
	
	
	


	
	
}
