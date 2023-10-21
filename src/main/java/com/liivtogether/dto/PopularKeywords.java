package com.liivtogether.dto;


import lombok.*;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class PopularKeywords {
	
	private String keyword;
	private int searchCount;

}
