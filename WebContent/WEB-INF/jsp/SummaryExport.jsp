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

    <!--Bootstrap table-->
    <link rel="stylesheet" href="Static/bootstrap-table/bootstrap-table.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <body>
    <div class="container col-md-10 col-md-offset-1 col-xs-12"  style="margin-top:10px;">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">汇总导出</h3>
        </div>
        <div class="panel-body">

          <ul class="nav nav-tabs">
            <li class="active">
              <a href="#se" data-toggle="tab">签到导出</a>
            </li>
            <%-- <li>
              <a href="#re" data-toggle="tab" disable>周报导出</a>
            </li> --%>
          </ul>
          <div class="tab-content">
              <div class="tab-pane fade in active" id="se">
                <div class="container col-md-10 col-md-offset-1 col-sm-12 col-xs-12" style="margin-bottom:15px; margin-top:15px">
                    <form class="col-sm-12 col-xs-12" action="index.html" method="post">
                      <div class="form-group">
                        <label for="year2">学期</label>
                        <select class="form-control" id="year2" onchange="function select();">
                          <option>2018</option>
                          <option>2019</option>
                          <option>2020</option>
                          <option>2021</option>
                        </select>
                      </div>

                      <div class="form-group">
                        <label for="month2">月份</label>
                        <select class="form-control" id="month2" onchange="">
                          <option value=""></option>
                          <option>1</option>
                          <option>2</option>
                          <option>3</option>
                          <option>4</option>
                          <option>5</option>
                          <option>6</option>
                          <option>7</option>
                          <option>8</option>
                          <option>9</option>
                          <option>10</option>
                          <option>11</option>
                          <option>12</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <button type="button" name="button" id="sbutton" class="btn btn-default">导出</button>
                      </div>
                    </form>
                </div>
              </div>



              <div class="tab-pane fade" id="re">
                <div class="container col-md-10 col-md-offset-1 col-sm-12 col-xs-12" style="margin-bottom:15px; margin-top:15px">
                  <form class="col-sm-12 col-xs-12" action="index.html" method="post">
                    <div class="form-group">
                      <label for="year1">年份</label>
                      <select class="form-control" id="year1" onchange="function select();">
                        <option>2018</option>
                        <option>2019</option>
                        <option>2020</option>
                        <option>2021</option>
                      </select>
                    </div>

                    <div class="form-group">
                      <label for="month1">月份</label>
                      <select class="form-control" id="month1" onchange="">
                        <option value=""></option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                      </select>
                    </div>

                    <div class="form-group">
                      <button type="button" name="button" id="1button" class="btn btn-default">导出</button>
                    </div>
                  </form>
                </div>
              </div>
          </div>



        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <%-- <script src="wr/Static/js/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> --%>
    <script src="Static/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="Static/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>


    <!-- Table Method
    ================================================== -->
    <script type="text/javascript">

    $('#rbutton').click(function(){             //TODO:添加删除后台数据的方法
      var form = $("<form>");
      form.attr("style","display:none");
      form.attr("target","");
      form.attr("method","post");
      form.attr("action","function/exportmonthsign");

      var input1 = $("<input>");
      input1.attr("type","hidden");
      input1.attr("name","year");
      input1.attr("value",$('#year1').val());

      var input2 = $("<input>");
      input2.attr("type","hidden");
      input2.attr("name","month");
      input2.attr("value",$('#month1').val());


      $('body').append(form);
      form.prepend(input1);
      form.prepend(input2);
      form.submit();
      form.remove();
    });

    $('#sbutton').click(function(){             //TODO:添加删除后台数据的方法
      var form = $("<form>");
      form.attr("style","display:none");
      form.attr("target","");
      form.attr("method","post");
      form.attr("action","function/exportmonthsign");

      var input1 = $("<input>");
      input1.attr("type","hidden");
      input1.attr("name","year");
      input1.attr("value",$('#year2').val());

      var input2 = $("<input>");
      input2.attr("type","hidden");
      input2.attr("name","month");
      input2.attr("value",$('#month2').val());


      $('body').append(form);
      form.prepend(input1);
      form.prepend(input2);
      form.submit();
      form.remove();
    });

    </script>

  </body>
</html>
