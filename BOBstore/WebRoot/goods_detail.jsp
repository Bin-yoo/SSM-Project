
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
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>弟中弟商店-校园宅基送</title>

    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/owl.theme.default.css"/>
    <link rel="stylesheet" type="text/css" href="./css/index.css">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/index.js"></script>
   <script type="text/javascript">
  	$(function(){
			var Count = $('#Count');
			var Stock = $('#Stock');
			$('#reduce').click(function(){
				if(parseInt(Count.val()) > 1){
					Count.val(parseInt(Count.val())-1)
				}	
			})
			$('#add').click(function(){
				if(parseInt(Count.val()) < parseInt(Stock.val())){
					Count.val(parseInt(Count.val())+1)
				}
			})
			
			Count.blur(function(){
				if(parseInt(Count.val()) < 1){
					parseInt(Count.val(1));
				}if(isNaN(Count.val())){
					parseInt(Count.val(1));
				}if(parseInt(Count.val()) > parseInt(Stock.val())){
					parseInt(Count.val(parseInt(Stock.val())));
				}
				
			})
			
		});
   </script>
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
                        <li class="hotpush"><a href="good/index">热门推荐</a></li>
                        <li>
                            <p class="shop_list_title">酒水饮料</p>
                            <ul class="extraMenu">
                            	
									<li><a href="good/viewgoods?detailedTypeID=1">啤酒风味</a></li>
									<li><a href="good/viewgoods?detailedTypeID=2">中国精酿</a></li>
									<li><a href="good/viewgoods?detailedTypeID=3">各国精酿</a></li>
									<li><a href="good/viewgoods?detailedTypeID=4">果汁饮料</a></li>
                                
                            </ul>
                        </li>
                        <li>
                            <p class="shop_list_title">咖啡冲饮</p>
                            <ul class="extraMenu">
                            	
									<li><a href="good/viewgoods?detailedTypeID=5">速溶咖啡</a></li>
									<li><a href="good/viewgoods?detailedTypeID=6">固体饮料</a></li>
                                 
                            </ul>
                        </li>
                        <li>
                            <p class="shop_list_title">糖果系列</p>
                            <ul class="extraMenu">
									<li ><a href="good/viewgoods?detailedTypeID=7">软糖</a></li>

									<li ><a href="good/viewgoods?detailedTypeID=8">奶片</a></li>

									<li ><a href="good/viewgoods?detailedTypeID=9">果冻</a></li>

									<li ><a href="good/viewgoods?detailedTypeID=10">硬糖</a></li>

									<li ><a href="good/viewgoods?detailedTypeID=11">巧克力</a></li>
                               
                            </ul>
                        </li>
                        <li>
                            <p class="shop_list_title">零食糕点</p>
                            <ul class="extraMenu">
                            	
	                                <li ><a href="good/viewgoods?detailedTypeID=12">曲奇饼干</a></li>
	                                <li ><a href="good/viewgoods?detailedTypeID=13">西式糕点</a></li>
	                                <li ><a href="good/viewgoods?detailedTypeID=14">传统糕点</a></li>
	                                <li ><a href="good/viewgoods?detailedTypeID=15">膨化食品</a></li>
	                                <li><a href="good/viewgoods?detailedTypeID=16">辣条</a></li>
                                
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
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-2">
                            <div class="goodbox">
                            	<c:forEach items="${viewGoodsList}" var="goods">
                                	<div class="good_img">
                                    	<img src="${goods.goodsImageUrl}" alt="">
                                	</div>
                                	<div class="goods_detail">
                                    	<div class="goods_detail_title">
                                        	<h4>${goods.goodsName}</h4>
                                    	</div>
                                    	<div class="goods_detail_price">
                                    		<input type="hidden" value="${goods.goodsInCount - goods.goodsSellCount}" id="Stock" />
                        
                                        	<p>价格:<span class="price">${goods.goodsDiscountPrice}</span></p>
                                        	
                                        	<p>原价:<span class="p"><s>${goods.goodsPrice}</s></span></p>
                                    	</div>
                                    	<div class="goods_detail_fare">
                                        	配送费:<span class="fare">免配送费</span>
                                    	</div>
                                    	<div class="goods_detail_sellcount">
                                       	 已卖出: <span class="sellcount">${goods.goodsSellCount}</span>
                                    	</div>
                                   		<div class="goods_detail_sum">
                                   			<c:if test="${goods.goodsInCount - goods.goodsSellCount == 0}">
                                   				已售完
                                   			</c:if>
                                   			<c:if test="${goods.goodsInCount - goods.goodsSellCount != 0}">
                                   				数量: <span class="sellcount">
			                                            <button type="button" class="btn btn-default" id="reduce">-</button>
			                                        	<input type="text" name="goodsInCount" value="1" id="Count" style="max-width:80px;text-align: center;" class="btn">
			                                        	<button type="button" class="btn btn-default" id="add">+</button>
			                                        </span>
                                        		库存: ${goods.goodsInCount - goods.goodsSellCount}件
                                   			</c:if>
                                    </div>
                                    <div class="buy">
                                        <a type="button" class="btn btn-success">立即购买</a>
                                        <button type="button" class="btn btn-danger">加入购物车</button>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="goods_des">
                        <div class="panel panel-default">
                        	<c:forEach items="${viewGoodsList}" var="goods">
                            <div class="panel-heading">
                               	 商品详情
                            </div>
                            <div class="des">
                                <p>${goods.goodsDescript}</p>
                                <img src="${goods.goodsImageUrl}" alt="">
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>