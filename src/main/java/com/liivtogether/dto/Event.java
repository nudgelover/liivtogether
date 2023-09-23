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
	
	
	
}
