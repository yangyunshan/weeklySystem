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
          <h3 class="panel-title">本周签到信息</h3>
        </div>
        <div class="panel-body">
          <ul class="nav nav-tabs">
            <li class="active">
              <a href="#reportManage" data-toggle="tab">周报管理</a>
            </li>
            <li>
              <a href="#signManage" data-toggle="tab">签到管理</a>
            </li>
            <li>
              <a href="#NotificationManage" data-toggle="tab">公告管理</a>
            </li>
            <li>
              <a href="#MeetingRecordManage" data-toggle="tab">会议记录管理</a>
            </li>
          </ul>
          <div class="tab-content">
              <div class="tab-pane fade in active" id="reportManage">
                <div class="container col-md-10 col-md-offset-1 col-sm-12 col-xs-12" style="margin-bottom:15px; margin-top:15px">
                  <div class="col-md-3 col-sm-3 col-xs-3">
                    <select class="form-control" id="term1">
                      <option>2018上半年</option>
                      <option>2018下半年</option>
                      <option>2019上半年</option>
                      <option>2019下半年</option>
                      <option>2020上半年</option>
                      <option>2020下半年</option>
                    </select>
                  </div>
                  <div class="col-md-3 col-sm-3 col-xs-3 pull-right">
                    <select class="form-control" id="nw1">
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
                      <option>13</option>
                      <option>14</option>
                      <option>15</option>
                      <option>16</option>
                      <option>17</option>
                      <option>18</option>
                      <option>19</option>
                      <option>20</option>
                      <option>21</option>
                      <option>22</option>
                      <option>23</option>
                      <option>24</option>
                      <option>25</option>
                    </select>
                  </div>
                </div>


                <table id="td_report"></table>
              </div>

              <div class="tab-pane fade" id="signManage">
                <div class="container col-md-10 col-md-offset-1 col-sm-12 col-xs-12" style="margin-bottom:15px; margin-top:15px">
                  <div class="col-md-3 col-sm-3 col-xs-3">
                    <select class="form-control" id="term2">
                      <option>2018上半年</option>
                      <option>2018下半年</option>
                      <option>2019上半年</option>
                      <option>2019下半年</option>
                      <option>2020上半年</option>
                      <option>2020下半年</option>
                    </select>
                  </div>
                  <div class="col-md-3 col-sm-3 col-xs-3 pull-right">
                    <select class="form-control" id="nw2">
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
                      <option>13</option>
                      <option>14</option>
                      <option>15</option>
                      <option>16</option>
                      <option>17</option>
                      <option>18</option>
                      <option>19</option>
                      <option>20</option>
                      <option>21</option>
                      <option>22</option>
                      <option>23</option>
                      <option>24</option>
                      <option>25</option>
                    </select>
                  </div>
                </div>

                <table id="td_sign"></table>
              </div>


              <div class="tab-pane fade" id="NotificationManage">
                <div class="container col-md-10 col-md-offset-1 col-sm-12 col-xs-12" style="margin-bottom:15px; margin-top:15px">
                  <table id="td_N"></table>
                </div>
              </div>


              <div class="tab-pane fade" id="MeetingRecordManage">
                <div class="container col-md-10 col-md-offset-1 col-sm-12 col-xs-12" style="margin-bottom:15px; margin-top:15px">
                  <table id="td_MR"></table>
                </div>
              </div>
          </div>
        </div>
      </div>
    </div>


    <!-- 编辑模态框 -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog">
      <div class="modal-dialog" style="width:800px">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="">本周汇报</h4>
          </div>
          <div class="modal-body col-md-12">
            <form class="col-md-12" id="rform" name="rform">
              <div class="form-group col-md-4">
                <label for="dtp_input1" class="control-label">起始日期</label>
                <div class="input-group form_date date" data-date="" data-date-format="yyyy-MM-dd">
                  <input class="form-control" size="16" type="text" name="startDate" id="sdate" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
              </div>
              <div class="form-group col-md-4 pull-right">
                <label for="dtp_input2" class="control-label">终止日期</label>
                <div class="input-group date form_date" data-date="" data-date-format="yyyy-MM-dd">
                  <input class="form-control" size="16" type="text" name="endDate" id="edate" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
              </div>
              <div class="form-group col-md-12">
                <label for="">1.上周计划做什么</label>
                <textarea class="form-control" rows="5" cols="7" style="resize: vertical" name="lplan" id="lplan"></textarea>
              </div>
              <div class="form-group col-md-12">
                <label for="">2.今周完成了什么</label>
                <textarea class="form-control" rows="5" cols="7" style="resize: vertical" name="done" id="done"></textarea>
              </div>
              <div class="form-group col-md-12">
                <label for="">3.今周有什么总结</label>
                <div id="div3" style="border: 1px solid #ccc; border-bottom:0px; background:#f5f5f5;"></div>
                <div id="div4" style="border: 1px solid #ccc; border-top:0px; height:300px; color: #555; background-color: #fff;"></div>
              </div>
              <div class="form-group col-md-12">
                <label for="">4.下周计划做什么</label>
                <textarea class="form-control" rows="5" cols="7" style="resize: vertical" name="nplan" id="nplan"></textarea>
              </div>
              <div class="form-group col-md-12">
                <label for="">5.今周阅读了什么</label>
                <textarea class="form-control" rows="5" cols="7" style="resize: vertical" name="lread" id="lread"></textarea>
              </div>
              <div class="form-group col-md-12">
                <label for="">6.下周计划阅读什么</label>
                <textarea class="form-control" rows="5" cols="7" style="resize: vertical" name="nread" id="nread"></textarea>
              </div>
              <div class="form-group col-md-12 ">
                <input id="finput" type="file" multiple class="file-loading" name="file">
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
            <button type="button" class="btn btn-primary" id="btn_save" ><i class="fa fa-save"></i>保存</button>
          </div>
        </div>
      </div>
    </div>

    <!--删除操作模态框-->
    <div class="modal fade" id="removeModal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="editModalLabel">删除</h4>
          </div>
          <div class="modal-body">
            <strong id="removeText"></strong>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            <button id="removeBtn" type="button" class="btn btn-danger">删除</button>
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
      $(function(){
        //加载签到管理表格
        initTime();
        var osignTable = new SignTableInit();
        osignTable.Init();
        //加载周报管理表格
        var oreportTable = new ReportTable();
        oreportTable.Init();
        initNTable();
        initMRTable();
      })


      function initTime(){
        $.ajax({
          url:"function/gettime",
          type:"get",
          async: false,
          success:function(data){
            nownw = data[0].nw;
            nowterm = data[0].term;
            $('#term1').val(data[0].term);
            $('#nw1').val(data[0].nw);
            $('#term2').val(data[0].term);
            $('#nw2').val(data[0].nw);
          }
        });
      };

      function textareaTo(str){
        var reg=new RegExp("\n","g");
        var regSpace=new RegExp(" ","g");

        str = str.replace(reg,"<br/>");
        str = str.replace(regSpace,"&nbsp;");
        return str;
      };

      function toTextarea(str){
      var reg=new RegExp("<br/>","g");
      var regSpace=new RegExp("&nbsp;","g");
      str = str.replace(reg,"\n");
      str = str.replace(regSpace," ");
      return str;
    };

      //表格初始化方法
      var SignTableInit = function () {
          var osignTableInit = new Object();
          osignTableInit.Init = function () {
              $('#td_sign').bootstrapTable({
                  url: "function/getallusersign",                  //请求后台的URL（*）//bootstrap table要求的数据要有rows和total
                  method: "post",                      //请求方式（*）
                  cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                  pagination: true,                   //是否显示分页（*）
                  sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
                  //responseHandler:responseHandler自定义来生成total和row字段
                  //dataField:"data",设置接口返回值中用于填充表格数据的字段
                  contentType: "application/x-www-form-urlencoded",
                  pageNumber: 1,                       //初始化加载第一页，默认第一页
                  pageSize: 10,                       //每页的记录行数（*）
                  pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                  uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                  queryParams : function (params) {
                    var temp = {
                      term: $('#term2').val(),
                      nw: $('#nw2').val()
                    };
                    return temp;
                  },
                  columns: [ {
                      field: "name",
                      title: "姓名",
                      align: "center",
                      valign: "middle"
                  },{
                      field: "nw",
                      title: "周数",
                      align: "center",
                      valign: "middle"
                  },{
                      field: "totalTime",
                      title: "时间",
                      align: "center",
                      valign: "middle"
                  }, {
                    field: "late",
                    title: "迟到",
                    align: "center",
                    valign: "middle"
                  },{
                    field: "dayoff",
                    title: "请假",
                    align: "center",
                    valign: "middle"
                  },{
                    field:"operation",
                    title:"编辑",
                    align: "center",
                    valign: "middle",
                    formatter: function(value, row, index) {
                      var ret = "<button class='btn btn-danger' id='removeTable' style='margin-left:10px'><i class='fa fa-remove'>删除</i></button>";
                      return ret;
                    },
                    //这里是一个监听对象，描述发生一定动作后执行的操作，这里是click动作生成模态框
                    events:{
                      //删除操作
                      'click #removeTable':function(e, value, row, index){
                          $('#removeText').text("是否删除" + row.name + "本周签到数据？");
                          $('#removeBtn').click(function(){             //TODO:添加删除后台数据的方法
                            $.ajax({
                              url: "function/deletesign",
                              type: "post",
                              data:{
                                name: row.name,
                                nw: row.nw,
                                term: row.term
                              },
                              contentType:"application/x-www-form-urlencoded",
                              async: true,
                              success:function(){
                                $('#removeModal').modal('hide');
                                $("#td_sign").bootstrapTable('refresh');
                              },
                              error:function(){
                                alert("网络错误");
                              }
                            })
                          });
                          $('#removeModal').modal();
                      }
                    }
                  },
                  ],
              });
          };
          return osignTableInit;
      };

      var ReportTable = function(){                    //TODO:加入搜索功能
          var oreportTableInit = new Object();
          oreportTableInit.Init = function () {
              $('#td_report').bootstrapTable({
                  url: "function/getalluserreport",                  //请求后台的URL（*）//bootstrap table要求的数据要有rows和total
                  method: "post",                      //请求方式（*）
                  cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                  pagination: true,                   //是否显示分页（*）
                  sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
                  contentType: "application/x-www-form-urlencoded",
                  pageNumber: 1,                       //初始化加载第一页，默认第一页
                  pageSize: 10,                       //每页的记录行数（*）
                  pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                  uniqueId: "ID",
                  queryParams : function (params) {
                    var temp = {
                      term: $('#term1').val(),
                      nw: $('#nw1').val()
                    };
                    return temp;
                  },
                  columns: [ {
                      field: "name",
                      title: "姓名"
                  },{
                      field: "nw",
                      title: "周数"
                  },{
                      field: "term",
                      title: "学期"
                  },{
                    field:"operation",
                    title:"编辑",
                    formatter: function(value, row, index) {
                      var ret = "<button class='btn btn-danger' id='removeTable' style='margin-left:10px'><i class='fa fa-remove'>删除</i></button>";
                      return ret;
                    },
                    //这里是一个监听对象，描述发生一定动作后执行的操作，这里是click动作生成模态框
                    events:{
                      //删除操作
                      'click #removeTable':function(e, value, row, index){
                        $('#removeText').text("是否删除");
                        $('#removeBtn').click(function(){             //TODO:添加删除后台数据的方法
                          $.ajax({
                            url: "function/deleterep",
                            type: "post",
                            data:{
                              name: row.name,
                              nw: row.nw,
                              term: row.term
                            },
                            contentType:"application/x-www-form-urlencoded",
                            async: true,
                            success:function(){
                              $('#removeModal').modal('hide');
                              $("#td_report").bootstrapTable('refresh');
                            },
                            error:function(){
                              alert("网络错误");
                            }
                          })
                        });
                       $('#removeModal').modal();
                      }
                    }
                  },
                  ],
              });
          };
          return oreportTableInit;
      };

      function initNTable(){
        $('#td_N').bootstrapTable({
          url: "function/getallnotications",                  //请求后台的URL（*）//bootstrap table要求的数据要有rows和total
          method: "get",                      //请求方式（*）
          cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
          pagination: true,                   //是否显示分页（*）
          sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
          contentType: "application/x-www-form-urlencoded",
          pageNumber: 1,                       //初始化加载第一页，默认第一页
          pageSize: 10,                       //每页的记录行数（*）
          pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
          uniqueId: "ID",
          columns: [ {
              field: "title",
              title: "标题"
          },{
              field: "id",
              title: "ID"
          },{
              field: "year",
              title: "年"
          },{
              field: "month",
              title: "月"
          },{
              field: "day",
              title: "日"
          },{
            field:"operation",
            title:"编辑",
            formatter: function(value, row, index) {
              var ret = "<button class='btn btn-danger' id='removeTable' style='margin-left:10px'><i class='fa fa-remove'>删除</i></button>";
              return ret;
            },
            //这里是一个监听对象，描述发生一定动作后执行的操作，这里是click动作生成模态框
            events:{
              //删除操作
              'click #removeTable':function(e, value, row, index){
                $('#removeText').text("是否删除");
                $('#removeBtn').click(function(){             //TODO:添加删除后台数据的方法
                  $.ajax({
                    url: "function/deletenotification",
                    type: "post",
                    data:{
                      id: row.id,
                    },
                    contentType:"application/x-www-form-urlencoded",
                    async: true,
                    success:function(){
                      $('#removeModal').modal('hide');
                      $("#td_N").bootstrapTable('refresh');
                    },
                    error:function(){
                      alert("网络错误");
                    }
                  })
                });
               $('#removeModal').modal();
              }
            }
          },
          ],
        })
      };

      function initMRTable(){
        $('#td_MR').bootstrapTable({
          url: "function/getallmeetingrecords",                  //请求后台的URL（*）//bootstrap table要求的数据要有rows和total
          method: "get",                      //请求方式（*）
          cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
          pagination: true,                   //是否显示分页（*）
          sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
          contentType: "application/x-www-form-urlencoded",
          pageNumber: 1,                       //初始化加载第一页，默认第一页
          pageSize: 10,                       //每页的记录行数（*）
          pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
          uniqueId: "ID",
          columns: [ {
              field: "id",
              title: "ID"
          },{
              field: "year",
              title: "年"
          },{
              field: "month",
              title: "月"
          },{
            field:"operation",
            title:"编辑",
            formatter: function(value, row, index) {
              var ret = "<button class='btn btn-danger' id='removeTable' style='margin-left:10px'><i class='fa fa-remove'>删除</i></button>";
              return ret;
            },
            //这里是一个监听对象，描述发生一定动作后执行的操作，这里是click动作生成模态框
            events:{
              //删除操作
              'click #removeTable':function(e, value, row, index){
                $('#removeText').text("是否删除");
                $('#removeBtn').click(function(){             //TODO:添加删除后台数据的方法
                  $.ajax({
                    url: "function/deletemeetingrecord",
                    type: "post",
                    data:{
                      id:row.id
                    },
                    contentType:"application/x-www-form-urlencoded",
                    async: true,
                    success:function(){
                      $('#removeModal').modal('hide');
                      $("#td_MR").bootstrapTable('refresh');
                    },
                    error:function(){
                      alert("网络错误");
                    }
                  })
                });
               $('#removeModal').modal();
              }
            }
          },
          ],
        })
      };


      $('#nw1').change(function(){
            $("#td_report").bootstrapTable('refresh');
      });

      $('#term1').change(function(){
            $("#td_report").bootstrapTable('refresh');
      });

      $('#nw2').change(function(){
            $("#td_sign").bootstrapTable('refresh');
      });

      $('#term2').change(function(){
            $("#td_sign").bootstrapTable('refresh');
      });
    </script>

  </body>
</html>
