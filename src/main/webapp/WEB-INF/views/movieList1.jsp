<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
--%>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
http://localhost:3306/crud
-->

<!DOCTYPE html>
<html>

<head>
    <%--
    <base href="<%=basePath%>">
    --%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Movie|电影列表</title><meta name="keywords" content="Movie" /><meta name="description" content="电影" />

    <link href="${APP_PATH}/inspinia/css/bootstrap.min.css" rel="stylesheet">
    <link href="${APP_PATH}/inspinia/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="${APP_PATH}/inspinia/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="${APP_PATH}/inspinia/css/animate.css" rel="stylesheet">
    <link href="${APP_PATH}/inspinia/css/style.css" rel="stylesheet">

</head>

<body>

<div id="wrapper">

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="${APP_PATH}/inspinia/img/profile1_small.jpg" />
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">Selena_yrr</strong>
                             </span> <span class="text-muted text-xs block">管理员 <b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="profile.html">个人信息</a></li>
                            <li><a href="contacts.html">好友</a></li>
                            <li><a href="mailbox.html">信箱</a></li>
                            <li class="divider"></li>
                            <li><a href="../../index.jsp">登出</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        IN+
                    </div>
                </li>
                <li >
                    <a href="../../admin_login.jsp"><i class="fa fa-th-large"></i> <span class="nav-label">主页</span> </a>
                </li>
                <li class="active">
                    <a href="layouts.html"><i class="fa fa-diamond"></i> <span class="nav-label">电影列表</span></a>
                </li>
                <li>
                    <a href="metrics.html"><i class="fa fa-pie-chart"></i> <span class="nav-label">分类管理</span>  </a>
                </li>


            </ul>

        </div>
    </nav>

    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="请输入搜索内容" class="form-control" name="top-search" id="top-search">
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message">欢迎来到电影管理后台</span>
                    </li>


                    <li>
                        <a href="../../admin_login.jsp">
                            <i class="fa fa-sign-out"></i> 注销
                        </a>
                    </li>
                </ul>

            </nav>
        </div>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>电影列表</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${APP_PATH}/login">主页</a>
                    </li>
                    <li class="active">
                        <a href="${APP_PATH}/movies">电影列表</a>
                    </li>

                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">

                <c:forEach items="${pageInfo.list }" var="mov">
                    <div class="col-lg-10">
                        <div class="contact-box">
                            <h2>
                                <span><strong>${mov.movie_name}</strong></span>
                                <span class="year">(${mov.year})</span>
                            </h2>
                            <a href="profile.html">

                                <div class="col-sm-4">

                                    <div class="text-center">
                                        <img alt="image" class="m-t-xs img-responsive" src="${APP_PATH}/inspinia/img/poster1.jpg">
                                    </div>
                                </div>
                            </a>
                            <div class="col-sm-6">
                                <span class="pl">导演：</span><span class="attrs"><a href="">${mov.director}</a></span><br>
                                <span class="pl">演员：</span><span class="attrs"><a href="">${mov.actors}</a></span><br>
                                <span class="pl">制片国家/地区：</span><span class="attrs">${mov.country}</span><br>
                                <span class="pl">语言：</span><span class="attrs">${mov.language}</span><br>
                                <span class="pl">上映日期：</span><span class="attrs">${mov.release_time}</span><br>
                                <span class="pl">又名：</span><span class="attrs">${mov.translation_name}</span><br>
                                <span class="pl">简介：</span><span class="attrs">${mov.introduction}</span><br>
                                <span class="pl">豆瓣评分：</span><span class="attrs">${mov.score}</span><br>
                            </div>
                            <div class="col-sm-2">
                                <div>
                                    <button class="btn btn-info" type="button"><i class="fa fa-paste"></i>  编辑</button>
                                </div>
                                <br>
                                <div>
                                    <button class="btn btn-warning " type="button"><i class="fa fa-warning"></i> 删除</button>
                                </div>
                            </div>
                                <div class="clearfix"></div>


                        </div>

                    </div>
                </c:forEach>

            </div>
            <div class="row">
                <!--分页文字信息  -->
                <div class="col-md-4">当前 页,总
                    页,总 ${pageInfo.total } 条记录</div>
                <!-- 分页条信息 -->
                <div class="col-md-offset-4">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li><a href="${APP_PATH }/movies?pn=1">首页</a></li>
                            <!--判断是否有上一页-->
                            <c:if test="${pageInfo.hasPreviousPage }">
                                <li><a href="${APP_PATH }/movies?pn=${pageInfo.pageNum-1}"
                                       aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                </a></li>
                            </c:if>


                            <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                <c:if test="${page_Num == pageInfo.pageNum }">
                                    <li class="active"><a href="#">${page_Num }</a></li>
                                </c:if>
                                <c:if test="${page_Num != pageInfo.pageNum }">
                                    <li><a href="${APP_PATH }/movies?pn=${page_Num }">${page_Num }</a></li>
                                </c:if>

                            </c:forEach>

                            <!--判断是否有下一页-->
                            <c:if test="${pageInfo.hasNextPage }">
                                <li><a href="${APP_PATH }/movies?pn=${pageInfo.pageNum+1 }"
                                       aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                </a></li>
                            </c:if>
                            <!--pages表示总页数-->
                            <li><a href="${APP_PATH }/movies?pn=${pageInfo.pages}">末页</a></li>
                        </ul>
                    </nav>
                </div>
            </div>

        </div>
        <div class="footer">
            <div class="pull-right">
                <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1271199127'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s19.cnzz.com/z_stat.php%3Fid%3D1271199127%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
            </div>
            <div>
                <strong>Copyright</strong> Selena &copy; 2018-8
            </div>
        </div>

    </div>
</div>



<!-- Mainly scripts -->
<script src="${APP_PATH}/inspinia/js/jquery/jquery-3.1.1.min.js"></script>
<script src="${APP_PATH}/inspinia/js/bootstrap/bootstrap.min.js"></script>
<script src="${APP_PATH}/inspinia/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${APP_PATH}/inspinia/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="${APP_PATH}/inspinia/js/plugins/dataTables/datatables.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="${APP_PATH}/inspinia/js/inspinia.js"></script>
<script src="${APP_PATH}/inspinia/js/plugins/pace/pace.min.js"></script>

<!-- Page-Level Scripts -->


</body>
