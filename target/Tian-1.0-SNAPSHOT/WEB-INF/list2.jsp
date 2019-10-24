<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/23
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <ul class="goods_list fl">
        <c:forEach var="fg" items="${list2}">
            <li>
                <h4><a href="#">${fg.title}</a></h4>
                <a href="/Tian/goods/show?id=${fg.id}"><img src="/Tian/images/${fg.imapath}"></a>
                <div class="prize">￥${fg.price}</div>
            </li>


        </c:forEach>

        <%--<li>
            <h4><a href="#">葡萄</a></h4>
            <a href="/Tian/goods/show"><img src="/Tian/images/goods/goods002.jpg"></a>
            <div class="prize">¥ 5.50</div>
        </li>
        <li>
            <h4><a href="#">柠檬</a></h4>
            <a href="/Tian/goods/show"><img src="/Tian/images/goods/goods001.jpg"></a>
            <div class="prize">¥ 3.90</div>
        </li>
        <li>
            <h4><a href="#">奇异果</a></h4>
            <a href="/Tian/goods/show"><img src="/Tian/images/goods/goods012.jpg"></a>
            <div class="prize">¥ 25.80</div>
        </li>--%>
    </ul>



</div>