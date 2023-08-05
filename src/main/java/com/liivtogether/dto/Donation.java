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
    private String dona_id;
    private String topic_big;
    private String topic_small;
    private String title;
    private String location;
    private String rdate;
    private String edate;
    private String ddate;
    private int target;
    private int target_in;
    private String image_main;
    private String image_sub;
    private String comment;
    private String content;
    private int view;
}
