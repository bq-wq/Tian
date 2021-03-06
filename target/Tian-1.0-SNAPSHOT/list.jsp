<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-商品列表</title>
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
			<a href="#" class="cart_name fl">我的购物车</a>
			<div class="goods_count fl">1</div>
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
	</div>

	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul>
					<c:forEach var="fg" items="${goods1}">
						<li>
							<a href="${pageContext.request.contextPath}/goods/show?id=${fg.id}"><img src="${pageContext.request.contextPath}/images/${fg.imapath}"></a>
							<h4><a href="#">${fg.title}</a></h4>
							<div class="prize">￥${fg.price}</div>
						</li>
					</c:forEach>
					<%----%>
					<%--<li>--%>
						<%--<a href="#"><img src="${pageContext.request.contextPath}/images/goods/goods001.jpg"></a>--%>
						<%--<h4><a href="#">进口柠檬</a></h4>--%>
						<%--<div class="prize">￥3.90</div>--%>
					<%--</li>--%>


					<%--<li>
						<a href="#"><img src="${pageContext.request.contextPath}/images/goods/goods002.jpg"></a>
						<h4><a href="#">玫瑰香葡萄</a></h4>
						<div class="prize">￥16.80</div>
					</li>--%>
				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<div class="sort_bar">
				<a href="#" class="active">默认</a>
				<a href="${pageContext.request.contextPath}/goods1/showall?pageNum=${pageBean.pageNum}&pageSize=${pageBean.pageSize}&price=sd">价格</a>
				<a href="#">人气</a>
			</div>

			<ul class="goods_type_list clearfix">

				<c:forEach var="fg" items="${pageBean.list}">
				<li>
					<a href="${pageContext.request.contextPath}/goods/show?id=${fg.id}"><img src="${pageContext.request.contextPath}/images/${fg.imapath}"></a>
					<h4><a href="${pageContext.request.contextPath}/goods/show?id=${fg.id}">${fg.title}</a></h4>
					<div class="operate">
						<span class="prize">￥${fg.price}</span>
						<span class="unit">${fg.price/2}/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>
				</c:forEach>
			</ul>

			<%--	<li>
					<a href="#"><img src="images/goods/goods004.jpg"></a>
					<h4><a href="#">吐鲁番梨光杏</a></h4>
					<div class="operate">
						<span class="prize">￥5.50</span>
						<span class="unit">5.50/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>

				<li>
					<a href="#"><img src="images/goods/goods005.jpg"></a>
					<h4><a href="#">黄肉桃</a></h4>
					<div class="operate">
						<span class="prize">￥10.00</span>
						<span class="unit">10.00/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>

				<li>
					<a href="#"><img src="images/goods/goods006.jpg"></a>
					<h4><a href="#">进口西梅</a></h4>
					<div class="operate">
						<span class="prize">￥28.80</span>
						<span class="unit">28.8/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>

				<li>
					<a href="#"><img src="images/goods/goods007.jpg"></a>
					<h4><a href="#">香梨</a></h4>
					<div class="operate">
						<span class="prize">￥6.45</span>
						<span class="unit">6.45/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>

				<li>
					<a href="#"><img src="images/goods/goods008.jpg"></a>
					<h4><a href="#">栗子</a></h4>
					<div class="operate">
						<span class="prize">￥9.50</span>
						<span class="unit">9.50/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>

				<li>
					<a href="#"><img src="images/goods/goods009.jpg"></a>
					<h4><a href="#">海南香蕉</a></h4>
					<div class="operate">
						<span class="prize">￥3.30</span>
						<span class="unit">3.30/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>

				<li>
					<a href="#"><img src="images/goods/goods010.jpg"></a>
					<h4><a href="#">青苹果</a></h4>
					<div class="operate">
						<span class="prize">￥5.00</span>
						<span class="unit">5.00/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>

				<li>
					<a href="#"><img src="images/goods/goods011.jpg"></a>
					<h4><a href="#">山莓</a></h4>
					<div class="operate">
						<span class="prize">￥28.80</span>
						<span class="unit">28.8/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>

				<li>
					<a href="#"><img src="images/goods/goods012.jpg"></a>
					<h4><a href="#">奇异果</a></h4>
					<div class="operate">
						<span class="prize">￥25.80</span>
						<span class="unit">25.8/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>
				<li>
					<a href="#"><img src="images/goods/goods013.jpg"></a>
					<h4><a href="#">蜜桔</a></h4>
					<div class="operate">
						<span class="prize">￥4.80</span>
						<span class="unit">4.8/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>
				<li>
					<a href="#"><img src="images/goods/goods014.jpg"></a>
					<h4><a href="#">脐橙</a></h4>
					<div class="operate">
						<span class="prize">￥3.50</span>
						<span class="unit">3.50/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>
				<li>
					<a href="#"><img src="images/goods/goods001.jpg"></a>
					<h4><a href="#">进口柠檬</a></h4>
					<div class="operate">
						<span class="prize">￥3.90</span>
						<span class="unit">3.90/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>
				<li>
					<a href="#"><img src="images/goods/goods002.jpg"></a>
					<h4><a href="#">玫瑰香葡萄</a></h4>
					<div class="operate">
						<span class="prize">￥16.80</span>
						<span class="unit">16.80/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>--%>
			<%--</ul>--%>

			<div class="pagenation">
				<a href="${pageContext.request.contextPath}/goods1/showall?pageNum=${pageBean.pageNum-1}&pageSize=${pageBean.pageSize}">上一页</a>
				<a href="${pageContext.request.contextPath}/goods1/showall?pageNum=1&pageSize=${pageBean.pageSize}" class="active">1</a>
				<a href="${pageContext.request.contextPath}/goods1/showall?pageNum=2&pageSize=${pageBean.pageSize}">2</a>
				<%--<a href="${pageContext.request.contextPath}/goods1/showall?pageNum=3&pageSize=${pageBean.pageSize}">3</a>
				<a href="${pageContext.request.contextPath}/goods1/showall?pageNum=4&pageSize=${pageBean.pageSize}">4</a>
				<a href="${pageContext.request.contextPath}/goods1/showall?pageNum=5&pageSize=${pageBean.pageSize}">5</a>--%>
				<a href="${pageContext.request.contextPath}/goods1/showall?pageNum=${pageBean.pageNum+1}&pageSize=${pageBean.pageSize}">下一页></a>
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
	
</body>
</html>