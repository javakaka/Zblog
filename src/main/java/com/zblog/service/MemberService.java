package com.zblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zblog.core.dal.entity.Member;
import com.zblog.core.dal.mapper.BaseMapper;
import com.zblog.core.dal.mapper.MemberMapper;

@Service
public class MemberService extends BaseService{
  @Autowired
  private MemberMapper memberMapper;

  public Member loadByEmail(String email){
    return memberMapper.loadByEmail(email);
  }
  
  public Member loadByUserName(String username){
	  return memberMapper.loadByUserName(username);
  }
  
  public Member loadByNameAndPass(String username,String password){
	  return memberMapper.loadByNameAndPass(username, password);
  }

  @Override
  protected BaseMapper getMapper(){
    return memberMapper;
  }

}
