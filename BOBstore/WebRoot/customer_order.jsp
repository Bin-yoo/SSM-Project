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
</head>
<body>
    <div class="container-fluid">
        <div class="header">
            <div class="shop_title">
                <a href=""><h3>弟中弟商店-校园宅基送</h3></a>
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
                    <h4>你好，用户标哥</h4>
                    <div class="controller">
                        <span><a href="">注销用户</a></span>
                        <br>
                        <span><a href="">账号管理</a></span>
                        <span><a href="">我的商城</a></span>
                    </div>
                </div>
                <div class="menu">
                    <ul class="shop_list">
                        <li><a href="">我的购物车</a></li>
                        <li class="active"><a href="">所有订单</a></li>
                        <li><a href="">待发货</a></li>
                        <li><a href="">待收货</a></li>
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
                        <div class="item">
                            <ul class="item-content">
                                <li class="td td-item">
                                    <div class="item_img">
                                        <a href=""><img src="./img/2d295ff0a3796aaa6f01c93bc798f861.jpg" alt=""></a>
                                    </div>
                                    <div class="item_title">
                                        <a href="#">电脑键盘清洁泥笔记本清洁套装软胶汽车内饰清洗清理工具手机液晶屏幕清洁剂去尘除尘清灰胶魔力机械死角神器</a>
                                    </div>
                                </li>
                                <li class="td td-price">￥199.00</li>
                                <li class="td td-amount">
                                    <button type="button" class="btn btn-default">-</button>
                                    <input type="text" name="amount" value="1" style="width:40px;text-align: center;" class="btn">
                                    <button type="button" class="btn btn-default">+</button>
                                </li>
                                <li class="td td-sum">￥159.00</li>
                                <li class="td td-sta">已发货</li>
                                <li class="td td-op">
                                    <a href="#" class="btn btn-danger">收货</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>