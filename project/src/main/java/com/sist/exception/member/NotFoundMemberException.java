package com.sist.exception.member;

import com.sist.global.error.exception.BaseException;
import com.sist.global.error.exception.ErrorType;

public class NotFoundMemberException extends BaseException {

    public NotFoundMemberException(ErrorType errorType) {
        super(errorType);
    }

}
