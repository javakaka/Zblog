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
  <section class="container">
<div class="content-wrap">
  <div class="content">
    <div class="newslist">
    	<div class="cat-filter">
		<div itemscope itemtype="http://schema.org/WebPage" class="breadcrumbs" id="crumbs"> <i class="fa fa-home"></i>
			<a itemprop="breadcrumb" href="${domain}/" >首页</a> » <span class="current">Windows10</span>
		</div>        
		<div class="title">
          <h1>Windows10</h1>
        </div>
    	<div class="tag-fliter"> 
    		<a href="windows10.htm" class="btn btn-default active">全部标签</a>
        	<a rel="nofollow" class="btn btn-default " href =""  title="标签筛选：win10">win10</a>
        	<a rel="nofollow" class="btn btn-default " href =""  title="标签筛选：windows10">windows10</a>
        	<a rel="nofollow" class="btn btn-default " href =""  title="标签筛选：推送">推送</a>
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
    	<a class="focus" href="$${g.domain}/posts/${post.id}" ><img data-src="20151113124725628.jpg-imageView2-1-w-220-h-150-q-90.jpg"  class="thumb" alt="${post.title}"/></a>
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
    <div class="widget widget-user"><ul class="widget-navcontent">
		<li class="item item-02 active"><h4>登录，是一种态度</h4>
			<p>
				<a href="javascript:;" class="btn btn-primary signin-loader">立即登录</a>
				<a href="javascript:;" class="btn btn-default signup-loader">现在注册</a>
			</p>
		</li></ul>
	</div>
	<div class="widget widget_ui_textads">
	<a class="style02" href="" ><strong>网站公告</strong>
	<h2>网站升级优化中！</h2>
	<p><i class="fa fa-bullhorn"></i>2016年9月28日起，至10月逍遥乐博客进入整体优化阶段，若出现无法访问的情况，请稍后再试！如有问题请留言反馈！</p>
	</a>
	</div>
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
	<!-- 猜你喜欢
	<div class="widget widget_ui_posts">
		<h3 class="widget_tit">猜你喜欢</h3>
		<ul>
			<li><a href="javascript:if(confirm('http://www.luoxiao123.cn/10387.html  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ������, �����������, ����Ŀ����ֹͣ��  \n\n�����ڷ������ϴ���?'))window.location='http://www.luoxiao123.cn/10387.html'" tppabs="http://www.luoxiao123.cn/10387.html"><span class="thumbnail"><img data-src="20141108-1.jpg-imageView2-1-w-75-h-58-q-90" tppabs="http://cdn.luoxiao123.cn/images/2014/11/20141108-1.jpg?imageView2/1/w/75/h/58/q/90" class="thumb" alt="装逼神器，自由修改微博尾巴，微博尾巴通APP免费下载，" /></span><span class="text">装逼神器，自由修改微博尾巴，微博尾巴通APP免费下载，</span><span class="muted">11-08</span><span class="muted">4评论</span></a></li>
			<li><a href="javascript:if(confirm('http://www.luoxiao123.cn/254.html  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ������, �����������, ����Ŀ����ֹͣ��  \n\n�����ڷ������ϴ���?'))window.location='http://www.luoxiao123.cn/254.html'" tppabs="http://www.luoxiao123.cn/254.html"><span class="thumbnail"><img data-src="f254f665a664c0b8a0c6d70f7b83f8ac.jpg-imageView2-1-w-75-h-58-q-90" tppabs="http://cdn.luoxiao123.cn/images/2014/06/f254f665a664c0b8a0c6d70f7b83f8ac.jpg?imageView2/1/w/75/h/58/q/90" class="thumb" alt="白秒掉黑？苹果白色iPhone5海量真机图片欣赏" /></span><span class="text">白秒掉黑？苹果白色iPhone5海量真机图片欣赏</span><span class="muted">09-19</span><span class="muted"></span></a></li>
			<li><a href="javascript:if(confirm('http://www.luoxiao123.cn/186.html  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ������, �����������, ����Ŀ����ֹͣ��  \n\n�����ڷ������ϴ���?'))window.location='http://www.luoxiao123.cn/186.html'" tppabs="http://www.luoxiao123.cn/186.html"><span class="thumbnail"><img data-src="c8ba68eb637d9ba6b16bbb6e6a5f6818.jpg-imageView2-1-w-75-h-58-q-90.jpg" tppabs="http://cdn.luoxiao123.cn/images/2014/06/c8ba68eb637d9ba6b16bbb6e6a5f6818.jpg?imageView2/1/w/75/h/58/q/90" class="thumb" alt="3Q案第三次交锋：腾讯索赔1.25亿 当庭未宣判" /></span><span class="text">3Q案第三次交锋：腾讯索赔1.25亿 当庭未宣判</span><span class="muted">09-18</span><span class="muted"></span></a></li>
			<li><a href="javascript:if(confirm('http://www.luoxiao123.cn/11164.html  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ������, �����������, ����Ŀ����ֹͣ��  \n\n�����ڷ������ϴ���?'))window.location='http://www.luoxiao123.cn/11164.html'" tppabs="http://www.luoxiao123.cn/11164.html"><span class="thumbnail"><img data-src="thumbnail.png-imageView2-1-w-75-h-58-q-90.png" tppabs="http://cdn.luoxiao123.cn/images/thumbnail.png?imageView2/1/w/75/h/58/q/90" class="thumb" alt="阿里云服务器Linux下如何进行FTP安装与设置" /></span><span class="text">阿里云服务器Linux下如何进行FTP安装与设置</span><span class="muted">12-26</span><span class="muted">1评论</span></a></li>
			<li><a href="javascript:if(confirm('http://www.luoxiao123.cn/html_meta_ds.html  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ������, �����������, ����Ŀ����ֹͣ��  \n\n�����ڷ������ϴ���?'))window.location='http://www.luoxiao123.cn/html_meta_ds.html'" tppabs="http://www.luoxiao123.cn/html_meta_ds.html"><span class="thumbnail"><img data-src="thumbnail.png-imageView2-1-w-75-h-58-q-90.png" tppabs="http://cdn.luoxiao123.cn/images/thumbnail.png?imageView2/1/w/75/h/58/q/90" class="thumb" alt="html的meta总结，html标签中meta属性使用介绍" /></span><span class="text">html的meta总结，html标签中meta属性使用介绍</span><span class="muted">10-17</span><span class="muted"></span></a></li>
		</ul>
	</div>
	 -->
	<!-- 热门关注 
	<div class="widget widget_ui_tags">
		<h3 class="widget_tit">热门关注</h3>
		<div class="items">
			<a href="">wordpress插件 (138)</a>
			<a href="">wordpress (100)</a>
			<a href="">Win8 (98)</a>
			<a href="">win10 (90)</a>
			<a href="">windows8 (85)</a>
			<a href="">逍遥乐 (79)</a>
			<a href="">wordpress教程 (72)</a>
			<a href="">微软 (65)</a>
			<a href="">windows (61)</a>
			<a href="">逍遥乐汉化 (56)</a>
		</div>
	</div>
	 -->
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
