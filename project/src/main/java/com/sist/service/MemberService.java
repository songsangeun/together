package com.sist.service;

import com.sist.exception.member.DuplicateEmailException;
import com.sist.exception.member.DuplicateNicknameException;
import com.sist.exception.member.NotFoundMemberException;
import com.sist.global.error.exception.ErrorType;
import com.sist.mapper.MemberMapper;
import com.sist.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public void signup(MemberVO memberVO) {
        nicknameDuplicateCheck(memberVO.getNickname());
        emailDuplicateCheck(memberVO.getEmail());
        String encode = passwordEncoder.encode(memberVO.getPassword());
        memberVO.setPassword(encode);
        memberMapper.save(memberVO);
    }

    public MemberVO profile(String email) {
        return memberMapper.findByEmail(email)
                .orElseThrow(() -> new NotFoundMemberException(ErrorType.NOT_FOUND_MEMBER));
    }

    public void nicknameDuplicateCheck(String nickname) {
        if (memberMapper.existsByNickname(nickname)) {
            throw new DuplicateNicknameException(ErrorType.DUPLICATE_NICKNAME);
        }
    }

    public void emailDuplicateCheck(String email) {
        if (memberMapper.existsByEmail(email)) {
            throw new DuplicateEmailException(ErrorType.DUPLICATE_EMAIL);
        }
    }

    public void memberOut(int mno) {
        memberMapper.delete(mno);
    }

}
