package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class ReviewVO {

    private int pno;

    private int prno;

    private String content;

    private Date createdAt;

    private int mno;

    private String writer;

}
