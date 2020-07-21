<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath() +"/";
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

    <!-- Custom styles for this project -->
    <link href="Static/css/style.css" rel="stylesheet">

  </head>

  <body>
      <div class="container col-md-10 col-md-offset-1 col-xs-12" style="margin-top:10px;">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">发布公告</h3>
          </div>
          <div class="panel-body">
            <div class="container col-md-10 col-md-offset-1 col-sm-12 col-xs-12" style="margin-bottom:15px">
              <form>
                <div class="form-group">
                  <label for="ntitle">标题</label>
                  <input type="text" class="form-control" id="ntitle" >
                </div>
                <div class="form-group">
                  <label for="content">公告内容：</label>
                  <textarea class="form-control" rows="5" cols="7" style="resize: vertical" name="cont" id="cont"></textarea>
                </div>
                <button class="btn btn-default" id="submit" type="button">提交</button>
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
      var c = textareaTo($('#cont').val());
      $.ajax({
        url: "function/submitnotification",
        type: "post",
        data:{
          content:c,
          title: $('#ntitle').val()
        },
        contentType:"application/x-www-form-urlencoded",
        async: false,
        success:function(data){
          if(data == "success"){
            alert("发布成功");
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
