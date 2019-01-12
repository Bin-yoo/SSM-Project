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
    <title>admin-添加商品</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="./css/admin.css" />
	<script src="js/jquery-2.1.0.min.js"></script>
	
	<script type="text/javascript">
		
		$(function(){
			$("#goodsTypeID").change(function(){
				$.post("detail/viewByGoodsTypeId",
					{
						"goodsTypeID":$("#goodsTypeID").val()
					},
					function(data,textStatus){
						var detailedTypeID = $("#detailedTypeID");
						detailedTypeID.empty();
						$.each(data,function(index,detailedType){
							console.log("detailedType")
							var option = $("<option>").text(detailedType.goodsName).val(detailedType.detailedTypeID);
							detailedTypeID.append(option)
						})
					},"json"
				);
			});
		});
		
	</script>

</head>

<body>
    <div class="container-fluid">
        <div class="aside">
            <div class="user">
           		<h4>
                	你好，${sessionScope.admin.adminTrueName}
                </h4>
                <div class="controller">
                    <span><a href="admin/logout">注销用户</a></span>
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
                    <div class="panel-heading"><h4>添加商品</h4></div>
                    <div class="add">
                        <div>
                            <form class="form-horizontal" action="" method="post" role="form">
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodsName" class="control-label">商品名字:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="goodsName" id="goodsName" value=""/>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodsTypeID" class="control-label">商品类型:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <select name="goodsTypeID" id="goodsTypeID" class="form-control">
                                            <c:forEach items="${typeList}" var="type">
												<option value="${type.id}" ${type.id == tblGoods.goodsTypeID ?"selected='selected'":"" }>${type.goodsTypeName }</option>
											</c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="detailedTypeID" class="control-label">商品详细类型:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <select name="detailedTypeID" id="detailedTypeID" class="form-control">
	                                        <c:forEach items="${detailTypeList}" var="detailType">
												<option value="" ${detailType.detailedTypeID == tblGoods.detailedTypeID ?"selected='selected'":"" }> ${detailType.detailedTypeName }</option>
											</c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodsInCount" class="control-label">进货数量:</label>
                                    </div>
                                    <div class="col-sm-10" style="text-align: left;">
                                        <button type="button" class="btn btn-default">-</button>
                                        <input type="text" name="goodsInCount" value="1" style="max-width:80px;text-align: center;" class="btn">
                                        <button type="button" class="btn btn-default">+</button>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodsPrice" class="control-label"> 原价格:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="goodsPrice" id="goodsPrice" value=""/>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodsDiscountPrice" class="control-label"> 打折价格:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="goodsDiscountPrice" id="goodsDiscountPrice" value=""/>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodsDescript" class="control-label"> 商品描述:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" name="goodsDescript" id="goodsDescript" ></textarea>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="file" class="button default"> 商品图片:</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <input id='location' class="form-control"disabled>
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