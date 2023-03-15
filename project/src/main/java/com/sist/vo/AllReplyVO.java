package com.sist.vo;
/*
 *  RNO     NOT NULL NUMBER       
	CATE_NO NOT NULL NUMBER       
	NO      NOT NULL NUMBER       
	MNO              NUMBER       
	NAME    NOT NULL VARCHAR2(34) 
	MSG     NOT NULL CLOB         
	REGDATE          DATE   
 */

import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class AllReplyVO {
	private int rno,cate_no,no,mno;
	private String name,msg,dbday;
	private Date regdate;
}
