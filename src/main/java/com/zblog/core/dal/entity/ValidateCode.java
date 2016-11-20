package com.zblog.core.dal.entity;

public class ValidateCode extends BaseEntity{
  private String email;
  private String code;
  /* */
  private int status;
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}

}
