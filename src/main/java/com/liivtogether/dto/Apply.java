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
public class Apply {
    private int applyId;
    private String topicBig;
    private String contentsId;
    private String custId;
    private String rdate;
    private String memo;
    // contents 테이블과 조인
    private String title;
    private String location;
    private String ddate;
    private String imageMain;
    private String content;
    private String rewordCoin;
    private String agree;
}
