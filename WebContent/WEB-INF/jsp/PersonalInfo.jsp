<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">

    <title>WeeklyReport</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

		<!--Font Awesome CSS-->
		<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">

    <!-- Custom styles for this project -->
    <link href="Static/css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <body>
      <div class="container col-md-10 col-md-offset-1 col-xs-12" style="margin-top:10px;">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">个人信息</h3>
          </div>
          <div class="panel-body">
            <div class="container col-md-10 col-md-offset-1 col-sm-12 col-xs-12" style="margin-bottom:15px">

              <form>
                <div class="form-group">
                  <label for="username">用户名</label>
                  <input type="text" class="form-control" id="username" disabled>
                </div>
                <div class="form-group">
                  <label for="name">姓名</label>
                  <input type="text" class="form-control" id="name">
                </div>
                <div class="form-group">
                  <label for="email">邮箱</label>
                  <input type="text" class="form-control" id="email">
                </div>
                <button class="btn btn-default" id="change" type="button">提交</button>
              </form>

            </div>
          </div>
        </div>
      </div>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <%-- <script src="wr/Static/js/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> --%>
    <script src="Static/js/custom.js"></script>
    <script type="text/javascript">

    $(function(){
      init();
    });


    $('#change').click(function(){             //TODO:添加删除后台数据的方法
      $.ajax({
        url: "function/changepersonalinfo",
        type: "post",
        data:{
          username: $('#username').val(),
          name: $('#name').val(),
          email:$('#email').val()
        },
        contentType:"application/x-www-form-urlencoded",
        async: false,
        success:function(data){
            alert("修改成功");
        },
        error:function(){
          alert("网络错误");
        }
      })
    });

    function init(){
      $.ajax({
        url: "function/getpersonalinfo",
        type: "get",
        async: false,
        success:function(data){
          $('#username').val(data.username);
          $('#name').val(data.name);
          $('#email').val(data.email);
        },
        error:function(){
          alert("网络错误");
        }
      })
    }

    function validate(){
      $('#reportForm').bootstrapValidator({
        fields:{
          username:{
            trigger:'change',
            validators:{
              notEmpty: {//检测非空,radio也可用
                message: '必须选择'
              }
            }
          },
          name:{
            trigger:'change',
            validators:{
              notEmpty: {//检测非空,radio也可用
                message: '必须选择'
              }
            }
          }
        }
      });
    };
    </script>
  </body>
</html>
