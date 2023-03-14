package com.sist.global.security.service;

import com.sist.global.security.vo.AuthMemberVO;
import com.sist.mapper.MemberMapper;
import com.sist.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        MemberVO vo = memberMapper.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("사용자를 찾을 수 없습니다."));
        return new AuthMemberVO(vo.getMno(), vo.getNickname(), vo.getEmail(), vo.getPassword(), vo.getRole());
    }

}
