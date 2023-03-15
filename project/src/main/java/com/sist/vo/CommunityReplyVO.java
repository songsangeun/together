package com.sist.vo;
/*
 * CRNO       NOT NULL NUMBER         
	CONTENT             VARCHAR2(4000) 
	CREATED_AT          DATE           
	CNO                 NUMBER         
	MNO                 NUMBER         
	WRITER              VARCHAR2(100)  
 */

import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class CommunityReplyVO {
	private int crno,cno,mno;
	private String content,writer,dabay;
	private Date created_at;
}
