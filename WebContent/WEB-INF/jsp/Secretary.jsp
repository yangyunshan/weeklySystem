<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/";
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
      <div class="main-header" id="header">

      </div>

      <nav class="mainnav navbar navbar-static-top main-navigation">
        <div class="container">
          <div class="row">
            <div class="col-sm-12">

              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                  <span class="sr-only">导航</span>
                  <span class="fa fa-bars"></span>
                </button>
              </div>

              <div id="navbar" class="navbar-collapse collapse" style="text-align: center;">
                <ul class="nav navbar-nav" style="display: inline-block;float: none;">
                  <li><a href="page/mainpage">首页</a></li>
                  <li><a href="javascript:void(0)" onclick="sr()">考勤审核</a></li>
                  <li><a href="javascript:void(0)" onclick="mr()">会议记录</a></li>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                      <span class="profile"></span>
                      用户
                      <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li><a href="JavaScript:void(0)" onclick="pi()">个人信息</a></li>
                      <li><a href="JavaScript:void(0)" onclick="cp()">修改密码</a></li>
                      <li class="divider"></li>
                      <li><a href="loginpage/logout.do">退出</a></li>
                    </ul>
                  </li>
                </ul>
              </div><!--/.nav-collapse -->

              </div>
            </div>
          </div>
        </nav>



        <div class="container col-sm-10 col-sm-offset-1 content" id="content">
          <div class="row">
            <div class="container col-sm-8 wrap">
              <div class="panel panel-default notification" style="background:white">
                <div class="panel-heading">
                  <h3 class="panel-title">公告</h3>
                </div>
                <div class="panel-body">
                  <article class="">
                    <h3 id="title"></h1>
                    <div class="" style="text-align: center">
                      <h id="info"></h>
                    </div>
                    <p id="articleCotent"></p>
                  </article>
                </div>
              </div>
            </div>




            <div class="container col-sm-4 panels wrap">

              <div class="panel panel-default record-panel">
                <div class="panel-heading">
                  <h3 class="panel-title">会议记录</h3>
                </div>
                <div class="panel-body">
                  <div id="body" style="height:130px">
                    <ul id="record">
                    </ul>
                  </div>
                  <div id="footer">
                    <nav style="text-align: center">
                      <ul class="pagination pagination-sm" style="text-align:center">
                          <li><a href="javascript:void(0)" onclick="queryM(1)">1</a></li>
                          <li><a href="javascript:void(0)" onclick="queryM(2)">2</a></li>
                          <li><a href="javascript:void(0)" onclick="queryM(3)">3</a></li>
                          <li><a href="javascript:void(0)" onclick="queryM(4)">4</a></li>
                          <li><a href="javascript:void(0)" onclick="queryM(5)">5</a></li>
                      </ul>
                    </nav>
                  </div>
                </div>
              </div>

              <div class="panel panel-default">
                <div class="panel-heading">
                  <h3 class="panel-title">须知</h3>
                </div>
                <div class="panel-body">
                  <p>
                    &emsp;&emsp;第一次登陆后请修改密码并填写邮箱。系统不提供注册功能，所有账户由管理员管理。
                    系统时间由管理员设定，每学期最多25周，达到25周自动关闭系统。<br/><br/>
                    一、组员：<br/>
                     1.提交周报时间为周五全天，不在时间段内不可提交。<br/>
                     2.历史周报不可修改只能查阅。<br/>
                     3.每周周报由组长审核，审核结果通过邮件通知。<br/>
                     4.审核未通过的周报必须重新提交，由组长重新审核。<br/><br/>
                     二、组长：<br/>
                     1.组长可审核本周组员周报，下载附件。<br/>
                     2.对于审核未通过的周报，组员重新提交后，组长需要重新审核。<br/><br/>
                     三、科研秘书：<br/>
                     1.科研秘书负责审核每周全体成员考勤。<br/>
                     2.科研秘书可提交会议记录。<br/>
                   </p>
                </div>
              </div>

            </div>

          </div>
        </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="Static/js/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="Static/js/mainpage.js"></script>
    <script type="text/javascript">


    $(function(){
      queryM(1);
      getFirstNotification();
    });


      function queryM(page){
        $.ajax({
          url:"function/getmeetingreportpagecutlist",
          type:"post",
          async: false,
          contentType:"application/x-www-form-urlencoded",
          data:{
            pagenum:page,
            pagecut:5
          },
          success:function(data){
            $('#record').html(" ");
            for (var i = 0; i < data.length; i++) {
               var mrid = data[i].id ;
               var year = data[i].year;
               var month = data[i].month;
               var day = data[i].day;
               var title = year + "年" + month + "月" + day + "会议记录";
               $('#record').append('<a href="javascript:void(0)" dataid = "'+ mrid +'" onclick = "mjump('+mrid+')">'+ title +'</a><br/>');
            }
          }
        })
      }

      function mjump(mrid){
        $.ajax({
          url:"function/mjump",
          type: "post",
          data:{
            mrid:mrid
          },
          contentType:"application/x-www-form-urlencoded",
          success:function(data){
            $("#content").html(data);
          }
        })
      }

      function getFirstNotification(){
        $.ajax({
          url:"function/getfirstnotification",
          type: "get",
          async: false,
          success:function(data){
            if(data == ""){
              return;
            }
            $('#title').html(data.title);
            var con = toTextarea(data.content);
            $('#articleCotent').html(con);
            $('#info').html(data.year + "年" + data.month + "月" + data.day + "日");
          }
        })
      }

      function toTextarea(str){
          var reg=new RegExp("<br/>","g");
          var regSpace=new RegExp("&nbsp;","g");
          str = str.replace(reg,"\n");
          str = str.replace(regSpace," ");
          return str;
      };


      function wr(){
        $.ajax({
          url:"page/writereport",
          type:"get",
          async: true,
          success:function(data){
            $.ajaxSetup ({ cache: false });
            $("#content").html(data);
          }
        })
      }

      function ws(){
        $.ajax({
          url:"page/writesign",
          type:"get",
          async: true,
          success:function(data){
          $("#content").html(data);
          }
        })
      }

      function cp(){
        $.ajax({
          url:"page/changepw",
          type:"get",
          async: true,
          success:function(data){
          $("#content").html(data);
          }
        })
      }

      function pi(){
        $.ajax({
            url:"page/personalinfo",
            type:"get",
            success:function(data){
              $("#content").html(data);
            }
          })
      }

      function sr(){
          $.ajax({
              url:"page/signreview",
              type:"get",
              success:function(data){
                $("#content").html(data);
              }
            })
      }

      function mr(){
          $.ajax({
              url:"page/meetingrecord",
              type:"get",
              success:function(data){
                $("#content").html(data);
              }
            })
      }

      function um(){
        $.ajax({
          url:"page/usermanage",
          type:"get",
          success:function(data){
            $("#content").html(data);
          }
        })
      }

      function dm(){
        $.ajax({
          url:"page/datamanage",
          type:"get",
          success:function(data){
            $("#content").html(data);
          }
        })
      }

      // function si(){
      //   $.ajax({
      //     url:"wr/page/signinput",
      //     type:"get",
      //     success:function(data){
      //       $("#content").html(data);
      //     }
      //   })
      // }

        function sysc(){
          $.ajax({
            url:"page/systemcontrol",
            type:"get",
            async: true,
            success:function(data){
            $("#content").html(data);
            }
          })
        }

        function rc(){
            $.ajax({
                url:"page/reportcollect",
                type:"get",
                success:function(data){
                  $("#content").html(data);
                }
              })
        }
        function sc(){
            $.ajax({
                url:"page/signcollect",
                type:"get",
                success:function(data){
                  $("#content").html(data);
                }
              })
        }
        function rs(){
          $.ajax({
            url:"page/reportsearch",
            type:"get",
            async: true,
            success:function(data){
            $("#content").html(data);
            }
          })
        }
        function se(){
          $.ajax({
            url:"page/summaryexport",
            type:"get",
            success:function(data){
              $("#content").html(data);
            }
          })
        }

        function rn(){
          $.ajax({
            url:"page/notification",
            type:"get",
            success:function(data){
              $("#content").html(data);
            }
          })
        }

        function rr(){
            $.ajax({
                url:"page/reportreview",
                type:"get",
                success:function(data){
                  $("#content").html(data);
                }
              })
        }

    </script>
  </body>
</html>
