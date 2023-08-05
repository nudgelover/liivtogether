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
    private String img;
    private int price_coin;
    private int cnt;
    private String rdate;
    private String is_vaild;
    
}