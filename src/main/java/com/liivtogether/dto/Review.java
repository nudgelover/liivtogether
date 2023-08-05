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
	private String reviewId;
	private String contentsId;
	private String custId;
    private String reviewContents;
    private int reviewScore;    
    private String rdate;
}
