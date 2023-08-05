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
    private String cust_name;
    private String cust_pwd;
    private String phone;
    private int age;
    private String gender;
    private String email;
    private Date cust_rdate;
    private Date cust_del_date;

    public Cust(String cust_id, String cust_name, String cust_pwd, String phone, int age, String gender, String email, Date cust_rdate) {
        this.cust_id = cust_id;
        this.cust_name = cust_name;
        this.cust_pwd = cust_pwd;
        this.phone = phone;
        this.age = age;
        this.gender = gender;
        this.email = email;
        this.cust_rdate = cust_rdate;
    }

    public Cust(String cust_id, String cust_name, String cust_pwd, String phone, int age, String email, Date cust_rdate) {
        this.cust_id = cust_id;
        this.cust_name = cust_name;
        this.cust_pwd = cust_pwd;
        this.phone = phone;
        this.age = age;
        this.email = email;
        this.cust_rdate = cust_rdate;
    }

    public Cust(String cust_id, String cust_name, String cust_pwd, String phone, int age, String gender, String email) {
        this.cust_id = cust_id;
        this.cust_name = cust_name;
        this.cust_pwd = cust_pwd;
        this.phone = phone;
        this.age = age;
        this.gender = gender;
        this.email = email;
    }

    public Cust(String cust_id, Date cust_del_date) {
        this.cust_id = cust_id;
    }
}
