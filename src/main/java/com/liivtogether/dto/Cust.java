package com.liivtogether.dto;

import lombok.*;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cust {
    private String custId; 		//아이디
    private String custPwd; 	//비밀번호
    private String custName; 	//이름
    private String phoneNo; 	//연락처
    private String birth;		//생년월일 yyMMdd
    private String img;			//이미지 Default default.jpg
    private int pointree; 		//포인트리 Default 0
    private int starcoin; 		//스타코인 Default 0
    private String isMaster; 	//마스터여부 Default 0, master 1

    
}
