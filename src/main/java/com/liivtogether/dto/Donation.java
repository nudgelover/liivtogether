package com.liivtogether.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Donation {
    private String donaId;
    private String topicBig;
    private String topicSmall;
    private String title;
    private String location;    
    private String edate;
    private String ddate;
    private int target;
    private int targetIn;
    private String imageMain;
    private String imageSub;
    private String comment;
    private String content;
    private int rewardCoin;
    private int view;
    private String rdate;
     
}
