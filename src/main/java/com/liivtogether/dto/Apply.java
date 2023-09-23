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
    private String agree;
}