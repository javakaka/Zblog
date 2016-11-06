<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tld/shiro-function.tld" prefix="sf" %>
<c:if test="${post.type=='post'}">
<div itemscope itemtype="http://schema.org/WebPage" class="breadcrumbs" id="crumbs"> 
	<i class="fa fa-home"></i>
	<a itemprop="breadcrumb" href="${g.domain}" >首页</a> » 
	<a itemprop="breadcrumb" href="${g.domain}/categorys/${post.category.name}" >${post.category.name}</a> » 
	<span class="current">${post.title}</span>
</div>
<div class="single-content">
	<header class="article-header">
		<div class="article-categories">
		<c:forEach items="${post.tags}" var="tag">
            <a href="${g.domain}/tags/${tag}" rel="tag">${tag}</a>
        </c:forEach>
		</div>
	    <h1 class="article-title">${post.title}</h1>
	    <!-- 收藏
		<div class="article-fav">
			<a href="javascript:;" class="signin-loader"><i class="fa fa-star-o"></i> 收藏 (<span>0</span>)</a>
		</div>
		-->
		<div class="article-meta">
	    	<span class="item"><fmt:formatDate value="${post.createTime}" pattern="yyyy-MM-dd" /></span>
	    	<!-- 
	    	<span class="item">来源：<a href="" target="_blank" rel="external nofollow"></a></span>	
	    	-->
	    	<span class="item">分类：<a  rel="category tag" href="${g.domain}/categorys/${post.category.name}">${post.category.name}</a></span>
			<span class="item post-views">阅读次数：${post.rcount}</span>
			<span class="item"></span>
		</div>
	</header>
	<article class="article-content">
	<!-- 文章详情界面顶部广告位
	<div class="ads ads-post ads-post-01">
		<div pos="文章标题下方，正文内容上方">
		</div>
	</div>
	-->
	 <div class="main-content">
	 ${post.content}
	 </div>
	 <!-- 文章详情页面 文章内容底部广告位
	 <div class="ads ads-post ads-post-02">
		<div  pos="正文内容下方，顶踩按钮上方">
		</div>
	</div>
	 -->
	</article>
	<div class="shareBox  clearfix">
		<p><a href="javascript:;" class="action sharebtn action-like" data-pid="17840" data-event="like">
		<i class="glyphicon glyphicon-thumbs-up"></i>顶 (<span>0</span>)</a>																			<a href="javascript:;" class="sharebtn pay-author"><i class="fa fa-jpy"></i> 打赏</a>
		<a href="javascript:;" class="sharebtn J_showAllShareBtn"><i class="fa fa-share"></i> 分享</a>
		</p>
		<div class="socialBox">
			<div class="action-share bdsharebuttonbox">
				<a class="share-links bds_tsina" data-cmd="tsina" title="分享到新浪微博"><i class="fa fa-weibo"></i></a>
				<a class="share-links bds_weixin sns-wechat"  href="javascript:;" data-src="qrcode.php-url=http---www.luoxiao123.cn-frontendoptimize.html-via=wechat_qr" tppabs="http://s.jiathis.com/qrcode.php?url=http://www.luoxiao123.cn/frontendoptimize.html?via=wechat_qr" title="打开微信“扫一扫”"><i class="fa fa-weixin"></i></a>
				<a class="share-links bds_tqq" data-cmd="tqq" title="分享到腾讯微博"><i class="fa fa-tencent-weibo"></i></a>
				<a class="share-links bds_tqf" data-cmd="tqf" title="分享到腾讯朋友"><i class="fa fa-qq"></i></a>
				<a class="share-links bds_mail" data-cmd="mail" title="分享到邮件分享"><i class="fa fa-envelope-o"></i></a>
				<a class="share-links bds_copy" data-cmd="copy" title="分享到复制网址"><i class="fa fa-chain"></i></a>
				<a class="share-links bds_more" data-cmd="more"><i class="fa fa-plus"></i></a>
			</div>													
			<div class="panel-reward">
				<ul>
					<li class="alipay"><img alt="打赏" src="follow-apay.png"><b>支付宝扫一扫</b></li>
																			
				</ul>
			</div>
		</div>
	</div>
	<nav class="article-nav">
        <span class="article-nav-prev">上一篇  <c:if test="${prev!=null}"><a href="${g.domain}/posts/${prev.id}" rel="prev">${prev.title}</a></c:if></span>
        <span class="article-nav-next"><c:if test="${next!=null}"><a href="${g.domain}/posts/${next.id}" rel="next">${next.title}</a></c:if> 下一篇</span>
    </nav>
</div>
<!-- 猜你喜欢
<div class="relates">
	<h4 class="title">猜你喜欢</h4>
	<ul>
		<li><a href=""><span><img class="thumb" data-src="2016101309445427.png-imageView2-1-w-202-h-132-q-90.png" alt="推荐10 个优秀的占位图服务" /></span>推荐10 个优秀的占位图服务</a></li>
	</ul>	
</div>
 -->
<!-- 内容详情页面广告位 －猜你喜欢下面 
 <div class="myinfo index-ad" style="text-align:center;">
		<div class="ads ads-post ads-post-04">
		<div  pos="猜你喜欢下方，评论上方">
		</div>
		</div>
</div>
-->
<!-- 评论 -->
<div class="post-comment">
	<div class="title" id="comments">
	  <h3><b>${post.ccount}</b> 条评论</h3>
	</div>
	<div id="respond" class="no_webshot">
	    <div class="comt">
		  	<div class="comt-title">
		    	<img src="${g.domain}/resource/img/avatar.png"  class="avatar avatar-28 photo" width="28" height="28">
		    </div>
	  		<div class="comt-box">
	        	<textarea placeholder="你的观点..." class="input-block-level comt-area signin-loader" name="comment" id="comment" cols="100%" rows="3" tabindex="1"></textarea>
		        <div class="comt-ctrl">
		          <div class="comt-tips">
		            <input type='hidden' name='comment_post_ID' value='17840' id='comment_post_ID' />
					<input type='hidden' name='comment_parent' id='comment_parent' value='0' />
					<p style="display: none;"><input type="hidden" id="akismet_comment_nonce" name="akismet_comment_nonce" value="8360870ff0" /></p><p style="display: none;"><input type="hidden" id="ak_js" name="ak_js" value="110"/></p>          </div>
		          <button type="button" name="submit" id="submit" disabled="disabled" tabindex="5"> 发表观点</button>
		        </div>
	      </div>
	  </div>
	  <div id="postcomments">
	  <jsp:include page="comments_list.jsp" flush="false" />
		  <!-- 
		  <ol class="commentlist">
		    <li class="comment byuser comment-author-mjmode even thread-even depth-1" id="comment-12165">
		    	<span class="comt-f">#1</span>
		    	<div class="comt-avatar"><img src="${g.domain}/resource/img/avatar.png" class="avatar avatar-36 photo" height="36" width="36"></div>
			    <div class="comt-main" id="div-comment-12165">牛！速度真快！
				    <div class="comt-meta">
				    	<span class="comt-author">mjmode</span>8小时前
				    	<a rel="nofollow" class="comment-reply-login" href="http://www.luoxiao123.cn/wp-login.php?redirect_to=http%3A%2F%2Fwww.luoxiao123.cn%2Fadobe-cc-2017-pojie-jiaocheng.html">
				    	</a>
				    	<a class="signin-loader comment-reply-link" href="javascript:;"><i class="fa fa-reply"></i> 登录后回复</a>
				    </div>
			    </div>
		    </li>
		  </ol>
		   -->
		  <div class="pagenav"></div>
		</div>
	</div>
</div>
</c:if>
<!-- 
<div class="post_wrap clearfix">
  <div class="post">
   <h3 class="title"><span>${post.title}</span></h3>
   <div class="post_content">
     <c:choose>
       <c:when test="${!sf:isUser()&&post.pstatus=='secret'}">由于作者设置了权限，你没法阅读此文，请与作者联系</c:when>
       <c:otherwise>
         ${post.content}
         <div style="margin-top: 15px; font-style: italic;">
           <p style="margin:0;"><strong>原创文章，转载请注明：</strong>转载自<a href="${g.domain}">${g.title} – tao-fast.com</a></p>
         </div>
       </c:otherwise>
     </c:choose>
   </div>
  </div>
  <div class="meta">
    <ul>
     <li class="post_date clearfix">
       <span class="date"><fmt:formatDate value="${post.createTime}" pattern="dd" /></span>
       <span class="month"><fmt:formatDate value="${post.createTime}" pattern="MMM"/></span>
       <span class="year"><fmt:formatDate value="${post.createTime}" pattern="yyyy" /></span>
     </li>
     <li class="post_read">${post.rcount}人阅读</li>
     <c:if test="${post.type=='post'}">
       <li class="post_category"><a href="${g.domain}/categorys/${post.category.name}">${post.category.name}</a></li>
     </c:if>
     <li class="post_author">
       <a title="由${post.user.nickName}发布" href="#">${post.user.nickName}</a>
     </li>
     <li class="post_comment">
       <a title="${post.title}" href="#respond">发表评论</a>
     </li>
    </ul>
  </div>
</div>
-->
