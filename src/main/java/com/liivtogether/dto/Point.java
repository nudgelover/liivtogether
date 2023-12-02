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
public class Point implements Cloneable {
	
    private int historyId;
    private String pointcoin;
    private String gplace;
    private String uplace;
    private String rdate;
    private String custId;
    private int mount;
    private int totalEarned;
    private int totalUsed;
    private int difference;
    
    public Object clone() throws CloneNotSupportedException { // CloneNotSupportedException는 checked exception 이라 반드시 예외처리
        return super.clone(); // 기본적으로 부모의 clone을 그대로 불러와 반환
    }
}