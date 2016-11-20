package com.zblog.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.zblog.core.dal.constants.OptionConstants;
import com.zblog.core.dal.constants.PostConstants;
import com.zblog.core.dal.entity.ValidateCode;
import com.zblog.core.util.NumberUtils;
import com.zblog.core.util.StringUtils;
import com.zblog.service.ValidateCodeService;
import com.zblog.web.backend.form.GeneralOption;
import com.zblog.web.backend.form.MailOption;
import com.zblog.web.backend.form.PostOption;

@Component
public class ValidateCodeManager{
  @Autowired
  private ValidateCodeService validateCodeService;

  public ValidateCode loadByEmail(String email){
	    return validateCodeService.loadByEmail(email);
	  }
  
  public int insert(ValidateCode validateCode){
	 return  validateCodeService.insert(validateCode);
  }
  
  public int update(ValidateCode validateCode){
	  return  validateCodeService.update(validateCode);
  }

}
