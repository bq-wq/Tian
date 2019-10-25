
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-登录</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">

	<script src="../js/jquery-1.12.4.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="../js/register.js"></script>
	<%@ page contentType="text/html;charset=UTF-8" language="java" %>

</head>



<script type="text/javascript">


	var username = false;
	var vcode1 = false;


    function refreshCode04(a){
        //刷新验证码
        a.src="${pageContext.request.contextPath}/user/test2?"+new Date().getTime();
    }



     $(function () {

         $("#vcode").change(function () {
             $.get("${pageContext.request.contextPath}/user/test3", "valcode=" + this.value, function (data) {
                 if (data == 1) {
                     $('#vcode').html("验证码错误!").css("color", "red");
                     $("#login").Attr("disabled",true);
                     vcode1=false;
                 } else {
                     $('#vcode').html("ok");
                     vcode1= true;


                 }
             })
         })


	$("#login").click(function () {
	    if(vcode1==true){
	        $.ajax({
				url:"${pageContext.request.contextPath}/user/login",
				type:"POST",
				data:$("#myform").serialize(),
				contentType:"application/x-www-form-urlencoded",
				success:function (status) {
					if(status==1){
					    alert("登陆成功")
                        location.href="${pageContext.request.contextPath}/WEB-INF/login.jsp";
                    }else {
					    alert("登陆失败！")
                    }
                }
			})
		}

    })
     })

</script>





<body>
	<div class="login_top clearfix">
		<a href="../index.jsp" class="login_logo"><img src="${pageContext.request.contextPath}/images/logo02.png"></a>
	</div>

	<div class="login_form_bg">
		<div class="login_form_wrap clearfix">
			<div class="login_banner fl"></div>
			<div class="slogan fl">日夜兼程 · 急速送达</div>
			<div class="login_form fr">
				<div class="login_title clearfix">
					<h1>用户登录</h1>
					<a href="${pageContext.request.contextPath}/user/regist">立即注册</a>
				</div>
				<div class="form_input">
					<form action="${pageContext.request.contextPath}/user/login" method="post">
						<input type="text" name="username" class="name_input" placeholder="请输入用户名" id="user_name">
						<div class="user_error">输入错误</div>
						<input type="password" name="password" class="pass_input" placeholder="请输入密码">
						<div class="pwd_error">输入错误</div>



						<div style="position: absolute;left: 0;top: 120px;">
							<img onclick="refreshCode04(this);" src="${pageContext.request.contextPath}/user/test2">
							<input style="background: #fdfdfd;height: 25px;width: 100px;vertical-align: middle;"
								   id="vcode"  name="valcode" />
						</div>

						<div class="more_input clearfix">
							<input type="checkbox" name="">
							<label>记住用户名</label>
							<a href="#">忘记密码</a>
						</div>
						<input type="submit" name="" value="登录" class="input_submit" id="login">
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="footer no-mp">
		<div class="foot_link">
			<a href="#">关于我们</a>
			<span>|</span>
			<a href="#">联系我们</a>
			<span>|</span>
			<a href="#">招聘人才</a>
			<span>|</span>
			<a href="#">友情链接</a>		
		</div>
		<p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888    京ICP备*******8号</p>
	</div>
	
</body>
</html>