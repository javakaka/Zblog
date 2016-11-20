var qqlogin =0;
var weibologin =0;
var pwdurl ="";
		var signHtml = '\
			<div class="sign">\
			    <div class="sign-mask"></div>\
			    <div class="container">\
			        <!--a href="#" class="close-link signclose-loader"><i class="fa fa-close"></i></a-->\
			        <div class="sign-tips"></div>\
			        <form id="sign-in">  \
						<div class="sign-social"><h2>注册－登录<!--无需注册，直接使用社交账号登录--></h2>'+(qqlogin==1 ? '<a class="login-qq" href="'+jsui.www+'oauth/qq?rurl='+jsui.cur+'"><i class="fa fa-qq"></i> QQ账号登录</a>' : '')+
						(weibologin==1 ? '<a class="login-weibo" href="'+jsui.www+'oauth/weibo?rurl='+jsui.cur+'"><i class="fa fa-weibo"></i> 微博账号登录</a>' : '')+
						'</div>\
			            <h6>\
			                <input type="text" name="user_login" class="form-control" id="user_login" placeholder="用户名">\
							<i class="fa fa-user"></i>\
			            </h6>\
			            <h6>\
			                <input type="password" name="password" class="form-control" id="user_pass" placeholder="密码">\
							<i class="fa fa-lock" style="font-size:18px;"></i>\
			            </h6>\
			            <div class="sign-submit">\
			                <input type="button" class="btn btn-primary signinsubmit-loader" name="submit" value="登录">  \
			                <input type="hidden" name="action" value="signin">\
			                <label><a href="'+pwdurl+'" target="_blank">忘记密码？</a></label>\
			            </div>\
						<div class="sign-trans">没有账号？ <a href="javascript:;" class="signup-loader">注册</a></div>\
			        </form>\
			        <form id="sign-up"> \
						<div class="sign-social"><h2>注册－登录<!--无需注册，直接使用社交账号登录--></h2>'+(qqlogin==1 ? '<a class="login-qq" href="'+jsui.www+'oauth/qq?rurl='+jsui.cur+'"><i class="fa fa-qq"></i> QQ账号注册</a>' : '')+
						(weibologin==1 ? '<a class="login-weibo" href="'+jsui.www+'oauth/weibo?rurl='+jsui.cur+'"><i class="fa fa-weibo"></i> 微博账号注册</a>' : '')+
						'</div>\
			            <h6>\
			                <input type="text" name="name" class="form-control" id="user_register" placeholder="用户名">\
							<i class="fa fa-user"></i>\
			            </h6>\
			            <h6>\
			                <input type="email" name="email" class="form-control" id="user_email" placeholder="邮箱">\
							<i class="fa fa-envelope"></i>\
			            </h6>\
						<h6>\
							<input type="text" class="form-control" style="width:120px;display: inline-block;" id="captcha" name="captcha" placeholder="验证码">\
							<i class="fa fa-eye"></i>\
							<span class="captcha-clk">发送验证码</span>\
						</h6>\
			            <div class="sign-submit">\
			                <input type="button" class="btn btn-primary signupsubmit-loader" name="submit" value="注册">  \
			                <input type="hidden" name="action" value="signup">  \
							<label>密码将发送至您邮箱！</label>\
			            </div>\
						<div class="sign-trans">已有账号？ <a href="javascript:;" class="signin-loader">登录</a></div>\
			        </form>\
			    </div>\
			</div>\
		';

		$("body").append( signHtml );
	    if( $('#issignshow').length ){
	        $("body").addClass('sign-show')
	        $('.close-link').hide()
	        $('#sign-in').show().find('input:first').focus()
	        $('#sign-up').hide()
	    }

	    $('.signin-loader').on('click', function(){
	    	$("body").addClass('sign-show')
            $('#sign-in').show().find('input:first').focus()
            $('#sign-up').hide()
	    })

	    $('.signup-loader').on('click', function(){
	    	$("body").addClass('sign-show')
            $('#sign-up').show().find('input:first').focus()
            $('#sign-in').hide()
	    })

	    $('.signclose-loader').on('click', function(){
	    	$("body").removeClass('sign-show')
	    })
		
		$('.sign-mask').on('click', function(){
	    	$("body").removeClass('sign-show')
	    })
		
		$('.signinsubmit-loader').on('click', function(){
			if( !is_name($("#user_login").val()) ){
				logtips('用户名只能由字母数字或下划线组成的3-16位字符')
				return
			}
			
            if( typeof $("#user_pass").val() == "undifined" || $("#user_pass").val() ==""){
                logtips('请输入密码')
                return
            }
            console.log( $("#user_pass").val()  );
            console.log( hex_md5( $("#user_pass").val() ) );
			$.post(
				SITE_URL+'/member/login',
				{
				    username: $("#user_login").val(),
				    password: hex_md5( $("#user_pass").val() ),
				},
				function (data) {
					console.log(data);
					var result =eval("("+data+")");
					result =eval("("+result+")");
					console.log(result);
					console.log(result.code);
				    if ($.trim(result.code) != "0") {
				        logtips(result.msg);
				    }
				    else {
				        logtips("登陆成功，跳转中...");
				        location.reload();                     
                    }
				}
			);
	    })
		
		$('.signupsubmit-loader').on('click', function(){
			if( !is_name($("#user_register").val()) ){
				logtips('用户名只能由字母数字或下划线组成的3-16位字符')
				return
			}
			
            if( !is_mail($("#user_email").val()) ){
                logtips('邮箱格式错误')
                return
            }

            /*if( $("#password").val().length < 6 ){
                logtips('密码太短，至少6位')
                return
            }*/
			logtips("注册中，请稍等...");
			$('.signupsubmit-loader').attr("disabled",true);
			var params ={username:$("#user_register").val(), code:$("#captcha").val(),email:$("#user_email").val()};
			$.post( SITE_URL + "/register",params,function(data){
					data =eval("("+data+")");
				    if ($.trim(data.code) == "0") {
						$("#user_register").val('');
						$("#user_email").val('');
						$("#captcha").val('');
				        logtips("注册成功，请登录");
				    }
				    else {
				        logtips(data.msg);
						$('.signupsubmit-loader').attr("disabled",false);
				    }
				}
			);										   
		})
		
		$('.captcha-clk').bind('click',function(){
			if( !is_mail($("#user_email").val()) ){
				logtips('邮箱格式错误')
				return
			}
			
			var captcha = $(this);
			if(captcha.hasClass("disabled")){
				logtips('您操作太快了，等等吧')
			}else{
				captcha.addClass("disabled");
				captcha.html("发送中...");
				var params ={email: $("#user_email").val()};
				$.post( SITE_URL + "/validatecode",params,function(data){
					data =eval("("+data+")");
					if($.trim(data.code) == "0"){
						logtips('已发送验证码至邮箱，可能会出现在垃圾箱里哦~')
						var countdown=60; 
						settime()
						function settime() { 
							if (countdown == 0) { 
								captcha.removeClass("disabled");   
								captcha.html("发送验证码");
								countdown = 60; 
								return;
							} else { 
								captcha.addClass("disabled");
								captcha.html("重新发送(" + countdown + ")"); 
								countdown--; 
							} 
							setTimeout(function() { settime() },1000) 
						}

					}else if($.trim(data.code) == "-1"){
						logtips('邮箱已存在')
						captcha.html("发送验证码");
						captcha.removeClass("disabled"); 
					}else{
						logtips('验证码发送失败，请稍后重试')
						captcha.html("发送验证码");
						captcha.removeClass("disabled"); 
					}
				    },"json");
				/*
				$.post(
					jsui.uri+'/action/captcha.php?'+Math.random(),
					{
						action: "xiaoyaole_captcha",
						email:$("#user_email").val()
					},
					function (data) {
						if($.trim(data) == "1"){
							logtips('已发送验证码至邮箱，可能会出现在垃圾箱里哦~')
							var countdown=60; 
							settime()
							function settime() { 
								if (countdown == 0) { 
									captcha.removeClass("disabled");   
									captcha.html("发送验证码");
									countdown = 60; 
									return;
								} else { 
									captcha.addClass("disabled");
									captcha.html("重新发送(" + countdown + ")"); 
									countdown--; 
								} 
								setTimeout(function() { settime() },1000) 
							}
	
						}else if($.trim(data) == "2"){
							logtips('邮箱已存在')
							captcha.html("发送验证码");
							captcha.removeClass("disabled"); 
						}else{
							logtips('验证码发送失败，请稍后重试')
							captcha.html("发送验证码");
							captcha.removeClass("disabled"); 
						}
					}
				);
				*/
			}
		});

		var _loginTipstimer
		function logtips(str){
		    if( !str ) return false
		    _loginTipstimer && clearTimeout(_loginTipstimer)
		    $('.sign-tips').html(str).animate({
		        height: 29
		    }, 220)
		    _loginTipstimer = setTimeout(function(){
		        $('.sign-tips').animate({
		            height: 0
		        }, 220)
		    }, 5000)
		}
