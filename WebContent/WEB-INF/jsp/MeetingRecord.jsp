<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath() +"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
  	<base href=" <%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">

    <title>WeeklyReport</title>

    <!-- Bootstrap core CSS -->
    <link href="Static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

		<%-- <!--Font Awesome CSS-->
		<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"> --%>

    <!-- Custom styles for this project -->
    <link href="Static/css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style media="screen">

    </style>

  </head>

  <body>
      <div class="container col-md-10 col-md-offset-1 col-xs-12" style="margin-top:10px;">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">会议记录</h3>
          </div>
          <div class="panel-body">
            <div class="container col-md-10 col-md-offset-1 col-sm-12 col-xs-12" style="margin-bottom:15px">
              <form>
                <div class="form-group">
                  <label for="cont">内容：</label>
                  <textarea class="form-control" rows="5" cols="7" style="resize: vertical" name="cont" id="cont"></textarea>
                </div>
                <button class="btn btn-default" id="submit" type="button" >提交</button>
              </form>
            </div>
          </div>
        </div>
      </div>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <%-- <script src="wr/Static/js/jquery-3.3.1.min.js"></script>
    <script src="wr/Static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> --%>
    <script type="text/javascript">
    var nw;
    var term;

    function initTime(){
      $.ajax({
        url:"function/gettime",
        type:"get",
        async: false,
        success:function(data){
          nw = data[0].nw;
          term = data[0].term;
        }
      });
    };

    function textareaTo(str){
      var reg=new RegExp("\n","g");
      var regSpace=new RegExp(" ","g");

      str = str.replace(reg,"<br/>");
      str = str.replace(regSpace,"&nbsp;");
      return str;
    }

    $('#submit').click(function(){             //TODO:添加删除后台数据的方法
      if (nw == 0) {
        alert("系统未开启");
        return
      }
      var str = $('#cont').val();
      str = textareaTo(str);
      $.ajax({
        url: "function/submitmeetingrecord",
        type: "post",
        data:{
          content:str
        },
        contentType:"application/x-www-form-urlencoded",
        async: false,
        success:function(data){
          if(data == "success"){
            alert("提交成功");
          }
        },
        error:function(){
          alert("网络错误");
        }
      })
    });
    </script>
  </body>
</html>
