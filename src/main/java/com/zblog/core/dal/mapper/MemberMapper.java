package com.zblog.core.dal.mapper;

import org.apache.ibatis.annotations.Param;

import com.zblog.core.dal.entity.Member;

public interface MemberMapper extends BaseMapper{
  
  Member loadByNameAndPass(@Param("username")String username,@Param("password")String password);
  
  Member loadByEmail(@Param("email")String email);
  Member loadByUserName(@Param("username")String username);
  
}
