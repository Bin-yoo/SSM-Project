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
    <title>admin-修改商品</title>
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
            <div class="search">
                <form action="#" class="search_form">
                    <input type="text" class="search_input" placeholder="搜索" />
                    <button class="search_button">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </form>
            </div>
            <div class="menu">
                <ul class="shop_list">
                    <li><a href="admin.html">商品管理</a></li>
                    <li><a href="">订单</a></li>
                </ul>
            </div>
        </div>
        <div class="main">
            <div class="container">
                <div class="panel panel-default">
                    <div class="panel-heading"><h4>修改商品信息</h4></div>
                    <div class="add">
                        <div>
                            <form class="form-horizontal" action="" method="post" role="form">
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodName" class="control-label">商品名字:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="goodName" id="goodName" value=""/>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodsTypeName" class="control-label">商品类型:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <select name="goodsTypeName" class="form-control">
                                            <option value="1">泡面</option>
                                            <option value="2">辣条</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="detailedTypeName" class="control-label">商品详细类型:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <select name="detailedTypeName" class="form-control">
                                            <option value="1">泡面</option>
                                            <option value="2">辣条</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="courseTime" class="control-label">库存:</label>
                                    </div>
                                    <div class="col-sm-10" style="text-align: left;">
                                        <button type="button" class="btn btn-default">-</button>
                                        <input type="text" name="amount" value="1" style="max-width:80px;text-align: center;" class="btn">
                                        <button type="button" class="btn btn-default">+</button>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="courseBegin" class="control-label"> 价格:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="courseBegin" id="courseBegin" value=""/>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="courseBegin" class="control-label"> 商品描述:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" name="courseBegin" id="courseBegin" ></textarea>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="file" class="button default"> 商品图片:</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <input id='location' class="form-control" disabled>
                                    </div>
                                    <div class="col-sm-1">
                                        <input type="button" id="i-check" value="浏览" class="btn" onclick="$('#i-file').click();">
                                        <input type="file" id='i-file' onchange="$('#location').val($('#i-file').val());" style="display: none">
                                    </div>
                                </div>
                                <div class="from-group lastdiv">
                                    <div class="col-sm-7 lastdiv">
                                        <input type="submit" class="btn btn-success" name="submit" value="提 交">
                                        <input type="reset" class="btn btn-default" name="reset" value="重 置">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>