package com.zblog.core.dal.mapper;

import org.apache.ibatis.annotations.Param;

import com.zblog.core.dal.entity.MemberCollection;

public interface MemberCollectionMapper extends BaseMapper{
  
  MemberCollection listByMemberId(@Param("memberId")String memberId);
  
}
