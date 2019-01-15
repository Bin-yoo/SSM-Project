<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用户商城</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/users.css">
</head>
<body>
    <div class="container-fluid">
        <div class="header">
            <div class="shop_title">
                <a href="good/index"><h3>弟中弟商店-校园宅基送</h3></a>
            </div>
            <div class="search">
                <form action="#" class="search_form">
                    <input type="text" class="search_input" placeholder="搜索">
                    <button class="search_button"><i class="glyphicon glyphicon-search"></i></button>
                </form>
            </div>
        </div>
        <div class="container-fluid mt">
            <div class="aside">
               <div class="user">
                	<c:if test="${not empty sessionScope.customer}">
                		<h4>
	                    	你好，用户${sessionScope.customer.customerTrueName}
	                    </h4>
                	</c:if>
                	<c:if test="${empty sessionScope.customer}">
                		<h4>
	                    	你好，请 <a href="login.jsp">登录</a>
	                    </h4>
                	</c:if>
                    <div class="controller">
                    	<c:if test="${not empty sessionScope.customer}">
	                		<span><a href="user/logout">注销用户</a></span>
	                	</c:if>
	                	<c:if test="${empty sessionScope.customer}">
	                		<span><a href="register.jsp">注册账号</a></span>
	                	</c:if>
                        <span><a href="shopCart/viewShopCart">个人中心</a></span>
                    </div>
                </div>
                <div class="menu">
                    <ul class="shop_list">
                        <li><a href="shopCart/viewShopCart">我的购物车</a></li>
                        <li class="active"><a href="order/allOrder">所有订单</a></li>
                        <li><a href="order/withgoods?orderState=0">待发货</a></li>
                        <li><a href="order/withaccept?orderState=2">待收货</a></li>
                    </ul>
                </div>
            </div>
            <div class="main">
                <div class="container">
                    <span class="tab">所有订单</span>
                    <div class="userbox">
                        <div class="table_th not">
                            <div class="th th-item">商品信息</div>
                            <div class="th th-price">单价</div>
                            <div class="th th-amount">数量</div>
                            <div class="th th-sum">金额</div>
                            <div class="th th-sta">订单状态</div>
                            <div class="th th-op">操作</div>
                        </div>
                    </div>
                    <div class="order_list">
                    	<c:forEach items="${orderList}" var="order">
	                        <div class="item">
	                            <ul class="item-content">
	                                <li class="td td-item">
	                                    <div class="item_img">
	                                        <a href="good/goodsdetail?goodsID=${order.goodsID}"><img src="${order.goodsImageUrl}" alt=""></a>
	                                    </div>
	                                    <div class="item_title">
	                                        <a href="good/goodsdetail?goodsID=${order.goodsID}">${order.goodsName}</a>
	                                    </div>
	                                </li>
	                                <li class="td td-price">￥${order.orderPrice }</li>
	                                <li class="td td-amount">
	                                    <input type="text" name="amount" value="x${order.goodCount }" style="width:40px;text-align: center;" class="btn" disabled="disabled">
	                                </li>
	                                <li class="td td-sum">￥${order.totalMoney}</li>
	                                <li class="td td-sta">
	                                	<c:if test="${order.orderState == '0'.charAt(0)}">
	                                		未发货
	                                	</c:if>
	                                	<c:if test="${order.orderState == '1'.charAt(0)}">
	                                		已发货
	                                	</c:if>
	                                	<c:if test="${order.orderState == '2'.charAt(0)}">
	                                		已收货
	                                	</c:if>
                               	 	</li>
	                                <li class="td td-op">
	                                	<c:if test="${order.orderState == '0'.charAt(0)}">
	                                		<a class="btn btn-danger">收货</a>
	                                	</c:if>
	                                	<c:if test="${order.orderState == '1'.charAt(0)}">
	                                		<a class="btn btn-danger">收货</a>
	                                	</c:if>
	                                	<c:if test="${order.orderState == '2'.charAt(0)}">
	                                		<p>已签收</p>
	                                	</c:if>
	                                </li>
	                            </ul>
	                        </div>
                    	</c:forEach>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>