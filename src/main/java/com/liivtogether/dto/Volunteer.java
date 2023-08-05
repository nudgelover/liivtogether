package com.liivtogether.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Volunteer {
    private String cust_id;
    private String cust_name;
    private String cust_pwd;
    private String phone;
    private int age;
    private String gender;
    private String email;
    private Date cust_rdate;
    private Date cust_del_date;

}
