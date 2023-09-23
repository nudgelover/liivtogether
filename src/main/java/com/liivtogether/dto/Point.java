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
public class Point {
	
    private int historyId;
    private String pointcoin;
    private String gplace;
    private String uplace;
    private String rdate;
    private String custId;
    private String mount;
}