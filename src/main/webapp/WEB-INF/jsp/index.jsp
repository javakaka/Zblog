<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="page" uri="/WEB-INF/tld/pagination.tld" %>
<!DOCTYPE Html>
<html>
<head>
<jsp:include page="common/head.jsp" flush="false" />
</head>
<body class="home blog xiaoyaole bhead sidebar-right">
  <%@include file="common/header.html" %>
  <%@include file="common/member-login-status.jsp" %>
  <%@include file="common/search.html" %>
  <section class="container">
<div class="content-wrap">
  <div class="content">
    <div class="newslist">
    	<div class="cat-filter">
		<div itemscope itemtype="http://schema.org/WebPage" class="breadcrumbs" id="crumbs"> <i class="fa fa-home"></i>
			<a itemprop="breadcrumb" href="${g.domain}/" >首页</a>
		</div>
		<!--         
		<div class="title">
          <h1>Windows10</h1>
        </div>
        -->
    	<div class="tag-fliter"> 
    	<c:if test="${empty tag }">
    		<a href="${g.domain}/" class="btn btn-default active">全部标签</a>
    	</c:if>
    	<c:if test="${! empty tag }">
    		<a href="${g.domain}/" class="btn btn-default ">全部标签</a>
    	</c:if>
        	<c:forEach items="${tag_list}" var="tag_item">
        	
        	<a rel="nofollow" class="btn btn-default <c:if test="${ tag == tag_item.name }">active</c:if>" href ="${g.domain}/tags/${tag_item.name }"  title="标签筛选：${tag_item.name }">${tag_item.name }</a>
        	</c:forEach>
        </div>
      </div>
	  <div class="index-ad">
		<script type="text/javascript">
		    /*文章标题下方，正文内容上方*/
		</script>
	  </div>
	  <!-- 文章列表 -->
	   <c:forEach items="${page.content}" var="post">
	   <article class="excerpt">	
    	<a class="focus" href="${g.domain}/posts/${post.id}" ><img src="${g.domain}/${post.picture }"  class="thumb" alt="${post.title}"/></a>
	  	<header>
	   <!--  分类链接
	    	<a class="cat cat-3525" href="${g.domain}/posts/${post.id}" >${post.title}<i></i></a>    
	   -->
	    	<h2><a href="${g.domain}/posts/${post.id}"  title="${post.title}" rel="bookmark">${post.title}</a></h2>
	  	</header>
  		<p class="note">
  			${post.excerpt}...
		</p>
		<p class="meta">
		    <time><fmt:formatDate value="${post.createTime}" pattern="yyyy" /></time>
		    <time><fmt:formatDate value="${post.createTime}" pattern="MMM" /></time>
		    <time><fmt:formatDate value="${post.createTime}" pattern="dd" /></time>
		    <time>/</time>
		    <span class="pv"><a href="" >快乐的时光</a></span>
		</p>
	  </article>
      </c:forEach>
      <!-- 
  	  <article class="excerpt">	
    	<a class="focus" href="" ><img data-src="20151113124725628.jpg-imageView2-1-w-220-h-150-q-90.jpg"  class="thumb" alt="Win10首个正式版10240.17146累积更新补丁推送：大量修复内容"/></a>
	  	<header>
	    	<a class="cat cat-3525" href="windows10.htm" >Windows10<i></i></a>    
	    	<h2><a href=""  title="Win10首个正式版10240.17146累积更新补丁推送：大量修复内容" rel="bookmark">Win10首个正式版10240.17146累积更新补丁推送：大量修复内容</a></h2>
	  	</header>
  		<p class="note">10月12日消息，今天微软在推送最新的Win10一周年更新正式版14393.321累积更新的同时，还为最初的Win10正式版10240用户推送累积更新补丁KB3192440，升级安装后的版本号是Build 10240.17146。
		Windows10 Build 10240.17146更新内容：
		提升Windows图形设备接口可靠性
		修复安装KB317005安全更新后，导致打印机驱动不能正确安装问题
		...
		</p>
		<p class="meta">
		    <time>10-12</time>
		    <time>/</time>
		    <span class="pv"><a href="" >逍遥乐</a></span>
		</p>
	  </article>
	-->
	<div class="index-ad">
		<!-- 分类页 -->
		<ins class="adsbygoogle"
		     style="display:block"
		     data-ad-client="ca-pub-2718462611635319"
		     data-ad-slot="6624498748"
		     data-ad-format="auto">
		</ins>
	</div>		
			   
	<!-- 分页 -->		   
	<div class="pagination">
		<ul>
		<page:page model="${page}" pageUrl="${request.requestURL}" showPage="9" boundary="2">
               <page:prev>
                 <li class="prev-page"><a href="${pageUrl}"><<</a></li>
               </page:prev>
              <page:pager>
                <c:choose>
                  <c:when test="${dot}">
                   <li><span class="dots">…</span></li>
                  </c:when>
                  <c:when test="${pageNumber==page.pageIndex}">
                     <li class="active"><span>${pageNumber}</span></li>
                  </c:when>
                  <c:otherwise>
                    <li><a href="${pageUrl}">${pageNumber}</a></li>
                  </c:otherwise>
                </c:choose>
              </page:pager>
               <page:next>
                 <li class="next-page"><a href="${pageUrl}">>></a></li>
               </page:next>
             </page:page>
             <!-- 
			<li class="prev-page"></li>
			<li class="active"><span>1</span></li>
			<li><a href="" >2</a></li>
			<li><a href="" >3</a></li>
			<li><span> ... </span></li>
			<li><a href="" >12</a></li>
			<li class="next-page"><a href=""  >下一页</a></li>
			-->
		</ul>
		
	</div>
	</div>
  </div>
</div>
<aside class="sidebar">
    <%@include file="common/login.jsp" %>
	<%@include file="common/notice.jsp" %>
	<!-- 广告位 
	<div class="widget widget_ui_textads">
		<a class="style01" href="" target="_blank">
		<strong>主机推荐</strong>
		<h2>免备案高速香港空间—恒创主机</h2>
		<p>博主多个网站自用推荐，值得信赖！</p>
		</a>
	</div>
	<div class="widget widget_ui_ads">
		<div class="item">
			<p>
				<a href=""  rel="nofollow" target="_blank" title="逍遥乐推荐 - 阿里云服务器最低低至49.5元每月"><img src="aliyun100.jpg"  alt="逍遥乐推荐 - 阿里云服务器最低低至49.5元每月"></a>
			</p>
		</div>
	</div>
	-->
	<!-- 最新文章 -->
	<%@include file="common/recent.html" %>
	<%@include file="common/push.jsp" %>
	<%@include file="common/hot.jsp" %>
	<%@include file="common/link.html" %>
</aside>
</section>
<!-- 
      <%@include file="common/recent.html" %>
      <%@include file="common/tagcloud.html" %>
      <%@include file="common/archive.html" %>
      <%@include file="common/link.html" %>
    </div>
    -->
    <jsp:include page="common/footer.jsp" flush="false" />
   
</body>
</html>
