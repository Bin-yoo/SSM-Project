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
    <script src="js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
    	function update(orderID,currPage){
    		var flag = confirm("您真的要发货吗？");
			if(flag){
				window.location.href= "/BOBstore/order/Grant?orderID=" + orderID + "&currPage=" + currPage;
			}
    	}
    	function doTurnTO(currPage){
			var f = window.location.href="/BOBstore/order/adminOrder?currPage=" + currPage;
		}
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
                    <li class="active"><a href="/BOBstore/order/adminOrder">订单</a></li>
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
                        <table class="table table-striped order-list" id="table">
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
                                    <th>订单状态</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${pageBean.list}" var="order">
                                <tr>
                                    <td>${order.orderID}</td>
                                    <td>${order.goodsName}</td>
                                    <td>${order.detailedTypeName}</td>
                                    <td>${order.goodCount}</td>
                                    <td>${order.orderPrice}</td>
                                    <td>${order.totalMoney}</td>
                                    <td>${order.orderAddress}</td>
                                    <td>${order.orderAddressee}</td>
                                    <td>
										<c:if test="${order.orderState == '0'.charAt(0)}">
	                                		未发货
	                                	</c:if>
	                                	<c:if test="${order.orderState == '1'.charAt(0)}">
	                                		已发货
	                                	</c:if>
	                                	<c:if test="${order.orderState == '2'.charAt(0)}">
	                                		已收货
	                                	</c:if>
									</td>
                                    <td>
                                    	<c:if test="${order.orderState == '0'.charAt(0)}">
	                                		<a class="" href="&currPage="></a>
                                    		<button type="button" class="btn btn-success btn-sm" onclick="update(${order.orderID},${pageBean.currPage})">发货</button>
	                                	</c:if>
	                                	<c:if test="${order.orderState == '1'.charAt(0)}">
	                                		<a class="" href="&currPage="></a>
                                    		<button type="button" class="btn btn-success btn-sm" onclick="update(${order.orderID},${pageBean.currPage})" disabled="disabled">发货</button>
	                                	</c:if>
	                                	<c:if test="${order.orderState == '2'.charAt(0)}">
	                                		<a class="" href="&currPage="></a>
                                    		<button type="button" class="btn btn-success btn-sm" onclick="update(${order.orderID},${pageBean.currPage})" disabled="disabled">发货</button>
	                                	</c:if>
                                    	
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="page">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                            	<c:if test="${pageBean.currPage <= 1 }">
									<li>
										<span aria-hidden="true">首页</span>
	                                	<span aria-hidden="true">&laquo;</span>
	                                </li>
								</c:if>
								<c:if test="${pageBean.currPage > 1 }">
									<li>
										<a href="javascript:void(0)" onclick="doTurnTO(1)">
	                                        <span aria-hidden="true">首页</span>
	                                    </a>
	                                    <a href="javascript:void(0)" onclick="doTurnTO(${pageBean.currPage - 1 })">
	                                        <span aria-hidden="true">&laquo;</span>
	                                    </a>
                                    </li>
								</c:if>
								<c:if test="${pageBean.totalPage <= 5}">
								    <c:forEach begin="1" end="${pageBean.totalPage}" step="1" var="i">
								        <c:if test="${pageBean.currPage == i}">
								            <li><a href="javascript:void(0)" onclick="doTurnTO(${i })">${i}</a></li>
								        </c:if>
								        <c:if test="${pageBean.currPage != i}">
								            <li><a href="javascript:void(0)" onclick="doTurnTO(${i })">${i}</a></li>
								        </c:if>
								    </c:forEach>
								</c:if>
								<c:if test="${pageBean.totalPage > 5}">
								    <c:if test="${pageBean.currPage > 2}">
								        <c:if test="${pageBean.currPage+3 >= pageBean.totalPage}">
								            <c:forEach begin="${pageBean.totalPage-4}" end="${pageBean.totalPage}" var="i">
								                <c:if test="${i == page.currPage+1}">
								                    <li><a href="javascript:void(0)" onclick="doTurnTO(${i })">${i}</a></li>
								                </c:if>
								                <c:if test="${i != page.currPage+1}">
								                    <li><a href="javascript:void(0)" onclick="doTurnTO(${i })">${i}</a></li>
								                </c:if>
								            </c:forEach>
								        </c:if>
								        <c:if test="${pageBean.currPage+3 < pageBean.totalPage}">
								            <li><a href="javascript:void(0)" onclick="doTurnTO(${pageBean.currPage-2 })">${pageBean.currPage-2}</a></li>
								            <li><a href="javascript:void(0)" onclick="doTurnTO(${pageBean.currPage-1 })">${pageBean.currPage-1}</a></li>
								            <li><a href="javascript:void(0)" onclick="doTurnTO(${pageBean.currPage })">${pageBean.currPage }</a></li>
								            <li><a href="javascript:void(0)" onclick="doTurnTO(${pageBean.currPage+1 })">${pageBean.currPage+1 }</a></li>
								            <li><a href="javascript:void(0)" onclick="doTurnTO(${pageBean.currPage+2 })">${pageBean.currPage+2 }</a></li>
								        </c:if>
								    </c:if>
								    <c:if test="${pageBean.currPage <= 2}">
								        <c:forEach begin="1" end="5" step="1" var="i">
								            <c:if test="${page.currPage+1 == i}">
								                <li><a href="javascript:void(0)" onclick="doTurnTO(${i })">${i}</a></li>
								            </c:if>
								            <c:if test="${page.currPage+1 != i}">
								                <li><a href="javascript:void(0)" onclick="doTurnTO(${i })">${i}</a></li>
								            </c:if>
								        </c:forEach>
								    </c:if>
								</c:if>
					            <c:if test="${pageBean.currPage >= pageBean.totalPage }">
					            	<li>
                                		<span aria-hidden="true">&raquo;</span>
										<span aria-hidden="true">末页</span>
                                	</li>
								</c:if>
								<c:if test="${pageBean.currPage < pageBean.totalPage }">
									<li>
	                                    <a href="javascript:void(0)" aria-label="Next"  onclick="doTurnTO(${pageBean.currPage + 1 })">
	                                        <span aria-hidden="true">&raquo;</span>
	                                    </a>
	                                    <a href="javascript:void(0)" onclick="doTurnTO(${pageBean.totalPage })">
											<span aria-hidden="true">末页</span>
										</a>
	                                </li>
								</c:if>
								
								<li>
									<span aria-hidden="true">当前页:<input type="text" class="btn" placeholder="${pageBean.currPage}" id="currpage"></span>
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