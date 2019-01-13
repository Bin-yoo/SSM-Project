<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <title>弟中弟商店-校园宅基送</title>

    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/owl.theme.default.css"/>
    <link rel="stylesheet" type="text/css" href="./css/index.css">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/index.js"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="header">
            <div class="shop_title">
                <a href="good/index"><h3>弟中弟商店-校园宅基送</h3></a>
            </div>
            <div class="search">
                <form action="#" class="search_form">
                    <input type="text" class="search_input" placeholder="搜索商品">
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
	                		<span><a href="login.jsp">用户登陆</a></span>
	                		<span><a href="register.jsp">注册账号</a></span>
	                	</c:if>
                        <br>
                        <span><a href="">账号管理</a></span>
                        <span><a href="">我的商城</a></span>
                    </div>
                </div>
                <div class="menu">
                    <ul class="shop_list">
                        <li class="active_li"><a href="">热门推荐</a></li>
                        <li>
                            <p class="shop_list_title">酒水饮料</p>
                            <ul class="extraMenu">
                                <li><a href="/BOBstore/good/viewgoods?detailedTypeID=1">啤酒风味</a></li>
                                <li><a href="/BOBstore/good/viewgoods?detailedTypeID=2">中国精酿</a></li>
                                <li><a href="/BOBstore/good/viewgoods?detailedTypeID = 3">各国精酿</a></li>
                                <li><a href="/BOBstore/good/viewgoods?detailedTypeID = 4">果汁饮料</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="shop_list_title">咖啡冲饮</p>
                            <ul class="extraMenu">
                                <li><a href="/good/viewgoods?detailedTypeID = 5">速溶咖啡</a></li>
                                <li><a href="/good/viewgoods?detailedTypeID = 6">固体饮料</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="shop_list_title">糖果系列</p>
                            <ul class="extraMenu">
                                <li><a href="/good/viewgoods?detailedTypeID = 7">软糖</a></li>
                                <li><a href="/good/viewgoods?detailedTypeID = 8">奶片</a></li>
                                <li><a href="/good/viewgoods?detailedTypeID = 9">果冻</a></li>
                                <li><a href="/good/viewgoods?detailedTypeID = 10">硬糖</a></li>
                                <li><a href="/good/viewgoods?detailedTypeID = 11">巧克力</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="shop_list_title">零食糕点</p>
                            <ul class="extraMenu">
                                <li><a href="/good/viewgoods?detailedTypeID = 12">曲奇饼干</a></li>
                                <li><a href="/good/viewgoods?detailedTypeID = 13">西式糕点</a></li>
                                <li><a href="/good/viewgoods?detailedTypeID = 14">传统糕点</a></li>
                                <li><a href="/good/viewgoods?detailedTypeID = 15">膨化食品</a></li>
                                <li><a href="/good/viewgoods?detailedTypeID = 16">辣条</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="shop_cart">
                    <i class="glyphicon glyphicon-shopping-cart" style="color:#0094FF;"></i>
                    <a href="#">购物车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge">3</span></a>
                    <span class="shop_cart_total">¥200</span>
                </div>
            </div>
            <div class="main">
                <div class="container">
                    <div class="theory">
                        <div class="owl-carousel owl-theme">
                            <c:forEach items="${bannerList}" var="banner">
                    			<img src="${banner.goodsImageUrl}">
                    		</c:forEach>
                        </div>
                        
                    </div>
                   
                    <span class="tab">全部热销</span>
                    <hr>
                    <div class="goodsbox">
                        <dl class="goodslist">
                        	<c:forEach items="${popularGoodsList}" var="popularGoods">
                            	<dt class="item" >
                                	<div class="img">
                                    	<a href="good/goodsdetail?goodsID=${popularGoods.goodsID}"><img src="${popularGoods.goodsImageUrl}"></a>
                                	</div>
                                	<div class="text">
                                    	<p class="g_title"><a href="good/goodsdetail?goodsID=${goods.goodsID}">${popularGoods.goodsName}</a></p>
                                    	<p class="g_price">￥
                                    	<span class="pri">${popularGoods.goodsPrice}</span>
                                    	<span class="num">${popularGoods.goodsSellCount}已销售</span>
                                    	</p>
                                	</div>
                            	</dt>
                            </c:forEach>
                        </dl>
                    </div>
                    <span class="tab">热销酒水</span>
                    <hr>
                    <div class="goodsbox">
                        <dl class="goodslist">
                        	<c:forEach items="${popularWineList}" var="popularWine">
                        	
                            	<dt class="item" >
                                	<div class="img">
                                    	<img src="${popularWine.goodsImageUrl}">
                                	</div>
                                	<div class="text">
                                    	<p class="g_title">${popularWine.goodsName}</p>
                                    	<p class="g_price">￥
                                    	<span class="pri">${popularWine.goodsPrice}</span>
                                    	<span class="num">${popularWine.goodsSellCount}已销售</span>
                                    	</p>
                                	</div>
                            	</dt>
                            </c:forEach>
                        </dl>
                    </div>
                    <span class="tab">热销糖果</span>
                    <hr>
                    <div class="goodsbox">
                        <dl class="goodslist">
                            <c:forEach items="${popularCandyList}" var="popularCandy">
                        	
                            	<dt class="item" >
                                	<div class="img">
                                    	<img src="${popularCandy.goodsImageUrl}">
                                	</div>
                                	<div class="text">
                                    	<p class="g_title">${popularCandy.goodsName}</p>
                                    	<p class="g_price">￥
                                    	<span class="pri">${popularCandy.goodsPrice}</span>
                                    	<span class="num">${popularCandy.goodsSellCount}已销售</span>
                                    	</p>
                                	</div>
                            	</dt>
                            </c:forEach>
                        </dl>
                    </div>
                    <span class="tab">热销零食</span>
                    <hr>
                    <div class="goodsbox">
                        <dl class="goodslist">
                            <c:forEach items="${popularSnacksList}" var="popularSnacks">
                        	
                            	<dt class="item" >
                                	<div class="img">
                                    	<img src="${popularSnacks.goodsImageUrl}">
                                	</div>
                                	<div class="text">
                                    	<p class="g_title">${popularSnacks.goodsName}</p>
                                    	<p class="g_price">￥
                                    	<span class="pri">${popularSnacks.goodsPrice}</span>
                                    	<span class="num">${popularSnacks.goodsSellCount}已销售</span>
                                    	</p>
                                	</div>
                            	</dt>
                            </c:forEach>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>