<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>
<body>
<!--顶部导航-->
<div class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#cc">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="" class="navbar-brand">Brand</a>
        </div>
        <div class="navbar-collapse collapse" id="cc">
            <ul class="nav navbar-nav">
                <li><a href="">首页</a></li>
                <li><a href="">用户中心</a></li>
                <li><a href="">联系我们</a></li>
                <li><a href="">客服</a></li>
            </ul>
        </div>
    </div>
</div>
<!--主体内容-->
<div class="container">
    <div class="row">
        <!--左侧导航-->
        <div class="col-md-3">
            <div class="panel-group" id="acc">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <a href="#pc1" class="panel-title" data-toggle="collapse" id="deptM" data-parent="#acc">部门管理</a>
                    </div>
                    <div class="panel-collapse collapse in" id="pc1">
                        <div class="panel-body">
                            <div class="list-group">
                                <a href="#pc1" class="list-group-item" id="deptMchild" data-toggle="c">展示部门信息</a>
                                <a href="#add_dept" class="list-group-item" data-toggle="modal">添加部门</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <a href="#pc2" class="panel-title" data-toggle="collapse" id="employeeM" data-parent="#acc">员工管理</a>
                    </div>
                    <div class="panel-collapse collapse" id="pc2">
                        <div class="panel-body" style="text-align: center">
                            <div>
                                <a href="#pc2" class="btn btn-info" id="employeeMchild" style="width: 80%">展示员工信息</a>
                            </div>
                            <div style="margin-top: 15px">
                                <a href="#add_employee" data-toggle="modal" class="btn btn-info" style="width: 80%">添加员工</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <a href="#pc3" class="panel-title" data-toggle="collapse" data-parent="#acc">个人中心</a>
                    </div>
                    <div class="panel-collapse collapse" id="pc3">
                        <div class="panel-body">
                            <div class="list-group">
                                <a href="" class="list-group-item">查看用户信息</a>
                                <a href="" class="list-group-item">修改密码</a>
                                <a href="" class="list-group-item">注销</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--内容区域-->
        <div class="col-md-9">
            <!--部门信息-->
            <div class="panel panel-primary" id="dept_info">
                <div class="panel-heading">
                    <div class="page-header">
                        <h3>部门信息</h3>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="input-group">
                        <%--<form class="form-inline" action="${pageContext.request.contextPath}/dept/showAllLike.do" method="post">--%>

                            <input type="text" id="sousou" class="form-control" name="content" placeholder="请输入搜索条件">
                            <div class="input-group-btn">
                                <button class="btn btn-warning" type="submit" onclick="soufun()">搜搜</button>
                            </div>
                    </div>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>名称</th>
                            <th>职责</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="tbody">
                        <c:forEach items="${requestScope.showAllDept}" var="dept">
                            <tr>
                                <td>${dept.dept_id}</td>
                                <td>${dept.dept_name}</td>
                                <td>${dept.dept_duty}</td>
                                <td>
                                    <a href="#update_dept" data-toggle="modal"><button class="btn btn-info btn-xs" id="update_dept_bttn"  onclick="fun('${dept.dept_id}')" type="button">修改</button></a>
                                    &nbsp;
                                    <a href="${pageContext.request.contextPath}/dept/delete.do?dept_id=${dept.dept_id}"><button class="btn btn-danger btn-xs" type="button" id="deleteDept">删除</button></a>
                                </td>
                            </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                    <!--分页-->
                    <div style="text-align: center;">
                        <ul class="pagination">
                            <li><a href="">上一页</a></li>
                            <li><a href="">1</a></li>
                            <li><a href="">2</a></li>
                            <li><a href="">3</a></li>
                            <li><a href="">4</a></li>
                            <li><a href="">5</a></li>
                            <li><a href="">下一页</a></li>
                        </ul>
                    </div>

                </div>
            </div>

            <!--员工信息-->
            <div class="panel panel-primary" style="display: none" id="emp_info">
                <div class="panel-heading">
                    <div class="page-header">
                        <h3>员工信息</h3>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="input-group">
                        <input type="text" id="souemployee" class="form-control" name="content" placeholder="请输入搜索条件">
                        <div class="input-group-btn">
                            <button class="btn btn-warning" type="submit" onclick="souemployeefun()">搜搜</button>
                        </div>
                        <%--老师版本搜索--%>
                       <%-- <input type="text" class="form-control" placeholder="请输入搜索条件">
                        <div class="input-group-btn">
                            <button class="btn btn-warning" type="button" >搜搜</button>
                        </div>--%>
                    </div>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>姓名</th>
                            <th>年龄</th>
                            <th>工资</th>
                        </tr>
                        </thead>
                        <tbody id="tbody_employee">
                        <%--update_employee模态框id--%>
                        <c:forEach items="${requestScope.showAllEmployee}" var="employee">
                            <tr>
                                <td>${employee.employee_id}</td>
                                <td>${employee.name}</td>
                                <td>${employee.age}</td>
                                <td>${employee.salary}</td>
                                <td>
                                    <a href="#update_employee" data-toggle="modal"><button class="btn btn-info btn-xs" id="update_employee_bttn" onclick="employeefun('${employee.employee_id}')" type="button">修改</button></a>
    &nbsp;
                                    <button class="btn btn-danger btn-xs" type="button" id="deleteEmployee" onclick="deletefun('${employee.employee_id}')">删除</button>
                                </td>
                            </tr>
                        </c:forEach>

                        <tr>
                            <td>2</td>
                            <td>财务部</td>
                            <td>负责公司财务的规划、工资发放等</td>
                            <td>
                                <button class="btn btn-info btn-xs" type="button">修改</button>
                                &nbsp;
                                <button class="btn btn-danger btn-xs" type="button">删除</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <!--分页-->
                    <div style="text-align: center;">
                        <ul class="pagination">
                            <li><a href="">上一页</a></li>
                            <li><a href="">1</a></li>
                            <li><a href="">2</a></li>
                            <li><a href="">3</a></li>
                            <li><a href="">4</a></li>
                            <li><a href="">5</a></li>
                            <li><a href="">下一页</a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!--部门添加的模态框-->
<div class="modal fade" id="add_dept">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                添加部门
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <label for="dept_name">部门名称:</label>
                        <input type="text" class="form-control" id="dept_name" name="dept_name">
                    </div>
                    <div class="form-group">
                        <label for="dept_duty">部门职责:</label>
                        <input type="text" class="form-control" id="dept_duty" name="dept_duty">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <%----%>
                <button class="btn btn-success" type="button" id="add_dept_btn">添加  <span class="glyphicon glyphicon-ok"></span></button>
            </div>
        </div>
    </div>
</div>

<!--部门修改的模态框-->
<div class="modal fade" id="update_dept">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                修改部门
            </div>
            <div class="modal-body">
                <form action="" id="form_dept">
                    <%--<div class="form-group" style="display: none">
                        <label for="update_dept_id">部门id:</label>
                        <input type="text" class="form-control" id="update_dept_id" name="dept_name" value="${requestScope.showOneDept.dept_id}">
                    </div>
                    <div class="form-group">
                        <label for="update_dept_name">部门名称:</label>
                        <input type="text" class="form-control" id="update_dept_name" name="dept_name" value="${requestScope.showOneDept.dept_name}">
                    </div>
                    <div class="form-group">
                        <label for="dept_duty">部门职责:</label>
                        <input type="text" class="form-control" id="update_dept_duty" name="dept_duty" value="${requestScope.showOneDept.dept_duty}">
                    </div>--%>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" type="button" id="update_dept_btn">修改  <span class="glyphicon glyphicon-ok"></span></button>
            </div>
        </div>
    </div>
</div>
<%--员工修改模态框--%>
<div class="modal fade" id="update_employee">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                修改员工信息
            </div>
            <div class="modal-body">
                <form action="" id="form_employee">
                    <%--<div class="form-group" style="display:none">
                        <label for="update_employee_id">员工id:</label>
                        <input type="text" id="update_employee_id" name="employee" value="${pageContext}">
                    </div>
                    <div class="form-group">
                        <label for="update_employee_name">员工姓名:</label>
                        <input type="text" class="form-control" id="update_employee_name" name="name" value="${pageContext}">
                    </div>
                    <div class="form-group">
                        <label for="dept_duty">员工工资:</label>
                        <input type="text" class="form-control" id="update_employee_salay" name="salary" value="${pageContext}">
                    </div>
                    <div class="form-group">
                        <label for="update_employee_age">员工年龄:</label>
                        <input type="text" class="form-control" id="update_employee_age" name="age" value="${pageContext}">
                    </div>--%>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" type="button" id="update_employee_btn">修改  <span class="glyphicon glyphicon-ok"></span></button>
            </div>
        </div>
    </div>
</div>

<!--员工添加的模态框-->
<div class="modal fade" id="add_employee">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                添加员工
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <label for="employee_name">员工姓名:</label>
                        <input type="text" class="form-control" id="employee_name" name="name">
                    </div>
                    <div class="form-group">
                        <label for="employee_salary">员工工资:</label>
                        <input type="text" class="form-control" id="employee_salary" name="salary">
                    </div>
                    <div class="form-group">
                        <label for="employee_age">员工年龄:</label>
                        <input type="text" class="form-control" id="employee_age" name="age">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" type="button" id="add_employee_btn">添加  <span class="glyphicon glyphicon-ok"></span></button>
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
        //员工信息展示
        $('#pc1').on('show.bs.collapse',function () {
            $('#emp_info').css('display', 'none');
            $('#dept_info').css('display', 'block');
            // 发送ajax请求获取数据
        })
        $('#pc2').on('show.bs.collapse',function () {
            $('#dept_info').css('display', 'none');
            $('#emp_info').css('display', 'block');
        })
        //添加部门
        $('#add_dept_btn').click(function () {
            var dept_name=$("#dept_name").val();
            var dept_duty=$("#dept_duty").val();
            var dept={"dept_name":dept_name,"dept_duty":dept_duty};
            console.log(dept);
            var deptObj=JSON.stringify(dept);
            $.ajax({
                url:'${pageContext.request.contextPath}/dept/add.do',
                type:'post',
                data:deptObj,
                contentType:"application/json",
                /*dataType:'json',*/
                success:function (result) {
                    alert("添加成功");
                    console.log('ok');
                    // 关闭模态框
                    $('#add_dept').modal('hide');
                    location.href="${pageContext.request.contextPath}/dept/showAllDept.do";
                },
                error:function(){
                    alert("添加失败");
                }
            });

        });
        //添加员工
        //关闭添加模态框
        /*$('#add_employee_btn').click(function(){
            $('#add_employee').modal("hide");
        });*/

        //员工添加模态框事件
        $('#add_employee_btn').click(function () {
            var employee_name=$("#employee_name").val();
            var employee_salary=$("#employee_salary").val();
            var employee_age=$("#employee_age").val();
            var employee={"name":employee_name,"salary":employee_salary,"age":employee_age};
            console.log(employee);
            var employeeObj=JSON.stringify(employee);
            $.ajax({
                url:'${pageContext.request.contextPath}/employee/addEmployee.do',
                type:'post',
                data:employeeObj,
                contentType:"application/json",
                /*dataType:'json',*/
                success:function (result) {
                    alert("添加成功");
                    console.log('ok');
                    // 关闭模态框
                    $('#add_employee').modal('hide');
                    /*location.href="../dept/showAllDept.do";*/
                },
                error:function(){
                    alert("添加失败");
                }
            });

        });
        //绑定员工添加模态框事件
        $('#add_employee').on('hide.bs.modal',function(){
            var t2;

            $.ajax({
                url:'${pageContext.request.contextPath}/employee/showAllEmployeeAjax.do',
                type:'post',
                dataType:'json',
                success:function(data){
                    for(var i=0;i<data.length;i++){
                            t2+="<tr>\n" +
                                "                                <td>"+data[i].employee_id+"</td>\n" +
                                "                                <td>"+data[i].name+"</td>\n" +
                                "                                <td>"+data[i].age+"</td>\n" +
                                "                                <td>"+data[i].salary+"</td>\n" +
                                "                                <td>\n" +
                                "                                    <a href=\"#update_employee\" data-toggle=\"modal\"><button class=\"btn btn-info btn-xs\" id=\"update_employee_bttn\" onclick=\"employeefun('"+data[i].employee_id+"')\" type=\"button\">修改</button></a>\n" +
                                "    &nbsp;\n" +
                                "                                    <button class=\"btn btn-danger btn-xs\" type=\"button\" id=\"deleteEmployee\" onclick=\"deletefun('"+data[i].employee_id+"')\">删除</button>\n" +
                                "                                </td>\n" +
                                "                            </tr>";
                    }
                    $("#tbody_employee").html(t2);

                },
                error:function(){
                    alert("添加完成后展示所有失败");
                }
            });
        });
        //更新dept信息
        $('#update_dept_btn').click(function () {
            var dept_name=$("#update_dept_name").val();
            var dept_duty=$("#update_dept_duty").val();
            var dept_id=$("#update_dept_id").val();
            var dept={"dept_id":dept_id,"dept_name":dept_name,"dept_duty":dept_duty};
            console.log(dept);
            var deptObj=JSON.stringify(dept);
            $.ajax({
                url:'${pageContext.request.contextPath}/dept/update.do',
                type:'post',
                data:deptObj,
                contentType:"application/json",
                /*dataType:'json',*/
                success:function (result) {
                    alert("修改成功");
                    console.log('ok');
                    // 关闭模态框
                    $('#update_dept').modal('hide');
                    location.href="${pageContext.request.contextPath}/dept/showAllDept.do";
                },
                error:function(){
                    alert("修改失败");
                }
            });

        });
        //修改员工信息 update_employee_btn
        $('#update_employee_btn').click(function () {
            var employee_id=$("#update_employee_id").val();
            var name=$("#update_employee_name").val();
            var salary=$("#update_employee_salary").val();
            var age=$("#update_employee_age").val();
            var employee={"employee_id":employee_id,"name":name,"salary":salary,"age":age};
            console.log(employee);
            var deptObj=JSON.stringify(employee);
            $.ajax({
                url:'${pageContext.request.contextPath}/employee/updateEmployee.do',
                type:'post',
                data:deptObj,
                contentType:"application/json",
                /*dataType:'json',*/
                success:function (result) {
                    alert("修改成功");
                    console.log('ok');
                    // 关闭模态框
                    $('#update_employee').modal('hide');
                    /*location.href="/employee/showAllEmployee.do";*/
                },
                error:function(){
                    alert("修改失败");
                }
            });

        });
        //绑定员工修改关闭
        $('#update_employee').on('hide.bs.modal',function(){
            var t1;
            $.ajax({
                url:'${pageContext.request.contextPath}/employee/showAllEmployeeAjax.do',
                type:'post',
                dataType:'json',
                success:function(data){
                    for(var i=0;i<data.length;i++){
                        t1+="<tr>\n" +
                            "                                <td>"+data[i].employee_id+"</td>\n" +
                            "                                <td>"+data[i].name+"</td>\n" +
                            "                                <td>"+data[i].age+"</td>\n" +
                            "                                <td>"+data[i].salary+"</td>\n" +
                            "                                <td>\n" +
                            "                                    <a href=\"#update_employee\" data-toggle=\"modal\"><button class=\"btn btn-info btn-xs\" id=\"update_employee_bttn\" onclick=\"employeefun('"+data[i].employee_id+"')\" type=\"button\">修改</button></a>\n" +
                            "    &nbsp;\n" +
                            "                                    <button class=\"btn btn-danger btn-xs\" type=\"button\" id=\"deleteEmployee\" onclick=\"deletefun('"+data[i].employee_id+"')\">删除</button>\n" +
                            "                                </td>\n" +
                            "                            </tr>";
                    }
                    $('#tbody_employee').html(t1);
                }
            });
        });
        //部门展示deptM
        $('#deptM').click(function () {
            $.ajax({
                url:'${pageContext.request.contextPath}/dept/showAllDeptAjax.do',
                type:'post',
                /*contentType:"application/json",*/
                dataType:'json',
                success:function (data) {
                    console.log(data.length);
                    var count=0;
                    var t1;

                    for(var i=0;i<data.length;i++){
                        t1+="<tr>\n" +
                            "                                <td>"+data[i].dept_id+"</td>\n" +
                            "                                <td>"+data[i].dept_name+"</td>\n" +
                            "                                <td>"+data[i].dept_duty+"</td>\n" +
                            "                                <td>\n" +
                            "                                    <a href=\"#update_dept\" data-toggle=\"modal\"><button class=\"btn btn-info btn-xs\" id=\"update_dept_bttn\"  onclick=\"fun('"+data[i].dept_id+"')\" type=\"button\">修改</button></a>\n" +
                            "                                    &nbsp;\n" +
                            "                                    <a href=\"${pageContext.request.contextPath}/dept/delete.do?dept_id="+data[i].dept_id+"\"><button class=\"btn btn-danger btn-xs\" type=\"button\" id=\"deleteDept\">删除</button></a>\n" +
                            "                                </td>\n" +
                            "                            </tr>";
                        count++;

                    }
                    $("#tbody").html(t1);

                    console.log(count);
                },
                error:function(){
                    alert("部门展示失败");
                }
            });
        });
        //展示部门信息
        $('#deptMchild').click(function () {
            $.ajax({
                url:'${pageContext.request.contextPath}/dept/showAllDeptAjax.do',
                type:'post',
                /*contentType:"application/json",*/
                dataType:'json',
                success:function (data) {
                    console.log(data.length);
                    var count=0;
                    var t1;
                    for(var i=0;i<data.length;i++){
                        t1+="<tr>\n" +
                            "                                <td>"+data[i].dept_id+"</td>\n" +
                            "                                <td>"+data[i].dept_name+"</td>\n" +
                            "                                <td>"+data[i].dept_duty+"</td>\n" +
                            "                                <td>\n" +
                            "                                    <a href=\"#update_dept\" data-toggle=\"modal\"><button class=\"btn btn-info btn-xs\" id=\"update_dept_bttn\"  onclick=\"fun('"+data[i].dept_id+"')\" type=\"button\">修改</button></a>\n" +
                            "                                    &nbsp;\n" +
                            "                                    <a href=\"${pageContext.request.contextPath}/dept/delete.do?dept_id="+data[i].dept_id+"\"><button class=\"btn btn-danger btn-xs\" type=\"button\" id=\"deleteDept\">删除</button></a>\n" +
                            "                                </td>\n" +
                            "                            </tr>";
                        count++;
                    }
                    $("#tbody").html(t1);
                    console.log(count);
                },
                error:function(){
                    alert("部门展示失败");
                }
            });
        });
        //员工展示employeeM
        $('#employeeM').click(function () {
            $.ajax({
                url:'${pageContext.request.contextPath}/employee/showAllEmployeeAjax.do',
                type:'post',
                /*contentType:"application/json",*/
                dataType:'json',
                success:function (data) {
                    console.log(data.length);
                    var count=0;
                    var t2;
                    for(var i=0;i<data.length;i++){
                        t2+="<tr>\n" +
                            "                                <td>"+data[i].employee_id+"</td>\n" +
                            "                                <td>"+data[i].name+"</td>\n" +
                            "                                <td>"+data[i].age+"</td>\n" +
                            "                                <td>"+data[i].salary+"</td>\n" +
                            "                                <td>\n" +
                            "                                    <a href=\"#update_employee\" data-toggle=\"modal\"><button class=\"btn btn-info btn-xs\" id=\"update_employee_bttn\" onclick=\"employeefun('"+data[i].employee_id+"')\" type=\"button\">修改</button></a>\n" +
                            "    &nbsp;\n" +
                            "                                    <button class=\"btn btn-danger btn-xs\" type=\"button\" id=\"deleteEmployee\" onclick=\"deletefun('"+data[i].employee_id+"')\">删除</button>\n" +
                            "                                </td>\n" +
                            "                            </tr>";
                        count++;
                    }
                    $("#tbody_employee").html(t2);
                    console.log(count);
                },
                error:function(){
                    alert("员工展示失败");
                }
            });
        });
        //展示员工信息
        $('#employeeMchild').click(function () {
            $.ajax({
                url:'${pageContext.request.contextPath}/employee/showAllEmployeeAjax.do',
                type:'post',
                /*contentType:"application/json",*/
                dataType:'json',
                success:function (data) {
                    console.log(data.length);
                    var count=0;
                    var t2;
                    for(var i=0;i<data.length;i++){
                        t2+="<tr>\n" +
                            "                                <td>"+data[i].employee_id+"</td>\n" +
                            "                                <td>"+data[i].name+"</td>\n" +
                            "                                <td>"+data[i].age+"</td>\n" +
                            "                                <td>"+data[i].salary+"</td>\n" +
                            "                                <td>\n" +
                            "                                    <a href=\"#update_employee\" data-toggle=\"modal\"><button class=\"btn btn-info btn-xs\" id=\"update_employee_bttn\" onclick=\"employeefun('"+data[i].employee_id+"')\" type=\"button\">修改</button></a>\n" +
                            "    &nbsp;\n" +
                            "                                    <button class=\"btn btn-danger btn-xs\" type=\"button\" id=\"deleteEmployee\" onclick=\"deletefun('"+data[i].employee_id+"')\">删除</button>\n" +
                            "                                </td>\n" +
                            "                            </tr>";
                        count++;
                    }
                    $("#tbody_employee").html(t2);
                    console.log(count);
                },
                error:function(){
                    alert("员工展示失败");
                }
            });
        });

        // 绑定关闭模态框的事件
        $('#add_employee').on('hide.bs.modal',function () {
            // 重新加载一下数据
            $('#employeeM').click(function () {
                $.ajax({
                    url:'${pageContext.request.contextPath}/employee/showAllEmployeeAjax.do',
                    type:'post',
                    /*contentType:"application/json",*/
                    dataType:'json',
                    success:function (data) {
                        console.log(data.length);
                        var count=0;
                        var t2;
                        for(var i=0;i<data.length;i++){
                            t2+="<tr>\n" +
                                "                                <td>"+data[i].employee_id+"</td>\n" +
                                "                                <td>"+data[i].name+"</td>\n" +
                                "                                <td>"+data[i].age+"</td>\n" +
                                "                                <td>"+data[i].salary+"</td>\n" +
                                "                                <td>\n" +
                                "                                    <a href=\"#update_employee\" data-toggle=\"modal\"><button class=\"btn btn-info btn-xs\" id=\"update_employee_bttn\" onclick=\"employeefun('"+data[i].employee_id+"')\" type=\"button\">修改</button></a>\n" +
                                "    &nbsp;\n" +
                                "                                    <button class=\"btn btn-danger btn-xs\" type=\"button\" id=\"deleteEmployee\" onclick=\"deletefun('"+data[i].employee_id+"')\">删除</button>\n" +
                                "                                </td>\n" +
                                "                            </tr>";
                            count++;

                        }
                        $("#tbody_employee").html(t2);
                        console.log(count);
                    },
                    error:function(){
                        alert("员工展示失败");
                    }
                });
            });

        });

        $("#update_dept_bttn").click(function(i){
            console.log($(i).val());
            /*var dept_id=$("#").val();*/
            var json=JSON.stringify(dept_id);
            console.log(dept_id);
            $.ajax({
                url:'${pageContext.request.contextPath}/dept/showOneDeptAjax.do',
                type:'post',
                data:json,
                contentType:"application/json",
                dataType:'json',
                success:function (data) {
                    console.log(data);
                    $("#update_dept").modal({

                    });
                },
                error:function(){
                    alert("部门更新展示失败");
                }
            });
            console.log("show modal");
        });
        /*$("#md").modal();  //触发模态框
        //backdrop:"static", //static 点击模态框外面 不会使模态消失
        show:true,
            remote:"myshow.html" //引入外界资源*/
        $("#md").on('hide.bs.modal',function(){
            console.log("hide modal");
        });

    })
    //修改部门
    //更新部门信息
    function fun(i){
        console.log("部门id："+i);
        var json = JSON.stringify(i);
        console.log(json);
        $.ajax({
            url:'${pageContext.request.contextPath}/dept/showOneDeptAjax.do',
            type:'post',
            data:json,
            contentType:'application/json',
            dataType:'json',
            success:function(data){
                console.log(data);

                $("#form_dept").html("<div class=\"form-group\" style=\"display: none\">\n" +
                    "                    <label for=\"update_dept_id\">部门id:</label>\n" +
                    "                <input type=\"text\" class=\"form-control\" id=\"update_dept_id\" name=\"dept_name\" value=\""+data.dept_id+"\">\n" +
                    "                    </div>\n" +
                    "                    <div class=\"form-group\">\n" +
                    "                    <label for=\"update_dept_name\">部门名称:</label>\n" +
                    "                <input type=\"text\" class=\"form-control\" id=\"update_dept_name\" name=\"dept_name\" value=\""+data.dept_name+"\">\n" +
                    "                    </div>\n" +
                    "                    <div class=\"form-group\">\n" +
                    "                    <label for=\"dept_duty\">部门职责:</label>\n" +
                    "                <input type=\"text\" class=\"form-control\" id=\"update_dept_duty\" name=\"dept_duty\" value=\""+data.dept_duty+"\">\n" +
                    "                    </div>")
            },

            error:function(){
                alert("修改展示失败");
            }
        })
    }
    //更新员工信息
    function employeefun(i){
        alert('进来了');
        var employee_id = JSON.stringify(i);
        console.log(employee_id);
        var t1;
        $.ajax({
            url:'${pageContext.request.contextPath}/employee/showOneEmployeeAjax.do',
            type:'post',
            data:employee_id,
            contentType:'application/json',
            dataType:'json',
            success:function(data){
                t1+="<div class=\"form-group\" style=\"display:none\">\n" +
                    "                        <label for=\"update_employee_id\">员工id:</label>\n" +
                    "                        <input type=\"text\" id=\"update_employee_id\" name=\"employee\" value=\""+data.employee_id+"\">\n" +
                    "                    </div>\n" +
                    "                    <div class=\"form-group\">\n" +
                    "                        <label for=\"update_employee_name\">员工姓名:</label>\n" +
                    "                        <input type=\"text\" class=\"form-control\" id=\"update_employee_name\" name=\"name\" value=\""+data.name+"\">\n" +
                    "                    </div>\n" +
                    "                    <div class=\"form-group\">\n" +
                    "                        <label for=\"dept_duty\">员工工资:</label>\n" +
                    "                        <input type=\"text\" class=\"form-control\" id=\"update_employee_salary\" name=\"salary\" value=\""+data.salary+"\">\n" +
                    "                    </div>\n" +
                    "                    <div class=\"form-group\">\n" +
                    "                        <label for=\"update_employee_age\">员工年龄:</label>\n" +
                    "                        <input type=\"text\" class=\"form-control\" id=\"update_employee_age\" name=\"age\" value=\""+data.age+"\">\n" +
                    "                    </div>";

                $('#form_employee').html(t1);
            },
            error:function(){
                alert("修改时信息展示失败！");
            }
        });

    }
    //删除员工id="deleteEmployee"
    function deletefun(i){
        var employee_id = JSON.stringify(i);
        console.log(employee_id);
        var t1;
        $.ajax({
            url:'${pageContext.request.contextPath}/employee/deleteEmployee.do',
            type:'post',
            data:employee_id,
            contentType:'application/json',
            /*dataType:'json',*/
            success:function(data){
                console.log("展示所有")
                //员工展示employeeM
                    $.ajax({
                        url:'${pageContext.request.contextPath}/employee/showAllEmployeeAjax.do',
                        type:'post',
                        /*contentType:"application/json",*/
                        dataType:'json',
                        success:function (data) {
                            console.log("展示所有");
                            console.log(data.length);
                            var count=0;
                            var t2;
                            for(var i=0;i<data.length;i++){
                                t2+="<tr>\n" +
                                    "                                <td>"+data[i].employee_id+"</td>\n" +
                                    "                                <td>"+data[i].name+"</td>\n" +
                                    "                                <td>"+data[i].age+"</td>\n" +
                                    "                                <td>"+data[i].salary+"</td>\n" +
                                    "                                <td>\n" +
                                    "                                    <a href=\"#update_employee\" data-toggle=\"modal\"><button class=\"btn btn-info btn-xs\" id=\"update_employee_bttn\" onclick=\"employeefun('"+data[i].employee_id+"')\" type=\"button\">修改</button></a>\n" +
                                    "    &nbsp;\n" +
                                    "                                    <button class=\"btn btn-danger btn-xs\" type=\"button\" id=\"deleteEmployee\" onclick=\"deletefun('"+data[i].employee_id+"')\">删除</button>\n" +
                                    "                                </td>\n" +
                                    "                            </tr>";
                                count++;
                            }
                            $("#tbody_employee").html(t2);
                            console.log(count);
                        },
                        error:function(){
                            alert("员工展示失败");
                        }

                });
            },
            error:function(){
                alert("修改时信息展示失败！");
            }
        });
    }
    //搜索部门
    function soufun() {
        var query = $('#sousou').val();
        console.log(query);
        //var s = JSON.stringify(query);
        $.ajax({
            url:'${pageContext.request.contextPath}/dept/showAllLike.do',
            type:'post',
            data:"content="+query,
            //contentType:'application/json',
            success:function(data){
                var t1;
                for(var i=0;i<data.length;i++){
                    t1+="<tr>\n" +
                        "                                <td>"+data[i].dept_id+"</td>\n" +
                        "                                <td>"+data[i].dept_name+"</td>\n" +
                        "                                <td>"+data[i].dept_duty+"</td>\n" +
                        "                                <td>\n" +
                        "                                    <a href=\"#update_dept\" data-toggle=\"modal\"><button class=\"btn btn-info btn-xs\" id=\"update_dept_bttn\"  onclick=\"fun('"+data[i].dept_id+"')\" type=\"button\">修改</button></a>\n" +
                        "                                    &nbsp;\n" +
                        "                                    <a href=\"${pageContext.request.contextPath}/dept/delete.do?dept_id="+data[i].dept_id+"\"><button class=\"btn btn-danger btn-xs\" type=\"button\" id=\"deleteDept\">删除</button></a>\n" +
                        "                                </td>\n" +
                        "                            </tr>";
                }
                $("#tbody").html(t1);
            },
            errot:function(){
                alert("部门搜索成功");
            }
        });
    }
    //搜索员工
    function souemployeefun(){
        var query = $('#souemployee').val();
        console.log(query);
        //var s = JSON.stringify(query);
        $.ajax({
            url:'${pageContext.request.contextPath}/employee/showAllEmployeeLike.do',
            type:'post',
            data:"content="+query,
            //contentType:'application/json',
            success:function(data){
                /*$("#tbody_employee").empty();*/
                console.log(data);
                var t1;
                for(var i=0;i<data.length;i++){
                    t1+="<tr>\n" +
                        "                                <td>"+data[i].employee_id+"</td>\n" +
                        "                                <td>"+data[i].name+"</td>\n" +
                        "                                <td>"+data[i].age+"</td>\n" +
                        "                                <td>"+data[i].salary+"</td>\n" +
                        "                                <td>\n" +
                        "                                    <a href=\"#update_employee\" data-toggle=\"modal\"><button class=\"btn btn-info btn-xs\" id=\"update_employee_bttn\" onclick=\"employeefun('"+data[i].employee_id+"')\" type=\"button\">修改</button></a>\n" +
                        "    &nbsp;\n" +
                        "                                    <button class=\"btn btn-danger btn-xs\" type=\"button\" id=\"deleteEmployee\" onclick=\"deletefun('"+data[i].employee_id+"')\">删除</button>\n" +
                        "                                </td>\n" +
                        "                            </tr>";
                }
                $('#tbody_employee').html(t1);
            },
            errot:function(){
                alert("员工搜索成功");
            }
        });
    }
</script>
</body>
</html>















