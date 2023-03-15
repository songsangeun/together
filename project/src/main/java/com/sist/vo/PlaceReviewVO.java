package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class PlaceReviewVO {

    private int prno;

    private int pno;

    private String writer;

    private String content;

    private Date regDate;

    private int mno;

}
