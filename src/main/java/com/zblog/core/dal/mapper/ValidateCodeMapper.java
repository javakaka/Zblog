package com.zblog.core.dal.mapper;

import org.apache.ibatis.annotations.Param;

import com.zblog.core.dal.entity.ValidateCode;

public interface ValidateCodeMapper extends BaseMapper{
  
  ValidateCode loadByEmail(@Param("email")String email);
}
