<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tld/shiro-function.tld" prefix="sf" %>
<c:if test="${empty sessionScope.member}">
	<div class="widget widget-user"><ul class="widget-navcontent">
		<li class="item item-02 active"><h4>登录，是一种态度</h4>
			<p>
				<a href="javascript:;" class="btn btn-primary signin-loader">立即登录</a>
				<a href="javascript:;" class="btn btn-default signup-loader">现在注册</a>
			</p>
		</li></ul>
	</div>
</c:if>
<c:if test="${!empty sessionScope.member}">
	<!--  already login -->
	<div class="widget widget-user">
		<ul class="widget-navcontent">
			<li class="item item-03 active">
				<img src="${g.domain}/resource/img/avatar.png" class="avatar avatar-50" height="50" width="50">
				<h4>欢迎您，${sessionScope.member.username}</h4>
				<p>
				<a href="${g.domain}/member/index" class="btn btn-primary">会员中心</a> 
				<a href="${g.domain}/member/logout" class="btn btn-default">安全退出</a>
				</p>
			</li>
		</ul>
	</div>
	 
	</c:if>
