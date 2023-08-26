package com.liivtogether.dto;

import lombok.*;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cust {
    private String custId;
    private String custPwd;
    private String custName;
    private String phoneNo;
    private String birth;
    private String img;
    private int pointree;
    private int starcoin;
    private String isMaster;

}
