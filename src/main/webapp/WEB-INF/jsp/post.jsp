<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE Html>
<html>
<head>
<jsp:include page="common/head.jsp" flush="false" >
	<jsp:param name="keywords" value="${post.keywords }" />
</jsp:include>
<style type="text/css">
.hacklogdownload_downlinks
{
    width:500px;
}

.hacklogdownload_down_link
{
  border: 1px solid #ddd;
  border-radius: 2px;
  color: #444;
  font-size: 14px;
  margin-bottom: 10px;
  padding: 5px 10px;
  text-decoration: none;
}
#facebox .content{margin: 0 !important;}

.hacklogdownload_down_link a
{
    color:#fff;
    
}

.hacklogdownload_views
{
    color:red;
}

.hacklogdownload_box
{
    border-bottom:1px solid #aaa;
    padding:10px 0;
}

.hacklogdownload_box_content
{
    line-height:18px;
    padding:0 0 0 10px;
}

.hacklogdownload_box_content p
{
    margin:5px 0;
}

.hacklogdownload_box_content a
{
    color:#D54E21;
}

.hacklogdownload_box_content a:hover
{
    color:#1d1d1d;
}

.hacklogdownload_left
{
    float:left;
    width:320px;
}

.hacklogdownload_right
{
    width:160px;
    float:right;
    margin:0 auto;
}

.hacklogdownload_right img
{
    max-width:160px;
}

.hacklogdownload_notice
{
    padding-top:10px;
    text-align:center;
}

#facebox .content
{
    width:600px;
    background:none repeat scroll 0 0 #E0E2E4;
    color:#333;
}

#facebox .popup
{
    border:6px solid #ff7d00;
}
.hacklogdownload_down_link  .downbtn {
   text-decoration: none !important;
  background: none repeat scroll 0 0 #f26013;
  border: 0 none;
  border-radius: 2px;
  color: #FFFFFF !important;
  cursor: pointer;
  font-family: \"Open Sans\",\"Hiragino Sans GB\",\"Microsoft YaHei\",\"WenQuanYi Micro Hei\",Arial,Verdana,Tahoma,sans-serif;
  font-size: 14px;
  margin: -4px 20px 0 0;
  padding: 8px 30px;
}

.hacklogdownload_down_link .downlink a:link {color: #ffffff;}
.hacklogdownload_down_link  .downlink a:visited {color: #ffffff;}
.hacklogdownload_down_link  .downlink a:hover {color: #ffffff;}
.hacklogdownload_down_link  .downlink a:active {color: #ffffff;}</style>

</head>
<body class="single single-post postid-17840 single-format-standard comment-open bhead sidebar-right">
  <%@include file="common/header.html" %>
<section class="container">  
	<div class="content-wrap">
		<div class="content">
     		<jsp:include page="common/content.jsp" flush="false" />
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
</body>
</html>
