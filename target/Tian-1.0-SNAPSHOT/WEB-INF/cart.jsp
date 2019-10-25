<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-购物车</title>
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
</head>

<script type="text/javascript">
    //function pNum(pid,p,no){
      //  $.ajax({
        //    url:"cartservlet?method=addCartAjax&goodsId="+pid+"&number=1",
         //   type:"get",
           // success:function(){
           //     location.href = "cartservlet?method=getCart";
          //  },
         //   error:function(){
          //      alert("服务器异常");
         //   }
      //  })
   // }
    function mNum(pid,p,no){
        var num = -1; //数量
        var nums = $("#num_count"+no).val();
        if(Number(nums)<=1){
            if(confirm("确认要删除吗?")){
                num = 0;
            }else{
                return;
            }
        }
        $.ajax({
            url:"cartservlet?method=addCartAjax&goodsId="+pid+"&number="+num,
            method:"get",
            success:function(){
                location.href = "cartservlet?method=getCart";
            },
            error:function(){
                alert("服务器异常");
            }
        })
    }
    function deleteCart(pid){
        if(confirm("确认要删除吗")){
            $.ajax({
                url:"cartservlet?method=addCartAjax&goodsId="+pid+"&number=0",
                method:"get",
                success:function(){
                    location.href = "cartservlet?method=getCart";
                },
                error:function(){
                    alert("服务器异常");
                }
            })
        }
    }

    function clearCart(){
        if(confirm("确定要清空吗")){
            $.ajax({
                url:"cartservlet?method=clearCartAjax",
                method:"get",
                success:function(){
                    location.href = "cartservlet?method=getCart";
                },
                error:function(){
                    alert("服务器异常");
                }
            })
        }
    }
</script>




<body>
	<div class="header_con">
		<div class="header">
			<div class="welcome fl">欢迎来到天天生鲜!</div>
			<div class="fr">
				<div class="login_info fl">
					欢迎您：<em>张 山</em>
				</div>
				<div class="login_btn fl">
					<a href="login.jsp">登录</a>
					<span>|</span>
					<a href="register.jsp">注册</a>
				</div>
				<div class="user_link fl">
					<span>|</span>
					<a href="user_center_info.jsp">用户中心</a>
					<span>|</span>
					<a href="cart.jsp">我的购物车</a>
					<span>|</span>
					<a href="user_center_order.jsp">我的订单</a>
				</div>
			</div>
		</div>		
	</div>

	<div class="search_bar clearfix">
		<a href="../index.jsp" class="logo fl"><img src="../images/logo.png"></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
		<div class="search_con fr">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>		
	</div>

	<div class="total_count">全部商品<em>2</em>件</div>	
	<ul class="cart_list_th clearfix">
		<li class="col01">商品名称</li>
		<li class="col02">商品单位</li>
		<li class="col03">商品价格</li>
		<li class="col04">数量</li>
		<li class="col05">小计</li>
		<li class="col06">操作</li>
	</ul>
	<c:forEach var="fg" items="${list}">
		<ul class="cart_list_td clearfix">
			<li class="col01"><input type="checkbox" name="" checked></li>
			<li class="col02"><img src="../images/${fg.imapath}"></li>
			<li class="col03">${fg.name}<br><em>25.80元/500g</em></li>
			<li class="col04">500g</li>
			<li class="col05">${fg.price/fg.num}元</li>
			<li class="col06">
				<div class="num_add">
					<a href="javascript:;" class="add fl">+</a>
					<input type="text" class="num_show fl" value="${fg.num}">
					<a href="javascript:;" class="minus fl">-</a>
				</div>
			</li>
			<li class="col07">${fg.price}元</li>
			<li class="col08"><a href="javascript:;">删除</a></li>
		</ul>
	</c:forEach>



	<%--<ul class="cart_list_td clearfix">
		<li class="col01"><input type="checkbox" name="" checked></li>
		<li class="col02"><img src="../images/goods/goods012.jpg"></li>
		<li class="col03">奇异果<br><em>25.80元/500g</em></li>
		<li class="col04">500g</li>
		<li class="col05">25.80元</li>
		<li class="col06">
			<div class="num_add">
				<a href="javascript:;" class="add fl">+</a>
				<input type="text" class="num_show fl" value="1">	
				<a href="javascript:;" class="minus fl">-</a>	
			</div>
		</li>
		<li class="col07">25.80元</li>
		<li class="col08"><a href="javascript:;">删除</a></li>
	</ul>

	<ul class="cart_list_td clearfix">
		<li class="col01"><input type="checkbox" name="" checked></li>
		<li class="col02"><img src="../images/goods/goods003.jpg"></li>
		<li class="col03">大兴大棚草莓<br><em>16.80元/500g</em></li>
		<li class="col04">500g</li>
		<li class="col05">16.80元</li>
		<li class="col06">
			<div class="num_add">
				<a href="javascript:;" class="add fl">+</a>
				<input type="text" class="num_show fl" value="1">	
				<a href="javascript:;" class="minus fl">-</a>	
			</div>
		</li>
		<li class="col07">16.80元</li>
		<li class="col08"><a href="javascript:;">删除</a></li>
	</ul>
	--%>

	<ul class="settlements">
		<li class="col01"><input type="checkbox" name="" checked=""></li>
		<li class="col02">全选</li>
		<li class="col03">合计(不含运费)：<span>¥</span><em>42.60</em><br>共计<b>2</b>件商品</li>
		<li class="col04"><a href="place_order.jsp">去结算</a></li>
	</ul>

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