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
	<script src="js/jquery-2.1.0.min.js"></script>
	
	<script type="text/javascript">
	
		function checkForm(){
			var errMsg = "";
			if(document.form1.goodsName.value == ""){
				errMsg = errMsg+"商品名不能为空<br>"
			}
			if(document.form1.goodsInCount.value == "" || document.form1.goodsInCount.value < 1){
				errMsg = errMsg+"进货数量不能小于1<br>"
			}
			if(isNaN(document.form1.goodsInCount.value)){
				errMsg = errMsg+"进货数量只能填数字<br>"
			}
			if(document.form1.goodsPrice.value == ""){
				errMsg = errMsg+"价格不能为空<br>"
			}
			if(document.form1.goodsDescript.value == ""){
				errMsg = errMsg+"商品描述不能为空<br>"
			}
				
			if (errMsg == ""){
				return true;
			}else{
				$("#Msg").html(errMsg)
				return false;
			}
		}
		
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
			var Count = $('#Count');
			var kucun = $('#kucun');
			$('#reduce').click(function(){
				if(parseInt(Count.val()) > 0){
					Count.val(parseInt(Count.val())-1)
				}	
			})
			$('#add').click(function(){
				Count.val(parseInt(Count.val())+1)
				
			})
			
			Count.blur(function(){
				if(parseInt(Count.val()) < 0){
					parseInt(Count.val(0));
				}if(isNaN(Count.val())){
					parseInt(Count.val(0));
				}
			})
			
			$("#showbtn").click(function(){
			    $("#old_img").show();
			    $("#hidebtn").show();
			    $("#showbtn").hide();
			});
			
			$("#hidebtn").click(function(){
			    $("#old_img").hide();
			    $("#hidebtn").hide();
			    $("#showbtn").show();
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
                    <li><a href="admin/goods">商品管理</a></li>
                    <li><a href="/BOBstore/order/adminOrder">订单</a></li>
                </ul>
            </div>
        </div>
        <div class="main">
            <div class="container">
                <div class="panel panel-default">
                    <div class="panel-heading"><h4>修改商品</h4></div>
                    <div class="add">
                        <div>
                        	<div id="Msg" style="text-align: center; color:red;">${Msg }</div>
                            <form class="form-horizontal" action="good/modify" method="post" name="form1" role="form"  onsubmit="return checkForm()" enctype="multipart/form-data">
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodsName" class="control-label">商品名字:</label>
                                    </div>
                                    <div class="col-sm-10">
                                    	<input type="text" value="${tblGoods.goodsID}" name="goodsID" id="goodsID" hidden="hidden"/>
                                    	<input type="text" value="2" name="goodsInCount" id="goodsInCount" hidden="hidden"/>
                                        <input type="text" class="form-control" name="goodsName" id="goodsName" value="${tblGoods.goodsName}"></input>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodsTypeID" class="control-label">商品类型:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <select name="goodsTypeID" id="goodsTypeID" class="form-control">
                                          <c:forEach items="${typeList}" var="type">
											<option value="${type.goodsTypeID}" ${type.goodsTypeID == tblGoods.goodsTypeID ?"selected='selected'":"" }>${type.goodsTypeName }</option>
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
												<option value="${detailType.detailedTypeID}" ${detailType.detailedTypeID == tblGoods.detailedTypeID ?"selected='selected'":"" }> ${detailType.detailedTypeName }</option>
											</c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodsInCount" class="control-label">当前库存:</label>
                                    </div>
                                    <div class="col-sm-10" style="text-align: left;">
                                        <input type="text" name="kucun" value="${tblGoods.goodsInCount - tblGoods.goodsSellCount}" style="max-width:80px;text-align: center;" class="btn" disabled>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodsInCount" class="control-label">进货数量:</label>
                                    </div>
                                    <div class="col-sm-10" style="text-align: left;">
                                        <button type="button" class="btn btn-default" id="reduce">-</button>
                                        <input type="text" value="0" id="Count" style="max-width:80px;text-align: center;" class="btn">
                                        <button type="button" class="btn btn-default" id="add">+</button>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodsPrice" class="control-label"> 原价格:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="goodsPrice" id="goodsPrice" value="${tblGoods.goodsPrice}"/>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodsDiscountPrice" class="control-label"> 打折价格:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="goodsDiscountPrice" id="goodsDiscountPrice" value="${tblGoods.goodsDiscountPrice}"/>
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="goodsDescript" class="control-label"> 商品描述:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" name="goodsDescript" id="goodsDescript" >${tblGoods.goodsDescript}</textarea>
                                    </div>
                                </div>
                                <div class="from-group" id="old_img" style="display: none;">
                                    <div class="col-sm-2">
                                        <label for="file" class="button default"> 商品图片:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <img alt="${tblGoods.goodsDescript}" src="${tblGoods.goodsImageUrl}" class="img-responsive">
                                    </div>
                                </div>
                                <div class="from-group">
                                    <div class="col-sm-2">
                                        <label for="file" class="button default"> 上传新图片:</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <input id='goodsImageUrl' class="form-control" disabled>
                                    </div>
                                    <div class="col-sm-2">
                                        <input type="button" id="i-check" value="上传新图片" class="btn" onclick="$('#i-file').click();">
                                        <input type="file" id='i-file' name="i-file" onchange="$('#goodsImageUrl').val($('#i-file').val())" style="display: none">
                                    </div>
                                    <div class="col-sm-1">
                                        <input type="button" class="btn" id="showbtn" value="查看当前图片">
                                        <input type="button" class="btn" id="hidebtn" value="查看当前图片" style="display: none;">
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