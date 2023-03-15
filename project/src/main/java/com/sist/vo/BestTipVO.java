package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BestTipVO {

    private int bno;

    private String title;

    private String content;

    private String tag;

    private int hit;

    private Date created_at;
    
    private String createdAt;

}
