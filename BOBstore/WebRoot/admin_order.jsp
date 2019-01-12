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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>admin-订单管理</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="./css/admin.css" />
</head>

<body>
    <div class="container-fluid">
        <div class="aside">
            <div class="user">
                <h4>Admin</h4>
                <div class="controller">
                    <span><a href="">注销用户</a></span>
                </div>
            </div>
            <div class="menu">
                <ul class="shop_list">
                    <li><a href="admin.html">商品管理</a></li>
                    <li class="active"><a href="">订单</a></li>
                </ul>
            </div>
        </div>
        <div class="main">
            <div class="container">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>商品管理</h4>
                        <div class="addgoods">
                            <form action="" method="post" class="form-inline">
                                <div class="form-group">
                                    <label for="orderId">订单号</label>
                                    <input type="text" class="form-control" id="orderId" placeholder="输入要查询的订单号">
                                </div>
                                <button type="submit" class="btn btn-default">查询</button>
                            </form>
                        </div>
                    </div>
                    <div class="order">
                        <table class="table table-striped order-list">
                            <thead>
                                <tr>
                                    <th>订单号</th>
                                    <th>商品名字</th>
                                    <th>商品类型</th>
                                    <th>数量</th>
                                    <th>单价</th>
                                    <th>总价</th>
                                    <th>送货地址</th>
                                    <th>收件人</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>56465465</td>
                                    <td>Tanmay</td>
                                    <td>Bangalore</td>
                                    <td>1</td>
                                    <td>￥560</td>
                                    <td>￥560</td>
                                    <td>大学西路西路西路</td>
                                    <td>梁彬</td>
                                    <td>
                                        <button type="button" class="btn btn-success btn-sm">发货</button>
                                        <button type="button" class="btn btn-danger btn-sm">取消订单</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>56465465</td>
                                    <td>Tanmay</td>
                                    <td>Bangalore</td>
                                    <td>1</td>
                                    <td>￥560</td>
                                    <td>￥560</td>
                                    <td>大学西路西路西路</td>
                                    <td>梁彬</td>
                                    <td>
                                        <button type="button" class="btn btn-success btn-sm">发货</button>
                                        <button type="button" class="btn btn-danger btn-sm">取消订单</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="page">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>