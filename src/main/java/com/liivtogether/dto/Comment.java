package com.liivtogether.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Comment {
	private String comment_id;
	private String review_id;
    private String cust_id;
    private String review_comment;
    private String rdate;
}
