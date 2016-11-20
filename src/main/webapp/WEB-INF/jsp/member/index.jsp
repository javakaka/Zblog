<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="page" uri="/WEB-INF/tld/pagination.tld" %>
<!DOCTYPE Html>
<html>
<head>
<jsp:include page="../common/head.jsp" flush="false" />
</head>
<body class="home blog xiaoyaole bhead sidebar-right">
  <%@include file="../common/header.html" %>
<section class="container"><div class="user-hd" style="background:#504B51 url(http://www.luoxiao123.cn/wp-content/themes/Xiaoyao/img/user-bg.jpg);background-repeat: no-repeat;background-size: cover;background-position: center top;">
		<div class="container">
		<script type="text/javascript" src="http://www.luoxiao123.cn/wp-content/themes/Xiaoyao/js/libs/jquery.form.js?ver=1.0"></script>
		<form id="uploadphoto" action="http://www.luoxiao123.cn/wp-content/themes/Xiaoyao/action/upload-photo.php" method="post" enctype="multipart/form-data">
			<div class="my-avatar">
				<a href="javascript:void(0);" title="修改头像">
					<img src="http://www.luoxiao123.cn/wp-content/themes/Xiaoyao/img/avatar.png" class="avatar avatar-220" height="220" width="220"><span class="update-tip"><i class="fa fa-upload"></i></span><input type="file" name="avatarphoto" id="avatarphoto" class="uploadinput">
				</a>
				<span class="photopath"></span>
			</div> 
			</form>
			<div class="my-nickname"><span>yoyouka<a class="icon-vip no-vip" href="http://www.luoxiao123.cn/user#vip" title="您当前还不是VIP会员，点击升级VIP"></a></span></div> 
			<ul class="my-stuffs">
				<li>
					<a href="#posts/publish">
						<span class="my-coupon">0</span>
						
						<em>我的文章</em>
					</a>
				</li>
				<li>
					<a href="#comments">
						<span class="my-coupon">1</span>
						
						<em>我的评论</em>
					</a>
				</li>
				<li>
					<a href="#order">
						<span class="my-coupon">0.00</span>
						<em>消费金额</em>
					</a>
				</li>
				<li>
					<a href="#charge">
						<span class="my-point">0.00</span>
						<em>剩余金额</em>
					</a>
				</li>
				
				
			</ul> 
		</div>
	</div>
<div class="container-user">
  <div class="userside">
    <div class="usermenus">
      <ul class="usermenu">
      	<li class="usermenu-tags"><a href="#tags">关注领域</a></li>
		<!-- <li class="usermenu-contribute"><a href="#contribute">在线投稿</a></li> -->
        <li class="usermenu-posts"><a href="#posts/publish">我的文章</a></li>
        <li class="usermenu-favs"><a href="#favs">我的收藏</a></li>
        <li class="usermenu-comments"><a href="#comments">我的评论</a></li>
        <li class="usermenu-user"><a href="#user">修改资料</a></li>
      </ul>
      <ul class="usermenu">
      	<li class="usermenu-charge"><a href="#charge">在线充值</a></li>
        <li class="usermenu-vip"><a href="#vip">升级会员</a></li>
        <li class="usermenu-history"><a href="#history">充值记录</a></li>
        <li class="usermenu-order"><a href="#order">下载清单</a></li>
        <li class="usermenu-aff active"><a href="#aff">我的推广</a></li>
      </ul>
      <ul class="usermenu">
      	<li class="usermenu-signout"><a href="http://www.luoxiao123.cn/login?action=logout">退出</a></li>
      </ul>
    </div>
  </div>
  <div class="content" id="contentframe">
    <div class="user-main"><div class="charge">
				<h2 style="padding-top:40px;">您的专属推广链接：<font color="#5bc0de">http://www.luoxiao123.cn/?aff=9888</font></h2>
			  </div>
			  <table class="table table-striped table-hover user-orders"><thead><tr><th width="140">推广用户</th><th width="180">注册日期</th><th width="60">消费金额</th></tr></thead><tbody></tbody></table>
		<div class="user-alerts">
		<h4>推广说明：</h4>
		<ul>
			<li>推广链接可以是任意页面加 <span class="label label-info">?aff=9888</span>，比如你要推广的资源地址是 http://www.luoxiao123.cn/1.html，那么推广地址是 <span class="label label-info">http://www.luoxiao123.cn/1.html?aff=9888</span>；</li>
			<li>只显示最近有消费的10条推广记录，其消费金额的10%将作为你的推广奖励，奖励暂时只能用于站内消费。</li>
		</ul>
		</div></div>
    <div class="user-tips"></div>
  </div>
</div>
<script id="temp-postmenu" type="text/x-jsrender" data-jsv-tmpl="_0">
	<a href="#posts/{{>name}}">{{>title}}<small>({{>count}})</small></a>
</script>

<script id="temp-postitem" type="text/x-jsrender">
	<li>
		<img data-src="{{>thumb}}" class="thumb">
		<h2><a target="_blank" href="{{>link}}">{{>title}}</a></h2>
		<p class="note">{{>desc}}</p>
		<p class="text-muted">{{>time}} &nbsp;&nbsp; 分类：{{>cat}} &nbsp;&nbsp; 阅读({{>view}}) &nbsp;&nbsp; 评论({{>comment}})</p>
	</li>
</script>
<script id="temp-favitem" type="text/x-jsrender" data-jsv-tmpl="_1">
	<li>
		<h2><a target="_blank" href="{{>link}}">{{>title}}</a></h2>
		<p class="note">{{>desc}}</p>
		<p class="text-muted">收藏时间：{{>time}} </p>
	</li>
</script>

<script id="temp-commentitem" type="text/x-jsrender" data-jsv-tmpl="_2">
	<li>
		<time>{{>time}}</time>
		<p class="note">{{>content}}</p>
		<p class="text-muted">文章：<a target="_blank" href="{{>post_link}}">{{>post_title}}</a></p>
	</li>
</script>

</section>
<jsp:include page="../common/footer.jsp" flush="false" />
</body>
</html>