<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<ol class="commentlist">
  <c:forEach items="${comments}" var="comment" varStatus="status">
   <c:choose>
    <c:when test="${depth==null||depth==0}">
     <li class="comment byuser comment-author-mjmode even thread-even depth-1" id="comment-${comment.id}">
      <span class="comt-f">#${status.index+1 }</span>
    </c:when>
    <c:otherwise>
      <li class="comment byuser comment-author-mjmode even thread-even  children-reply'}" style="margin-left: 46px;" id="comment-${comment.id}">
    </c:otherwise>
   </c:choose>
   <div class="comt-avatar"><img src="${g.domain}/resource/img/avatar.png" class="avatar avatar-36 photo" height="36" width="36"></div>
   <div class="comt-main" id="div-comment-12165">${comment.content}
	    <div class="comt-meta">
	    	<span class="comt-author">${comment.creator}</span><fmt:formatDate value="${comment.createTime}" pattern="yyyy/MM/dd hh:mma"/>
	    	<a rel="nofollow" class="comment-reply-login" href="${comment.url}">
	    	</a>
	    	<c:if test="${comment.status=='approve'}">
	    	<!-- 
	    	<a class="signin-loader comment-reply-link" href="javascript:;"><i class="fa fa-reply"></i> 登录后回复</a>
	    	-->
	    	</c:if>
	    </div>
   </div>
   
     <c:if test="${comment.children!=null&&fn:length(comment.children)!=0}">
       <c:set var="depth" value="${depth+1}" scope="request" />
       <c:set var="parent" value="${status.index%2==0}" scope="request" />
       <c:set var="comments" value="${comment.children}" scope="request" />
       <jsp:include page="comments_list.jsp" flush="false" />
       <c:set var="depth" value="${depth-1}" scope="request" />
     </c:if>
   </li>
  </c:forEach>
</ol>
