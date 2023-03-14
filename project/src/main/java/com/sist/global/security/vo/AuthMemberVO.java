package com.sist.global.security.vo;

import lombok.Getter;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

@Getter
public class AuthMemberVO extends User {

    private final int mno;

    private final String nickname;

    public AuthMemberVO(int mno, String nickname, String username, String password, String role) {
        super(username, password, AuthorityUtils.createAuthorityList(role));
        this.mno = mno;
        this.nickname = nickname;
    }

}
