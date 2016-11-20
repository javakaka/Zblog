package com.zblog.service.email;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.zblog.core.Constants;
import com.zblog.core.util.MailUtil;
import com.zblog.service.vo.MailVO;
import com.zblog.web.backend.form.MailOption;

/**
 * 邮件发送服务
 * 
 * @author zhou
 *
 */
@Service
public class MailSenderService{
  private static final Logger logger = LoggerFactory.getLogger(MailSenderService.class);

  private JavaMailSenderImpl sender = new JavaMailSenderImpl();
  private boolean init = false;
  
  public void setServerInfo(MailOption form){
    sender.setHost(form.getHost());
    sender.setPort(form.getPort());
    sender.setUsername(form.getUsername());
    sender.setPassword(form.getPassword());
    init = true;
  }

  /**
   * 发送邮件
   * 
   * @param mail
   */
  public void sendMail(MailVO mail){
    if(!init)
      return;
    MailUtil.sendMail(sender.getHost(), sender.getPort(), mail.getFrom(), sender.getPassword(), mail.getSubject(), mail.getContent(), mail.getTo().get(0));
//    MimeMessage message = sender.createMimeMessage();
//    try{
//      MimeMessageHelper helper = new MimeMessageHelper(message, true, Constants.ENCODING_UTF_8.name());
//      helper.setFrom(mail.getFrom());
//      helper.setTo(mail.getTo().toArray(new String[]{}));
//      helper.setSubject(mail.getSubject());
//      helper.setText(mail.getContent(), true);
//      sender.send(message);
//    }catch(MessagingException e){
//      logger.error("send mail error", e);
//    }
  }

	public boolean isInit() {
		return init;
	}
	
	public void setInit(boolean init) {
		this.init = init;
	}
  


}
