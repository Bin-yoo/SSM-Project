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
    	function deleteFun(shopcartID){
			var flag = confirm("您真的要删除该行记录吗？");
			
			if(flag){
				window.location.href="/BOBstore/shopCart/removeGoods?shopcartID=" + shopcartID;
			}
		}
		
    	$(function(){
			var amount = $('#amount');
			var Stock = $('.Stock');
			
			$('.reduce').click(function(){
				if(parseInt(amount.val()) > 1){
					amount.val(parseInt(amount.val())-1)
				}	
			})
			$('.add').click(function(){
				if(parseInt(amount.val()) < parseInt(Stock.val())){
					amount.val(parseInt(amount.val())+1)
					
				}
			})
			
			amount.blur(function(){
				if(parseInt(amount.val()) < 1){
					parseInt(amount.val(1));
				}if(isNaN(amount.val())){
					parseInt(amount.val(1));
				}if(parseInt(amount.val()) > parseInt(Stock.val())){
					parseInt(amount.val(parseInt(Stock.val())));
				}
			})
			
			var all = document.getElementById ("all");			//全选checkbox
			var box = document.getElementsByName('shopcartID');	//子复选框
			
			//遍历checkbox，把子复选框的checked设置成全选框的状态，实现全选/全不选
			all.onclick = function (){
				for ( var i = 0; i < box.length; i++){
					box[i].checked = this.checked;
				}
			};
			//遍历checkbox，子复选框有一个未选中时，如果全选框设为false不选状态
			for ( var i = 0; i < box.length; i++){
				box[i].onclick = function (){
					if ( !this.checked ){
						all.checked = false;
					}
				};
			}
			
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
                        <li><a href="order/withgoods?orderState=0">待发货</a></li>
                        <li><a href="order/withaccept?orderState=2">待收货</a></li>
                        <li><a href="order/accept?orderState=2">已收货</a></li>
                    </ul>
                </div>
            </div>
            <div class="main">
                <div class="container">
                    <span class="tab">我的购物车</span>
                    <div class="userbox">
                        <div class="table_th">
                            <div class="th th-chk">
                                <input type="checkbox" id="all" name="selectall" value="">全选
                            </div>
                            <div class="th th-item">商品信息</div>
                            <div class="th th-price">单价</div>
                            <div class="th th-amount">数量</div>
                            <div class="th th-sum">金额</div>
                            <div class="th th-op">操作</div>
                        </div>
                    </div>
                    <form action="order/batchSubmission" method="post">                 
	                    <div class="order_list">
                    		<c:forEach items="${shopcartList }" var="good">
		                        <div class="item">	
		                            <ul class="item-content">
		                                <li class="td td-chk">
		                                    <input type="checkbox" name="shopcartID" value="${good.shopcartID}">
		                                </li>
		                                <li class="td td-item">
		                                    <div class="item_img">
		                                        <a href="good/goodsdetail?goodsID=${good.goodsID}"><img src="${good.goodsImageUrl}" alt=""></a>
		                                    </div>
		                                    <div class="item_title">
		                                    	<input type="hidden" value="${good.goodsInCount - good.goodsSellCount}" id="Stock" hidden="hidden" />
		                                        <a href="good/goodsdetail?goodsID=${good.goodsID}">${good.goodsName}</a>
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
		                                    <input type="text" name="amount" value="${good.goodCount }"  id="amount" style="max-width:80px;text-align: center;" class="btn">
		                                    <button type="button" class="btn btn-default add" id="add">+</button>
		                                </li>
		                                <li class="td td-sum">￥
		                                	<c:if test="${empty good.goodsDiscountPrice}">
		                  						<span id="sum">${good.goodCount * good.goodsPrice}</span>
		                  					</c:if>
		                  					<c:if test="${not empty good.goodsDiscountPrice}">
		                  						<span id="sum">${good.goodCount * good.goodsDiscountPrice}</span>
		                  					</c:if>
		                                </li>
		                                <li class="td td-op">
		                                    <button type="button" class="btn btn-danger btn-sm" onclick='deleteFun(${good.shopcartID})'>删除</button>
		                                </li>
		                            </ul>
		                        </div>
                        	</c:forEach>
	                    </div>
	                    <div class="commit_order">
	                        <div class="selectall">
	                            <input type="checkbox" id="all" name="selectall" value="">全选
	                        </div>
	                        <div class="del"><a href="">删除</a></div>
	                        <div class="rightBar">
	                            <div class="good_num">已选商品0件</div>
	                            <div class="total">总计: ￥159.00</div>
	                            <div class="order"><input type="submit" class="btn" style="color: #fff">提交订单</input></div>
	                        </div>
	                    </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</body>
</html>