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
    private String dona_id;
    private String topic_big;
    private String topic_small;
    private String title;
    private String location;    
    private String edate;
    private String ddate;
    private int target;
    private int target_in;
    private String image_main;
    private String image_sub;
    private String comment;
    private String content;
    private int reward_coin;
    private int view;
    private String rdate;
    
    
	public Donation(String topic_big, String topic_small, String title, String location, String edate, String ddate,
			int target, String image_main, String image_sub, String comment, String content, int reward_coin,
			String rdate) {
		super();
		this.topic_big = topic_big;
		this.topic_small = topic_small;
		this.title = title;
		this.location = location;
		this.edate = edate;
		this.ddate = ddate;
		this.target = target;
		this.image_main = image_main;
		this.image_sub = image_sub;
		this.comment = comment;
		this.content = content;
		this.reward_coin = reward_coin;
		this.rdate = rdate;
	}
     
}
