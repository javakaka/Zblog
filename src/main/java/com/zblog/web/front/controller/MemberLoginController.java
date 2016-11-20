package com.zblog.web.front.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.zblog.service.email.MailSenderService;

@Controller
public class MemberLoginController{
	@Autowired
	private OptionManager optionManager;
	@Autowired
	private MemberManager memberManager;
	@Autowired
	private ValidateCodeManager validateCodeManager;
	@Autowired
	private MailSenderService mailSenderService;

  @RequestMapping(value = "/member/login", method = RequestMethod.POST)
  @ResponseBody
  public String login(String username, String password, HttpServletRequest request, HttpSession session, Model model){
    Member member = memberManager.findByUserName(username);
    if (member == null) {
    	return "{\"code\":\"-1\",\"msg\":\"用户不存在\"}";
    }
    member = memberManager.loadByNameAndPass(username, password);
   if (member == null) {
	return "{\"code\":\"-1\",\"msg\":\"用户名或者密码错误\"}";
   	}
   session.setAttribute("member", member);
	  return "{\"code\":\"0\",\"msg\":\"success\"}";
  }
  
  @RequestMapping(value = "/member/logout", method = RequestMethod.GET)
  public String logout(HttpServletRequest request, HttpSession session, Model model){
	  
	  session.removeAttribute("member");
	  return "redirect:/";
  }

}
