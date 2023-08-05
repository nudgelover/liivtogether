package com.liivtogether.dto;

import lombok.*;

import java.util.Date;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cust {
    private String cust_id;
    private String cust_pwd;
    private String cust_name;
    private String phone_no;
    private String birth;
    private String img;
    private int pointree;
    private int starcoin;
    private String is_master;

}
