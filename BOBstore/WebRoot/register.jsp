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
    <title>新用户注册</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="./css/admin.css" />
	<script src="js/jquery-2.1.0.min.js"></script>
	
	<script type="text/javascript">
	
		function checkForm(){
			var errMsg = "";
			if(document.form1.customerName.value == ""){
				errMsg = errMsg+"用户名不能为空<br>"
			}
			if(document.form1.password.value == ""){
				errMsg = errMsg+"密码不能为空<br>"
			}
			if(document.form1.customerTrueName.value == ""){
				errMsg = errMsg+"姓名不能为空<br>"
			}
			if(document.form1.customerPhone.value != "" ){
				if(!(/^1(3|4|5|7|8)\d{9}$/.test(document.form1.customerPhone.value))){ 
			        errMsg = errMsg+"手机号码格式有误，请重填<br>"
			    } 
			}
			
				
			if (errMsg == ""){
				return true;
			}else{
				$("#Msg").html(errMsg)
				return false;
			}
		}
		$(function(){
			$("#customerName").blur(function(){
				
				$.post("user/checkName",{
						"name":$("#customerName").val()
					},
					function(data,textStatus){
						if (data == "true"){
							$("#errName").show();
						}else{
							$("#errName").hide();
						}
					}
				);
			})
		})
	</script>

</head>

<body>
    <div class="container-fluid">
    	<div class="header">
            <div class="shop_title">
                <a href="good/index"><h3>弟中弟商店-校园宅基送</h3></a>
            </div>
        </div>
        <div class="main register">
            <div class="container">
                <div class="panel panel-default">
                    <div class="panel-heading"><h4>新用户注册&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-align: center; color:red;font-size: 14px;">*为必填项</span></h4></div>
                    <div class="add">
                        <div>
                        	<div id="Msg" style="text-align: center; color:red;">${Msg }</div>
                            <form class="form-horizontal" action="user/register" method="post" name="form1" role="form"  onsubmit="return checkForm()">
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="customerName" class="control-label">* 用户名:</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="customerName" id="customerName" value="${tblCustomer.customerName}"/>
                                    </div>
                                    <div class="col-sm-1">
                                    	<p id="errName" style="color:red; display:none;"><i class="glyphicon glyphicon-remove"></i></p>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="password" class="control-label">* 密码:</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" name="password" id="password" value=""/>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="customerTrueName" class="control-label">* 个人姓名:</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="customerTrueName" id="customerTrueName" value="${tblCustomer.customerTrueName}"/>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="customerAddress" class="control-label">个人地址:</label>
                                    </div>
                                    <div class="col-sm-9">
                                    	<input type="text" class="form-control" name="customerAddress" id="customerAddress" value="${tblCustomer.customerAddress}"/>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="sex" class="control-label">性别:</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <select name="sex" id="sex" class="form-control">
											<option value="0" ${tblCustomer.sex == 0 ? "selected='selected'":""}>女</option>
											<option value="1" ${tblCustomer.sex == 1 ? "selected='selected'":""}>男</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="customerEmail" class="control-label">电子邮箱:</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" name="customerEmail" id="customerEmail" value="${tblCustomer.customerEmail}"/>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="customerPhone" class="control-label">个人电话:</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="customerPhone" id="customerPhone" value="${tblCustomer.customerPhone}"/>
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