<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String mem =request.getParameter("keywords");
%>
<c:if test="${empty sessionScope.member}">
<a href="javascript:;" class="signin-loader">Hi, 请登录</a>&nbsp;/&nbsp;<a href="javascript:;" class="signup-loader">我要注册</a>
</c:if>
<c:if test="${! empty sessionScope.member}">
		您好
		<a class="icon-vip no-vip" href="${g.domain}" title=""></a>
		${sessionScope.member.username}
		<a href="${g.domain}/member/index"><i class="fa fa-user"></i> 会员中心</a>
</c:if>
      </div>
    <i class="fa fa-bars m-icon-nav"></i>
    <i class="fa fa-search m-icon-nav m-nav-search"></i> 
        <i class="fa fa-user m-icon-nav signin-loader"></i> 
      </div>
</header>
