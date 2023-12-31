package com.liivtogether.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Msg {

	private String time;
	private String sendid;
	private String receiveid;
	private String content;

}
