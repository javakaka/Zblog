package com.zblog.web.front.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zblog.biz.MemberManager;
import com.zblog.biz.OptionManager;
import com.zblog.biz.ValidateCodeManager;
import com.zblog.core.dal.entity.Member;
import com.zblog.core.dal.entity.ValidateCode;
import com.zblog.core.util.IdGenerator;
import com.zblog.core.util.Md5Util;
import com.zblog.core.util.NumberUtils;
import com.zblog.core.util.StringUtils;
import com.zblog.service.email.MailSenderService;
import com.zblog.service.vo.MailVO;
import com.zblog.web.backend.form.MailOption;

@Controller
public class RegisterController{
	@Autowired
	private OptionManager optionManager;
	@Autowired
	private MemberManager memberManager;
	@Autowired
	private ValidateCodeManager validateCodeManager;
	@Autowired
	private MailSenderService mailSenderService;

  @RequestMapping(value = "/validatecode", method = RequestMethod.POST)
  @ResponseBody
  public String sendCode(String email, HttpServletRequest request, Model model){
    Member member = memberManager.findByEmail(email);
   if (member != null) {
	return "{\"code\":\"-1\",\"msg\":\"邮箱已被注册\"}";
   }
   MailVO mail =new MailVO();
	  mail.setFrom("service@tao-fast.com");
	  ArrayList<String> to =new ArrayList<String>();
	  to.add(email);
	  mail.setTo(to);
	  mail.setSubject("用户注册");
	  int randomcode =NumberUtils.randomInt(1000, 100000);
	  mail.setContent("欢迎注册，您的验证码是:"+randomcode);
	  if (! mailSenderService.isInit()) {
		  MailOption mailOpt =optionManager.getMailOption();
		  if ( mailOpt == null ) {
			return "mail server not config";
		  }
		  else
		  {
			  mailSenderService.setServerInfo(mailOpt);
		  }
	  }
	  mailSenderService.sendMail(mail);
	  ValidateCode code =new ValidateCode();
	  code.setCode(String.valueOf(randomcode));
	  code.setEmail(email);
	  code.setStatus(1);
	  code.setCreateTime(new Date());
	  code.setId(IdGenerator.uuid19());
	  validateCodeManager.insert(code);
	  return "{\"code\":\"0\",\"msg\":\"success\"}";
  }
  
  @RequestMapping(value = "/register", method = RequestMethod.POST)
  @ResponseBody
  public String register(String username,String email,String code, HttpServletRequest request, Model model){
	  Member member = memberManager.findByEmail(email);
	  if (member != null) {
		  return "{\"code\":\"-1\",\"msg\":\"邮箱已被注册\"}";
	  }
	  member =memberManager.findByUserName(username);
	  if (member != null) {
		  return "{\"code\":\"-1\",\"msg\":\"用户名已被注册\"}";
	  }
	  ValidateCode validateCode =validateCodeManager.loadByEmail(email);
	  if (validateCode == null) {
		  return "{\"code\":\"-1\",\"msg\":\"验证码错误\"}";
	  }
	  int codeStatus =validateCode.getStatus();
	  if (codeStatus != 1) {
		  return "{\"code\":\"-1\",\"msg\":\"验证码已失效\"}";
	  }
	  int result =0;
	  // insert user 
	  member =new Member();
	  member.setUsername(username);
	  member.setEmail(email);
	  String password =StringUtils.getRandKeys(6);
	  String rawPwd =password;
	  password =Md5Util.Md5(password);
	  member.setId(IdGenerator.uuid19());
	  member.setPassword(password);
	  member.setCreateTime(new Date());
	  member.setNickname(username);
	  result =memberManager.insert(member);
	  
	  // update code
	  validateCode.setStatus(2);
	  validateCode.setLastUpdate(new Date());
	  result =validateCodeManager.update(validateCode);
	  if (result != 1) {
		  return "{\"code\":\"-1\",\"msg\":\"注册失败，请稍后再试\"}";
	  }
	  
	  // send mail with user info 
	  MailVO mail =new MailVO();
	  mail.setFrom("service@tao-fast.com");
	  ArrayList<String> to =new ArrayList<String>();
	  to.add(email);
	  mail.setTo(to);
	  mail.setSubject("注册成功");
	  mail.setContent("尊敬的用户您已注册成功，用户名是:"+username+"密码是:"+rawPwd+"<br/>登录地址: http://www.tao-fast.com");
	  if (! mailSenderService.isInit()) {
		  MailOption mailOpt =optionManager.getMailOption();
		  if ( mailOpt == null ) {
			  return "mail server not config";
		  }
		  else
		  {
			  mailSenderService.setServerInfo(mailOpt);
		  }
	  }
	  mailSenderService.sendMail(mail);
	  return "{\"code\":\"0\",\"msg\":\"success\"}";
  }

}
