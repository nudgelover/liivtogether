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
    private String itemId;
    private String custId;
    private String img;
    private int priceCoin;
    private int cnt;
    private String rdate;
    private String isVaild;
    
}