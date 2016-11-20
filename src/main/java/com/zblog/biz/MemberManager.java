package com.zblog.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.zblog.core.dal.entity.Member;
import com.zblog.service.MemberService;

@Component
public class MemberManager{
  @Autowired
  private MemberService memberService;

  /**
   * 
   */
  @Transactional
  public Member findByEmail(String email){
	  Member member =memberService.loadByEmail(email);
	  return member;
  }
  
  @Transactional
  public Member findByUserName(String username){
	  Member member =memberService.loadByUserName(username);
	  return member;
  }
  
  @Transactional
  public Member loadByNameAndPass(String username,String password){
	  Member member =memberService.loadByNameAndPass(username, password);
	  return member;
  }
  
  @Transactional
  public int insert(Member member){
	  return memberService.insert(member);
  }
  
  @Transactional
  public int update(Member member){
	  return memberService.update(member);
  }

}
