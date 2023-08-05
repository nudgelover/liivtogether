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
	private String review_id;
    private String cust_id;
    private String rdate;
    private String review_contents;
    private int review_score;    
    private String review_reply;
}
