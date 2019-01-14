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
	
		function getFocus(id){
			
			if(id == 1){
				$("#customerAddressee").focus();
			}else if(id == 2){
				$("#customerAddress").focus();
			}else if(id == 3){
				$("#customerPhone").focus();
			}
		}
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
                        <span><a href="">个人中心</a></span>
                    </div>
                </div>
                <div class="menu">
                    <ul class="shop_list">
                        <li><a href="">我的购物车</a></li>
                        <li><a href="">所有订单</a></li>
                        <li><a href="">待发货</a></li>
                        <li><a href="">待收货</a></li>
                    </ul>
                </div>
            </div>
            <div class="main">
                <div class="container">
                    <span class="tab">确认订单信息</span>
                    <div class="cus_msg">
                    	<div class="cus_name form-inline">
                    		<label for="customerAddressee" class="control-label">收件人:</label>
                    		<input type="text" class="btn" id="customerAddressee" name="customerAddressee" value="${sessionScope.customer.customerTrueName}" style="width: 600px;"/><button class="btn btn-default" onclick="getFocus(1)"><i class="glyphicon glyphicon-pencil"></i></button>
                    	</div>
                    	<div class="cus_address form-inline"">
                    		<label for="customerAddress" class="control-label">收件地址:</label>
                    		<input type="text" class="btn" id="customerAddress" name="customerAddress" value="${sessionScope.customer.customerAddress}" style="width: 600px;"/><button class="btn btn-default" onclick="getFocus(2)"><i class="glyphicon glyphicon-pencil"></i></button>
                    	</div>
                    	<div class="cus_phone form-inline"">
                    		<label for="customerPhone" class="control-label">联系电话:</label>
                    		<input type="text" class="btn" id="customerPhone" name="customerPhone" value="${sessionScope.customer.customerPhone}" style="width: 600px;"/><button class="btn btn-default" onclick="getFocus(3)"><i class="glyphicon glyphicon-pencil"></i></button>
                    	</div>
                    </div>
                    <div class="userbox check">
                        <div class="table_th">
                            <div class="th th-item">商品信息</div>
                            <div class="th th-price">单价</div>
                            <div class="th th-sum">金额</div>
                            <div class="th th-amount">数量</div>
                        </div>
                    </div>
                    <div class="order_list">
                        <div class="item">
                            <ul class="item-content">
                                <li class="td td-item">
                                    <div class="item_img">
                                        <a href=""><img src="${tblGoods.goodsImageUrl }" alt=""></a>
                                    </div>
                                    <div class="item_title">
                                        <a href="#">${tblGoods.goodsName }</a>
                                    </div>
                                </li>
                                <li class="td td-price">
                                	<c:if test="${empty tblGoods.goodsDiscountPrice}">
                                		￥${tblGoods.goodsPrice }
                                	</c:if>
                                	<c:if test="${not empty tblGoods.goodsDiscountPrice}">
                                		￥${tblGoods.goodsDiscountPrice }
                                	</c:if>
                                </li>
                                <li class="td td-sum">
                                	<c:if test="${empty tblGoods.goodsDiscountPrice}">
                                		￥${tblGoods.goodsPrice * count}
                                	</c:if>
                                	<c:if test="${not empty tblGoods.goodsDiscountPrice}">
                                		￥${tblGoods.goodsDiscountPrice * count}
                                	</c:if>
                                </li>
                                <li class="td td-amount">
                                    <input type="text" name="amount" value="x ${count}" style="max-width:80px;text-align: center;" class="btn" disabled="disabled">
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="commit_order">
                        <div class="rightBar">
                            <div class="total">
                            	总计: <c:if test="${empty tblGoods.goodsDiscountPrice}">
                                		￥${tblGoods.goodsPrice * count}
                                	</c:if>
                                	<c:if test="${not empty tblGoods.goodsDiscountPrice}">
                                		￥${tblGoods.goodsDiscountPrice * count}
                                	</c:if>
							</div>
                            <div class="order"><a href="">提交订单</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>