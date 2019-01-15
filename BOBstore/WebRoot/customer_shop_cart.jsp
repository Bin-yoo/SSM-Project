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
    <title>用户商城</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/users.css">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
    	/* function setSum(){
   			var amount = $('#amount');
			var goodsPrice = $('#goodsPrice').text();
			var goodsDiscountPrice = $('#goodsDiscountPrice').text();
			var sum = 0;
			if(!isNaN(goodsDiscountPrice)){
				sum = amount.val() * goodsDiscountPrice;
			}
		} */
    	$(function(){
			var Amount = $('#Amount');
			var Stock = $('.Stock');
			
			$('.reduce').click(function(){
				if(parseInt(Amount.val()) > 1){
					Amount.val(parseInt(Amount.val())-1)
				}	
			})
			$('.add').click(function(){
				if(parseInt(Amount.val()) < parseInt(Stock.val())){
					Amount.val(parseInt(Amount.val())+1)
					
				}
			})
			
			amount.blur(function(){
				if(parseInt(Amount.val()) < 1){
					parseInt(Amount.val(1));
				}if(isNaN(Amount.val())){
					parseInt(Amount.val(1));
				}if(parseInt(Amount.val()) > parseInt(Stock.val())){
					parseInt(Amount.val(parseInt(Stock.val())));
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
                        <li class="active"><a href="shopCart/viewShopCart">我的购物车</a></li>
                        <li><a href="order/allOrder">所有订单</a></li>
                        <li><a href="">待发货</a></li>
                        <li><a href="">待收货</a></li>
                    </ul>
                </div>
            </div>
            <div class="main">
                <div class="container">
                    <span class="tab">我的购物车</span>
                    <div class="userbox">
                        <div class="table_th">
                            <div class="th th-chk">
                                <input type="checkbox" name="selectall" value="">
                                全选
                            </div>
                            <div class="th th-item">商品信息</div>
                            <div class="th th-price">单价</div>
                            <div class="th th-amount">数量</div>
                            <div class="th th-sum">金额</div>
                            <div class="th th-op">操作</div>
                        </div>
                    </div>
                    <div class="order_list">
                    	<c:forEach items="${shopcartList }" var="good">
                        <div class="item">	
                            <ul class="item-content">
                                <li class="td td-chk">
                                	
                                    <input type="checkbox" name="select" value="">
                                </li>
                                <li class="td td-item">
                                    <div class="item_img">
                                        <a href="good/goodsdetail?goodsID=${good.goodsID}"><img src="${good.goodsImageUrl}" alt=""></a>
                                    </div>
                                    <div class="item_title">
<<<<<<< HEAD
                                    	<input type="hidden" value="${good.goodsInCount - good.goodsSellCount}" id="Stock" hidden="hidden" />
                                        <a href="good/goodsdetail?goodsID=${good.goodsID}">${good.goodsName}</a>
=======
                                    	<input type="hidden" value="${good.goodsInCount - good.goodsSellCount}" class="Stock" id="Stock" hidden="hidden" />
                                        <a href="#">${good.goodsName}</a>
>>>>>>> b25c9ae66f07f2a924e5dc4a7aa3b6a5425e9aba
                                    </div>
                                </li>
                                <li class="td td-price">
                                	<c:if test="${empty good.goodsDiscountPrice}">
                  						￥ <span id="goodsPrice">${good.goodsPrice}</span>
                  					</c:if>
                  					<c:if test="${not empty good.goodsDiscountPrice}">
                  						￥ <span id="goodsDiscountPrice">${good.goodsDiscountPrice}</span>
                  					</c:if>
                                </li>
                                <li class="td td-amount">
                                    <button type="button"  class="btn btn-default reduce" id="reduce">-</button>
                                    <input type="text" name="amount" value="${good.goodCount }"  id="Amount" style="max-width:80px;text-align: center;" class="btn">
                                    <button type="button" class="btn btn-default add" id="add">+</button>
                                </li>
                                <li class="td td-sum">￥<span id="sum">159.00</span></li>
                                <li class="td td-op">
                                    <a href="#" class="btn btn-danger">删除</a>
                                </li>
                            </ul>
                        </div>
                        </c:forEach>
                    </div>
                    <div class="commit_order">
                        <div class="selectall">
                            <input type="checkbox" name="selectall" value="">
                            全选
                        </div>
                        <div class="del"><a href="">删除</a></div>
                        <div class="rightBar">
                            <div class="good_num">已选商品0件</div>
                            <div class="total">总计: ￥159.00</div>
                            <div class="order"><button class="btn" onclick="order_submit()">提交订单</button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>