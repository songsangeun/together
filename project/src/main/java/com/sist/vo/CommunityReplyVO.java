package com.sist.vo;

/*CRNO    NOT NULL NUMBER 
CNO              NUMBER 
MSG     NOT NULL CLOB   
REGDATE          DATE */
 

import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class CommunityReplyVO {
	private int crno,cno;
	private String msg;
	private Date regdate;
}
