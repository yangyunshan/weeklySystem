<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="#">
    <title>Weekly Report</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

		<!--Font Awesome CSS-->
		<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">

    <!-- Custom styles for this project -->
    <link href="Static/css/style.css" rel="stylesheet">

</head>
<body>
  <div class="container col-md-10 col-md-offset-1 col-xs-12"  style="margin-top:10px;">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">系统控制(勿随意修改)</h3>
      </div>
      <div class="panel-body">
        <div class="container col-md-10 col-md-offset-1 col-sm-12 col-xs-12" style="margin-bottom:15px">
          <div class="" style="margin-bottom:20px">
            <label id="h"></label>
          </div>
          <form class="" action="index.html" method="post">
            <div class="form-group">
              <label for="year">年份</label>
              <select id="year" class="form-control" name="">
                <option value="2018">2018</option>
                <option value="2019">2019</option>
                <option value="2020">2020</option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
              </select>
            </div>
            <div class="form-group">
              <label for="half">学期</label>
              <select id="half" class="form-control" name="">
                <option value="上半年">上半年</option>
                <option value="下半年">下半年</option>
              </select>
            </div>
            <div class="form-group">
              <label for="nw">起始周数</label>
              <select id="nw" class="form-control" name="">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
              </select>
            </div>
          </form>
          <button type="button" class="btn btn-block" id="button1">确认</button>
        </div>
      </div>
      </div>
    </div>


  <%-- <script src="wr/Static/js/jquery-3.3.1.min.js"></script>
  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> --%>
  <script type="text/javascript">

  $(function(){
    initTime();
  })

    function initTime(){
      $.ajax({
        url:'function/gettime',
        type: 'get',
        async: true,
        success:function(data){
          if (data[0].nw != 0) {
            $('#h').text("系统时间:" + data[0].term + "，第" + data[0].nw + "周");
          } else {
            $('#h').text("系统时间未设定，系统未开启");
          }
        }
      })
    }


    $('#button1').click(function(){
      var m = confirm("确认修改系统时间吗？（系统运行时修改可能造成系统异常）")
      if(m == true){
        $.ajax({
              url:'function/startsystem',
              type:"post",
              data: {
                nw: $('#nw').val(),
                year: $('#year').val(),
                half: $('#half').val()
              },
              async: true,
              success:function(message){
                alert("修改成功");
                initTime();
              },
              error: function(){
                alert("网络错误");
              }
            });
          }
    });
  </script>

</body>
