package com.sist.vo;

/*
 *  NNO        NOT NULL NUMBER         
	TITLE      NOT NULL VARCHAR2(300)  
	CONTENT    NOT NULL VARCHAR2(4000) 
	CREATED_AT          DATE           
	HIT                 NUMBER  
 */

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class NoticeVO {
 
    private int nno;
    
    private int hit;

    private String title;

    private String content;
    
    private String dbday;

    private Date createdAt;
}
