<%@page language="java" contentType="text/html; chatset=UTF-8"
        pageEncoding="UTF-8" %>
<%--
<jsp:forward page="/login"></jsp:forward>
--%>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
                            <li><a href="index.jsp">登出</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        IN+
                    </div>
                </li>
                <li >
                    <a href="admin_login.jsp"><i class="fa fa-th-large"></i> <span class="nav-label">主页</span> </a>
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
                        <a href="${APP_PATH}/WEB-INF/views/admin_login.jsp">
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
            <div class="row" id="movie_info_row">

            </div>
            <!--显示分页信息-->
            <div class="row" >
                <!--分页信息-->
                <div class="col-md-6" id="page_info_area"></div>
                <!--分页条信息-->
                <div class="col-md-6" id="page_nav_area"></div>
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
<script src="${APP_PATH}/inspinia/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${APP_PATH}/inspinia/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${APP_PATH}/inspinia/js/bootstrap/bootstrap.min.js"></script>

<script src="${APP_PATH}/inspinia/js/plugins/dataTables/datatables.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="${APP_PATH}/inspinia/js/inspinia.js"></script>
<script src="${APP_PATH}/inspinia/js/plugins/pace/pace.min.js"></script>

<!-- Page-Level Scripts -->



<script type="text/javascript">
    var totalRecord, currentPage;
    //1 页面加载完成后直接发送一个ajax请求，要到分页数据
    $(function(){
        //去首页
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${APP_PATH}/movies",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                //console.log(result);
                //1 解析并显示数据
                build_movs_info(result);
                //2 解析并显示分页信息
                build_page_info(result);
                //3 解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    function build_movs_info(result) {
        //首先将数据清空
        $("#movie_info_row").empty();
        var movs = result.extend.pageInfo.list;
        var mov_info="";
        $.each(movs,function (index,item) {
            mov_info = mov_info+ "<div class=\"col-lg-10\"><div class=\"contact-box\">" +
                "<h2>" +
                "<span><strong>"+item.movie_name+"</strong></span>" +
                "<span class='year'>("+item.year+")</span>" +
                "</h2>" +
                "<div class='col-sm-4'><div class='text-center'>" +
                "<img alt='image' class='m-t-xs img-responsive' src='${APP_PATH}/inspinia/img/poster1.jpg'>" +
                "</div></div>" +
                "<div class='col-sm-6'>" +
                "<span class=\"pl\">导演：</span><span class=\"attrs\"><a href=''>"+item.director+"</a></span><br>"+
                "<span class=\"pl\">演员：</span><span class=\"attrs\"><a href=''>"+item.actors+"</a></span><br>"+
                "<span class=\"pl\">制片国家/地区：</span><span class=\"attrs\">"+item.country+"</span><br>" +
                "<span class=\"pl\">语言：</span><span class=\"attrs\">"+item.language+"</span><br>" +
                "<span class=\"pl\">上映日期：</span><span class=\"attrs\">"+item.release_time+"</span><br>" +
                "<span class=\"pl\">又名：</span><span class=\"attrs\">"+item.translation_name+"</span><br>" +
                "<span class=\"pl\">简介：</span><span class=\"attrs\">"+item.introduction+"</span><br>" +
                "<span class=\"pl\">豆瓣评分：</span><span class=\"attrs\">"+item.score+"</span><br>" +
                "</div>" +
                "<div class=\"col-sm-2\">" +
                "<div><button class=\"btn btn-info\" type=\"button\"><i class=\"fa fa-paste\"></i>  编辑</button></div><br>" +
                "<div><button class=\"btn btn-warning \" type=\"button\"><i class=\"fa fa-warning\"></i> 删除</button></div>" +
                "</div>" +
                "<div class=\"clearfix\"></div>"+
                "</div></div>";
        });
        $("#movie_info_row").html(mov_info);
    }
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，共"+
            result.extend.pageInfo.pages+"页，共"+result.extend.pageInfo.total+"条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }



        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }



        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }


</script>

</body>