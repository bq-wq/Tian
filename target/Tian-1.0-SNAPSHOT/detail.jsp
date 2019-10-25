<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-商品详情</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	</head>
<body>
	<div class="header_con">
		<div class="header">
			<div class="welcome fl">欢迎来到天天生鲜!</div>
			<div class="fr">
				<div class="login_info fl">
					欢迎您：<em>张 山</em>
				</div>
				<div class="login_btn fl">
					<a href="WEB-INF/login.jsp">登录</a>
					<span>|</span>
					<a href="WEB-INF/register.jsp">注册</a>
				</div>
				<div class="user_link fl">
					<span>|</span>
					<a href="WEB-INF/user_center_info.jsp">用户中心</a>
					<span>|</span>
					<a href="WEB-INF/cart.jsp">我的购物车</a>
					<span>|</span>
					<a href="WEB-INF/user_center_order.jsp">我的订单</a>
				</div>
			</div>
		</div>		
	</div>

	<div class="search_bar clearfix">
		<a href="index.jsp" class="logo fl"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
		<div class="search_con fl">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>
		<div class="guest_cart fr">
			<a href="WEB-INF/cart.jsp" class="cart_name fl">我的购物车</a>
			<div class="goods_count fl" id="show_count">1</div>
		</div>
	</div>

	<div class="navbar_con">
		<div class="navbar clearfix">
			<div class="subnav_con fl">
				<h1>全部商品分类</h1>	
				<span></span>			
				<ul class="subnav">
					<li><a href="#" class="fruit">新鲜水果</a></li>
					<li><a href="#" class="seafood">海鲜水产</a></li>
					<li><a href="#" class="meet">猪牛羊肉</a></li>
					<li><a href="#" class="egg">禽类蛋品</a></li>
					<li><a href="#" class="vegetables">新鲜蔬菜</a></li>
					<li><a href="#" class="ice">速冻食品</a></li>
				</ul>
			</div>
			<ul class="navlist fl">
				<li><a href="">首页</a></li>
				<li class="interval">|</li>
				<li><a href="">手机生鲜</a></li>
				<li class="interval">|</li>
				<li><a href="">抽奖</a></li>
			</ul>
		</div>
	</div>

	<div class="breadcrumb">
		<a href="#">全部分类</a>
		<span>></span>
		<a href="#">新鲜水果</a>
		<span>></span>
		<a href="#">商品详情</a>
	</div>

	<div class="goods_detail_con clearfix">
		<div class="goods_detail_pic fl"><img src="../images/${goods.imgPath}"></div>

		<div class="goods_detail_list fr">
			<h3>${goods.name}</h3>
			<p>${goods.intro}</p>
			<div class="prize_bar">
				<span class="show_pirze">¥<em>${goods.price}</em></span>
				<span class="show_unit">单  位：500g</span>
			</div>
			<div class="goods_num clearfix">
				<div class="num_name fl">数 量：</div>
				<div class="num_add fl">
					<input type="text" class="num_show fl" value="1" id="number">
					<a href="javascript:;" class="add fr" id="numadd">+</a>
					<a href="javascript:;" class="minus fr" id="numsub">-</a>
				</div>
				<script type="text/javascript">


					$("#numadd").click(function () {
						var num1=0;
						var value = $("#number").val();
						num1=parseInt(value)+1;
						$("#number").attr("value",num1)
                    })
					$("#numsub").click(function () {
						var num2=0;
						var val = $("#number").val();
						num2 = parseInt(val)-1;
						if(num2 < 1){
						    num2=1;
						}
						$("#number").attr("value",num2);
                    })
				</script>


			</div>
			<div class="total">总价：<em>${goods.price}元</em></div>
			<div class="operate_btn">
				<a href="javascript:;" class="buy_btn">立即购买</a>
				<a href="${pageContext.request.contextPath}/cart/addcart?pid=${goods.id}&num=1&uid=${48};" class="add_cart" id="add_cart">加入购物车</a>
			</div>
		</div>
	</div>

	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul>
						<c:forEach var="fg" items="${goods2}">
						<li>
							<a href="${pageContext.request.contextPath}/goods/show?id=${fg.id}">
								<img src="${pageContext.request.contextPath}/images/${fg.imapath}" /></a>
							<h4><a href="#">${fg.title}</a></h4>
							<div class="prize">￥${fg.price}</div>
						</li>
						</c:forEach>
					<%--<li>
					<a href="#"><img src="../images/goods/goods001.jpg"></a>
						<h4><a href="#">进口柠檬</a></h4>
						<div class="prize">￥3.90</div>
					</li>
					<li>
						<a href="#"><img src="../images/goods/goods002.jpg"></a>
						<h4><a href="#">玫瑰香葡萄</a></h4>
						<div class="prize">￥16.80</div>
					</li>--%>
				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<ul class="detail_tab clearfix">
				<li class="active">商品介绍</li>
				<li>评论</li>
			</ul>

			<div class="tab_content">
				<dl>
					<dt>商品详情：</dt>
					<dd>${goods.intro} </dd>
				</dl>
			</div>

		</div>
	</div>

	<div class="footer">
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
	<div class="add_jump"></div>

<%--	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.2.js"></script>
	<script type="text/javascript">
		var $add_x = $('#add_cart').offset().top;
		var $add_y = $('#add_cart').offset().left;

		var $to_x = $('#show_count').offset().top;
		var $to_y = $('#show_count').offset().left;

		$(".add_jump").css({'left':$add_y+80,'top':$add_x+10,'display':'block'})
		$('#add_cart').click(function(){
			$(".add_jump").stop().animate({
				'left': $to_y+7,
				'top': $to_x+7},
				"fast", function() {
					$(".add_jump").fadeOut('fast',function(){
						$('#show_count').html(2);
					});

			});
		})
	</script>--%>
	
</body>
</html>