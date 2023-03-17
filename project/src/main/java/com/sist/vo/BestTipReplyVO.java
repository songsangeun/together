package com.sist.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BestTipReplyVO {

    private int brno;

    private int bno;

    private int mno;

    private String writer;

    private String content;

    @JsonFormat(pattern = "yyyy-MM-DD", timezone = "Asia/Seoul")
    private Date regDate;

}
