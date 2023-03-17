package com.sist.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BestTipVO {

    private int brno;

    private int bno;

    private String title;

    private String content;

    private String tag;

    private int hit;

    @JsonFormat(pattern = "YYYY-MM-dd")
    private Date regDate;

}
