package com.sist.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class CustomerReplyVO {

    private int hrno;

    private int nno;

    private String msg;

    private String state;

    private Date regdate;

    private Date moddate;


}
