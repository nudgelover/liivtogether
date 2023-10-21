package com.liivtogether.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Review {
	private int reviewId;
	private int applyId;
	private String custId;
	private String custImg;
    private String title;
    private String topicBig;
    private String keyword1;
    private String keyword2;
    private String keyword3;
    private String reviewContents;
    private int reviewScore;    
    private String rdate;
    private int cnt;
}
