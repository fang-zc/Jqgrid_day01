<%@page pageEncoding="UTF-8" contentType="text/html; utf-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .bg{
            background:url(img/boy.jpg) no-repeat center fixed;
            background-size:cover;
        }
    </style>
</head>
<body class="bg">
<div class="modal" id="md">
    <div class="modal-dialog modal-sm">
        <div class="modal-content" style="background-image:url(img/1.gif);background-size: cover">
            <div class="modal-header">
                请登录
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <span id="span"></span>
                        <label for="username">用户名:</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="用户名">
                    </div>
                    <div class="form-group">
                        <label for="password">密码:</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="密码">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" type="button" id="loginBtn">登录  <span class="glyphicon glyphicon-ok"></span></button>
            </div>
        </div>
    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script>
    $(function () {
        // 初始化模态框
        $('#md').modal({
            backdrop:'static'
        })

        // modal对用户可见
        $('.modal').on('shown.bs.modal', function () {
            modalOnResize(this);
        })

        //登录
        $('#loginBtn').click(function(){
            var username = $('#username').val();
            var password=$('#password').val();
            console.log(username);
            console.log(password);
            var jsObj={"username":username,"password":password};
            var json=JSON.stringify(jsObj);
            console.log(json);
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/user/login.do",
                contentType:"application/json",
                data:json,
                /*dataType:"json",*/
                success:function(data){
                    location.href="${pageContext.request.contextPath}/dept/showAllDept.do"
                },
                error:function(){
                    $("#span").html("登录失败");
                }
            });

        });



        /*// 浏览器窗口大小改变事件
        window.onresize = function(){
            // 已显示modal
            var node = $(".modal:visible");
            if (node.length) {
                modalOnResize(node);
            }
        }

        function modalOnResize(node){
            var modalHeight = ($(window).height() - $(node).find('.modal-dialog').height()) / 2;
            $(node).find('.modal-dialog').css('margin-top', modalHeight);
        }*/
    })
</script>
</body>
</html>