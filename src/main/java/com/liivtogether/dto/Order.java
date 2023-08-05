package com.liivtogether.dto;

import lombok.*;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Order {
    private String order_id;
    private String cust_id;
    private String item_id;
    private int amount;
    private Date order_date;
    private String status;
    private String cust_name;
    private String addr;
    private String phone_no;
    private String req;   
}