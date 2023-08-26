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
	private String commentId;
	private String reviewId;
    private String custId;
    private String reviewComment;
    private String rdate;
}
