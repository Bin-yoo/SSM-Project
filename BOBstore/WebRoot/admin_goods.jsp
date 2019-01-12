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
    <title>admin-商品管理</title>
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
							console.log(detailedType);
							var option = $("<option>").text(detailedType.detailedTypeName).val(detailedType.detailedTypeID);
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
            <div class="menu">
                <ul class="shop_list">
                    <li class="active"><a href="">商品管理</a></li>
                    <li><a href="order.html">订单</a></li>
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
                                    <label for="goodsName">商品名</label>
                                    <input type="text" class="form-control" name="goodsName" id="goodsName" placeholder="输入商品关键词">
                                </div>
                                <div class="form-group">
                                    <label for="goodsTypeID">商品类型</label>
                                    <select class="form-control" name="goodsTypeID" id="goodsTypeID">
                                    	<c:forEach items="${typeList}" var="type">
											<option value="${type.goodsTypeID}" ${type.goodsTypeID == tblGoods.goodsTypeID ?"selected='selected'":"" }>${type.goodsTypeName }</option>
										</c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="detailedTypeID">商品详细类型</label>
                                    <select class="form-control" name="detailedTypeID" id="detailedTypeID">
                                        <c:forEach items="${detailTypeList}" var="detailType">
											<option value="" ${detailType.detailedTypeID == tblGoods.detailedTypeID ?"selected='selected'":"" }> ${detailType.detailedTypeName }</option>
										</c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="strPrice">价格</label>
                                    <select class="form-control" name="strPrice" id="strPrice">
                                    	<option value="">不限</option>
                                        <option value="0-49">0-49</option>
                                        <option value="50-99">50-99</option>
                                        <option value="100-150">100-150</option>
                                        <option value="150-99999">150以上</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-default">查询</button>
                                <a href="good/befAdd" class="btn btn-primary" style="float: right;">添加商品</a>
                            </form>
                        </div>
                    </div>
                    <div class="goods-manage">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>商品</th>
                                    <th>商品类型</th>
                                    <th>商品详细类型</th>
                                    <th>库存</th>
                                    <th>原价格</th>
                                    <th>折后价</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${pageBean.list}" var="good">
                            		<tr class="tr">
	                                    <td>
	                                        <img src="img/2d295ff0a3796aaa6f01c93bc798f861.jpg" alt="" class="good_img">
	                                        <span>${good.goodsName}</span>
	                                    </td>
	                                    <td>${good.goodsTypeName}</td>
	                                    <td>${good.detailedTypeName}</td>
	                                    <td>${good.goodsInCount - goodsSellCount}</td>
	                                    <td>${good.goodsPrice}</td>
	                                    <td>${good.goodsDiscountPrice}</td>
	                                    <td><button type="button" class="btn btn-success btn-sm">修改</button>
	                                        <button type="button" class="btn btn-danger btn-sm">下架</button>
	                                    </td>
	                                </tr>
                            	</c:forEach>
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