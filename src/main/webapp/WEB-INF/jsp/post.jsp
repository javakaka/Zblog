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
</body>
</html>
