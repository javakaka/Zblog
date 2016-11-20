package com.zblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zblog.core.dal.entity.ValidateCode;
import com.zblog.core.dal.mapper.BaseMapper;
import com.zblog.core.dal.mapper.ValidateCodeMapper;

@Service
public class ValidateCodeService extends BaseService{
  @Autowired
  private ValidateCodeMapper validateCodeMapper;

  public ValidateCode loadByEmail(String email){
    return validateCodeMapper.loadByEmail(email);
  }

  @Override
  protected BaseMapper getMapper(){
    return validateCodeMapper;
  }

}
