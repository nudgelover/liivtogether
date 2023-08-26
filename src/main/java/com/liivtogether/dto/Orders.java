package com.liivtogether.dto;

import lombok.*;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Orders {
    private String orderId;
    private String custId;
    private String itemId;
    private int amount;
    private Date orderDate;
    private String status;
    private String rcv_Name;
    private String addr;
    private String phoneNo;
    private String req;   
}