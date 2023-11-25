package com.liivtogether.dto;


import lombok.*;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Event {
	private int eventId;
	private String custId;
	private String eventName; 
	private int pointsAwarded;
	private String recordDatetime;
	private int year;
	private int month;
	private int day;
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public int getPointsAwarded() {
		return pointsAwarded;
	}
	public void setPointsAwarded(int pointsAwarded) {
		this.pointsAwarded = pointsAwarded;
	}
	public String getRecordDatetime() {
		return recordDatetime;
	}
	public void setRecordDatetime(String recordDatetime) {
		this.recordDatetime = recordDatetime;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	
	
	
}
