<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String keywords =request.getParameter("keywords");
	if( keywords == null || keywords.trim().length() == 0){
		keywords ="";
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="${g.description}" />
<%
	if( keywords == "" ){
%>
<meta name="keywords" content="${g.keywords}" />
<%		
	}
	else{
		%>
		<meta name="keywords" content="<%=keywords %>" />
		<%
	}
%>
<meta name="applicable-device"content="pc,mobile">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=11,IE=10,IE=9,IE=8">
<meta name="apple-mobile-web-app-title" content="">
<meta http-equiv="Cache-Control" content="no-siteapp">
<meta http-equiv="Cache-Control" content="no-transform">
<meta name="Author" Content="">
<meta name="Designer" Content="">
<meta name="Copyright" Content="本页除转载内容，版权归所有。All Rights Reserved">
<title>${ptitle}${ptitle!=null?' | ':''}${g.title}</title>
<link rel="icon" href="${g.domain}/resource/img/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${g.domain}/resource/img/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="${g.domain}/resource/img/favicon.ico">

<link rel="apple-touch-icon-precomposed" sizes="144x144" href="">
<link rel='stylesheet' id='mbt-bootstrap-css-css'  href="${g.domain}/resource/css/bootstrap.min.css-ver=1.css" type='text/css' media='screen' />
<link rel='stylesheet' id='mbt-fontawesome-css-css'  href="${g.domain}/resource/css/font-awesome.min.css-ver=1.css"  type='text/css' media='screen' />
<link rel='stylesheet' id='style-css'  href="${g.domain}/resource/css/style.css-ver=1.css"  type='text/css' media='screen' />
<link rel='stylesheet' id='plugin_stylesheet-css'  href="${g.domain}/resource/css/prettify.css" type='text/css' media='all' />

<script type="text/javascript" src="${g.domain}/resource/js/jquery-1.9.1.min.js"></script>
<!--[if lt IE 9]>
<script src="${g.domain}/resource/js/html5.min.js" ></script>
<![endif]-->
<link href="${g.domain}/resource/css/share.css" rel="styleSheet" type="text/css">
