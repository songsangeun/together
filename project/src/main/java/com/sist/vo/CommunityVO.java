package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class CommunityVO {

    private int cno;
    
    private int hit;
    
    private List<MultipartFile> files;
    
    private String name;

    private String title;

    private String content;
    
    private String pwd;
    
    private String fileimage;
    
    private String filesize;
    
    private String filename;

    private String type;
    
    private String dbday;

    private Date createdAt;

    
    private int mno;

}
