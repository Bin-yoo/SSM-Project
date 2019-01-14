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
    <title>弟中弟商店-校园宅基送</title>

    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/owl.theme.default.css"/>
    <link rel="stylesheet" type="text/css" href="./css/index.css">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/index.js"></script>
    <script type="text/javascript">
	
		function doSearch(detailedTypeID,currPage){
			var f = window.location.href="/BOBstore/good/viewgoods?detailedTypeID=" + detailedTypeID + "&currPage=" +currPage;
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
                    <input type="text" class="search_input" placeholder="搜索商品">
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
                        <li class="hotpush"><a href="good/index">热门推荐</a></li>
                        <li>
                            <p class="shop_list_title">酒水饮料</p>
                            <ul class="extraMenu">
								<li ${detailedTypeID == 1 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=1">啤酒风味</a></li>
								<li ${detailedTypeID == 2 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=2">中国精酿</a></li>
								<li ${detailedTypeID == 3 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=3">各国精酿</a></li>
								<li ${detailedTypeID == 4 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=4">果汁饮料</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="shop_list_title">咖啡冲饮</p>
                            <ul class="extraMenu">
								<li ${detailedTypeID == 5 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=5">速溶咖啡</a></li>
								<li ${detailedTypeID == 6 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=6">固体饮料</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="shop_list_title">糖果系列</p>
                            <ul class="extraMenu">
								<li ${detailedTypeID == 7 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=7">软糖</a></li>
								<li ${detailedTypeID == 8 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=8">奶片</a></li>
								<li ${detailedTypeID == 9 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=9">果冻</a></li>
								<li ${detailedTypeID == 10 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=10">硬糖</a></li>
								<li ${detailedTypeID == 11 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=11">巧克力</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="shop_list_title">零食糕点</p>
                            <ul class="extraMenu">
                                <li ${detailedTypeID == 12 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=12">曲奇饼干</a></li>
                                <li ${detailedTypeID == 13 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=13">西式糕点</a></li>
                                <li ${detailedTypeID == 14 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=14">传统糕点</a></li>
                                <li ${detailedTypeID == 15 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=15">膨化食品</a></li>
                                <li ${detailedTypeID == 16 ? "class='active_li'" : ""}><a href="good/viewgoods?detailedTypeID=16">辣条</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="shop_cart">
                    <i class="glyphicon glyphicon-shopping-cart" style="color:#0094FF;"></i>
<<<<<<< HEAD
                    <a href="shopCart/viewShopCart">购物车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge">${ShopcartCount}</span></a>
=======
                    <c:if test="${not empty ShopcartCount}">
                    	<a href="shopCart/viewShopCart">购物车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge">${ShopcartCount}</span></a>
                    </c:if>
                    <c:if test="${empty ShopcartCount}">
                    	<a href="login.jsp">购物车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge">你还没登陆呢,亲</span></a>
                    </c:if>
>>>>>>> 6868a712d0b6d79e85f792155aa9f5c15e75a6a1
                </div>
            </div>
            <div class="main">
                <div class="container">
   
                    <span class="tab">
                    	<c:forEach items="${pageBean.list}" begin="1" end="1" step="1" var="i">
							${i.detailedTypeName}
                        </c:forEach>
                    </span>
                    <div class="goodsbox">
                        <dl class="goodslist">
                        <c:forEach items="${pageBean.list}" var="goods">
                            <dt class="item">
                                <div class="img">
                                    <a href="good/goodsdetail?goodsID=${goods.goodsID}"><img src="${goods.goodsImageUrl}"></a>
                                </div>
                                <div class="text">
                                    <p class="g_title"><a href="good/goodsdetail?goodsID=${goods.goodsID}">${goods.goodsName}</a></p>
                                    <p class="g_price">￥
	                                    <span class="pri">${goods.goodsPrice}</span>
	                                    <span class="num">${goods.goodsSellCount}销售</span>
                                    </p>
                                </div>
                            </dt>
                           </c:forEach>
                        </dl>
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
										<a href="javascript:void(0)" onclick="doSearch(${detailedTypeID},1)">
	                                        <span aria-hidden="true">首页</span>
	                                    </a>
										<a href="javascript:void(0)" onclick="doSearch(${detailedTypeID},${pageBean.currPage - 1 })">
	                                        <span aria-hidden="true">&laquo;</span>
	                                    </a>
                                    </li>
								</c:if>
								<c:if test="${pageBean.totalPage <= 5}">
								    <c:forEach begin="1" end="${pageBean.totalPage}" step="1" var="i">
								        <c:if test="${pageBean.currPage == i}">
							        		<li><a href="javascript:void(0)" onclick="doSearch(${detailedTypeID},${i })">${i }</a></li>
								        </c:if>
								        <c:if test="${pageBean.currPage != i}">
							        		<li><a href="javascript:void(0)" onclick="doSearch(${detailedTypeID},${i })">${i }</a></li>
								        </c:if>
								    </c:forEach>
								</c:if>
								<c:if test="${pageBean.totalPage > 5}">
								    <c:if test="${pageBean.currPage > 2}">
								        <c:if test="${pageBean.currPage+3 >= pageBean.totalPage}">
								            <c:forEach begin="${pageBean.totalPage-4}" end="${pageBean.totalPage}" var="i">
								                <c:if test="${i == page.currPage+1}">
								                    <li><a href="javascript:void(0)" onclick="doSearch(${pageBean.list.detailedTypeID},${i })">${i}</a></li>
								                </c:if>
								                <c:if test="${i != page.currPage+1}">
								                    <li><a href="javascript:void(0)" onclick="doSearch(${pageBean.list.detailedTypeID},${i })">${i}</a></li>
								                </c:if>
								            </c:forEach>
								        </c:if>
								        <c:if test="${pageBean.currPage+3 < pageBean.totalPage}">
								            <li><a href="javascript:void(0)" onclick="doSearch(${pageBean.list.detailedTypeID},${pageBean.currPage-2 })">${pageBean.currPage-2}</a></li>
								            <li><a href="javascript:void(0)" onclick="doSearch(${pageBean.list.detailedTypeID},${pageBean.currPage-1 })">${pageBean.currPage-1}</a></li>
								            <li><a href="javascript:void(0)" onclick="doSearch(${pageBean.list.detailedTypeID},${pageBean.currPage })">${pageBean.currPage }</a></li>
								            <li><a href="javascript:void(0)" onclick="doSearch(${pageBean.list.detailedTypeID},${pageBean.currPage+1 })">${pageBean.currPage+1 }</a></li>
								            <li><a href="javascript:void(0)" onclick="doSearch(${pageBean.list.detailedTypeID},${pageBean.currPage+2 })">${pageBean.currPage+2 }</a></li>
								        </c:if>
								    </c:if>
								    <c:if test="${pageBean.currPage <= 2}">
								        <c:forEach begin="1" end="5" step="1" var="i">
								            <c:if test="${page.currPage+1 == i}">
								                <li><a href="javascript:void(0)" onclick="doSearch(${pageBean.list.detailedTypeID},${i })">${i}</a></li>
								            </c:if>
								            <c:if test="${page.currPage+1 != i}">
								                <li><a href="javascript:void(0)" onclick="doSearch(${pageBean.list.detailedTypeID},${i })">${i}</a></li>
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
										<a href="javascript:void(0)" aria-label="Next"  onclick="doSearch(${detailedTypeID},${pageBean.currPage + 1 })">
	                                        <span aria-hidden="true">&raquo;</span>
	                                    </a>
										<a href="javascript:void(0)" onclick="doSearch(${detailedTypeID},${pageBean.totalPage })">
											<span aria-hidden="true">末页</span>
										</a>
	                                </li>
								</c:if>
								<li>
									<span aria-hidden="true">当前页:${pageBean.currPage}</span>
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