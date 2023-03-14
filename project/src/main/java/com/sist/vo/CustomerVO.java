package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class CustomerVO {

    private int nno;

    private int hit;
    
    private String subject;

    private String content;
    
    private String name;

    private String pwd;

    private String type;
    
    private String dbday;

    private Date createdAt;

    private int mno;
    
    private String filesize;
    
    private String filename;
    
    private List<MultipartFile> files;

}
