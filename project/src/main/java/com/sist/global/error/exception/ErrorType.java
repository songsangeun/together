package com.sist.global.error.exception;

import lombok.Getter;

import org.springframework.http.HttpStatus;

@Getter
public enum ErrorType {

    DUPLICATE_NICKNAME("ERRM001", HttpStatus.CONFLICT.value(), "사용 중인 닉네임입니다."),
    DUPLICATE_EMAIL("ERRM002", HttpStatus.CONFLICT.value(), "사용 중인 이메일입니다."),
    WRONG_EMAIL_PASSWORD("ERRM003", HttpStatus.BAD_REQUEST.value(), "이메일 또는 비밀번호를 잘못 입력했습니다."),
    NOT_FOUND_MEMBER("ERRM004", HttpStatus.BAD_REQUEST.value(), "사용자를 찾을 수 없습니다.");

    private final String code;

    private final int status;

    private final String message;

    ErrorType(String code, int status, String message) {
        this.code = code;
        this.status = status;
        this.message = message;
    }

}
