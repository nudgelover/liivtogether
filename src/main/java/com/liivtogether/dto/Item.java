package com.liivtogether.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Item {
    private String item_id;
    private String cust_id;
    private String item_name;
    private String img;
    private int cost;
    private int price;
    private int cnt;
    private Date rdate;
    private String is_vaild;
    
}