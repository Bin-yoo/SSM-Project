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
    <title>校园宅基送</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/index.css">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
    	function checkForm(){
			var errMsg = "";
			if(document.form1.name.value == ""){
				errMsg = errMsg+"用户名不能为空<br>"
			}if(document.form1.password.value == ""){
				errMsg = errMsg+"密码不能为空<br>"
			}
				
			if (errMsg == ""){
				return true;
			}else{
				$("#Msg").html(errMsg)
				return false;
			}
		}

    </script>
</head>
<body>
    <div class="bg"></div>
    <div class="login_nav">
        <div class="shop_title">
            <a href="good/index"><h2>弟中弟商店-校园宅基送</h2></a>
        </div>
    </div>
    <div class="loginbox">
        <div class="title"><h4>用户登录</h4></div>
        <div class="login">
            <form action="user/login" method="post" class="form-group" name="form1" onsubmit="return checkForm()">
                <table class="">
                    <div class="errMsg" id="Msg">${errMsg}</div>
                    <input type="hidden" name="goodsID" id="goodsID" value="${goodsID }"/>
                    <tr>
                        <td><label for="name" class="control-label">用户名:</label></td>
                        <td>
                            <input type="text" class="form-control" name="name" id="name" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="password" class="control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码:</label></td>
                        <td><input type="password" class="form-control" name="password" id="password" value=""/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" class="btn btn-success" name="login" id="login" value="登 录" style="width:100%"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="back">
            <span><a href="good/index">返回商城</a></span>
        </div>
        <div class="register">
            <span><a href="register.jsp">注册账号</a></span>
            <span><a href="#">找回密码</a></span>
        </div>
    </div>
</body>
</html>