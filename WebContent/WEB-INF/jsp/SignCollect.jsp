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
    <link href="Static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

		<%-- <!--Font Awesome CSS-->
		<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"> --%>

    <!-- Custom styles for this project -->
    <link href="Static/css/style.css" rel="stylesheet">

    <!--datetimepicker CSS-->
    <link href="Static/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

    <!--Bootstrap table-->
    <link rel="stylesheet" href="Static/bootstrap-table/bootstrap-table.min.css">

    <!--datetimepicker CSS-->
    <link href="Static/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style media="screen">
          td {text-align:center;vertical-align: middle;}
          th {text-align:center;vertical-align: middle;}
          input{
              -webkit-border-radius: 0 !important;
              -moz-border-radius: 0 !important;
              border-radius: 0 !important;
              height:25px !important;
          }

          textarea{
            -webkit-border-radius: 0 !important;
            -moz-border-radius: 0 !important;
            border-radius: 0 !important;
          }
    </style>
  </head>

  <body>

    <div class="container col-md-10 col-md-offset-1 col-xs-12" style="margin-top:10px;">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">签到汇总</h3>
        </div>
        <div class="panel-body">
          <div class="col-md-10 col-md-offset-1">
              <div class="form-group col-md-3 col-xs-6">
                <label for="term"></label>
                <select class="form-control" id="term">
                  <option value="2018上半年">2018上半年</option>
                  <option value="2018下半年">2018下半年</option>
                  <option value="2019上半年">2019上半年</option>
                  <option value="2019下半年">2019下半年</option>
                  <option value="2020上半年">2020上半年</option>
                  <option value="2020下半年">2020下半年</option>
                  <option value="2021上半年">2021上半年</option>
                  <option value="2021下半年">2021下半年</option>
                </select>
              </div>

              <div class="form-group col-md-3 col-xs-6 pull-right">
                <label for="nw"></label>
                <select class="form-control" id="nw">
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

              <div class="form-group col-md-12 col-xs-12">
                <table id="td_signCol"></table>
              </div>

          </div>
        </div>
      </div>
    </div>

    <!--动态操作模态框-->
    <div class="modal fade" id="checkmodal" tabindex="-1" role="dialog">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="editModalLabel">编辑</h4>
          </div>
          <div class="modal-body">

            <form class="col-md-12 " id="form_sign">
              <table id="td_signed" class="table table-bordered table-responsive col-md-12 ">
                <tr colspan="8">
                  <th colspan="8" id="tablehead" style="font-size:25px"></th>
                </tr>
                <tr>
                  <th></th>
                  <th>周日</th>
                  <th>周一</th>
                  <th>周二</th>
                  <th>周三</th>
                  <th>周四</th>
                  <th>周五</th>
                  <th>周六</th>
                </tr>

                <tr>
                  <th>上午</th>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default am_in sun" disabled="disabled" type="text" id="sun_am_in" name="sun_am_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default am_out sun" disabled="disabled" type="text" id="sun_am_out" name="sun_am_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default am_in mon" disabled="disabled" type="text" id="mon_am_in" name="mon_am_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default am_out mon" disabled="disabled" type="text" id="mon_am_out" name="mon_am_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default am_in tues" disabled="disabled" type="text" id="tues_am_in" name="tues_am_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default am_out tues" disabled="disabled" type="text" id="tues_am_out" name="tues_am_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default am_in wed" disabled="disabled" type="text" id="wed_am_in" name="wed_am_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default am_out wed" disabled="disabled" type="text" id="wed_am_out" name="wed_am_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default am_in thur" disabled="disabled" type="text" id="thur_am_in" name="thur_am_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default am_out thur" disabled="disabled" type="text" id="thur_am_out" name="thur_am_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default am_in fri" disabled="disabled" type="text" id="fri_am_in" name="fri_am_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default am_out fri" disabled="disabled" type="text" id="fri_am_out" name="fri_am_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default am_in sat" disabled="disabled" type="text" id="sat_am_in" name="sat_am_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default am_out sat" disabled="disabled" type="text" id="sat_am_out" name="sat_am_out" onblur="calculate()">
                  </td>
                </tr>

                <tr>
                  <th>下午</th>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default pm_in sun" disabled="disabled" type="text" id="sun_pm_in" name="sun_pm_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default pm_out sun" disabled="disabled" type="text" id="sun_pm_out" name="sun_pm_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default pm_in mon" disabled="disabled" type="text" id="mon_pm_in" name="mon_pm_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default pm_out mon" disabled="disabled" type="text" id="mon_pm_out" name="mon_pm_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default pm_in tues" disabled="disabled" type="text" id="tues_pm_in" name="tues_pm_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default pm_out tues" disabled="disabled" type="text" id="tues_pm_out" name="tues_pm_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default pm_in wed" disabled="disabled" type="text" id="wed_pm_in" name="wed_pm_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default pm_out wed" disabled="disabled" type="text" id="wed_pm_out" name="wed_pm_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default pm_in thur" disabled="disabled" type="text" id="thur_pm_in" name="thur_pm_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default pm_out thur" disabled="disabled" type="text" id="thur_pm_out" name="thur_pm_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default pm_in fri" disabled="disabled" type="text" id="fri_pm_in" name="fri_pm_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default pm_out fri" disabled="disabled" type="text" id="fri_pm_out" name="fri_pm_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default pm_in sat" disabled="disabled" type="text" id="sat_pm_in" name="sat_pm_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default pm_out sat" disabled="disabled" type="text" id="sat_pm_out" name="sat_pm_out" onblur="calculate()">
                  </td>
                </tr>

                <tr>
                  <th>晚间</th>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default eve_in sun" disabled="disabled" type="text" id="sun_eve_in" name="sun_eve_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default eve_out sun" disabled="disabled" type="text" id="sun_eve_out" name="sun_eve_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default eve_in mon" disabled="disabled" type="text" id="mon_eve_in" name="mon_eve_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default eve_out mon" disabled="disabled" type="text" id="mon_eve_out" name="mon_eve_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default eve_in tues" disabled="disabled" type="text" id="tues_eve_in" name="tues_eve_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default eve_out tues" disabled="disabled" type="text" id="tues_eve_out" name="tues_eve_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default eve_in wed" disabled="disabled" type="text" id="wed_eve_in" name="wed_eve_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default eve_out wed" disabled="disabled" type="text" id="wed_eve_out" name="wed_eve_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default eve_in thur" disabled="disabled" type="text" id="thur_eve_in" name="thur_eve_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default eve_out thur" disabled="disabled" type="text" id="thur_eve_out" name="thur_eve_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default eve_in fri" disabled="disabled" type="text" id="fri_eve_in" name="fri_eve_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default eve_out fri" disabled="disabled" type="text" id="fri_eve_out" name="fri_eve_out" onblur="calculate()">
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default eve_in sat" disabled="disabled" type="text" id="sat_eve_in" name="fri_eve_in" onblur="calculate()"><br/>
                    <input class="inputtime form-control timepicker timepicker-default eve_out sat" disabled="disabled" type="text" id="sat_eve_out" name="fri_eve_out" onblur="calculate()">
                  </td>
                </tr>

                <tr>
                  <th>总计</th>
                  <td><input class="form-control pull-right" step="0.1" disabled="disabled" type="number" id="sun_sum"  max="24" min="0"></td>
                  <td><input class="form-control pull-right" step="0.1" disabled="disabled" type="number" id="mon_sum"  max="24" min="0"></td>
                  <td><input class="form-control pull-right" step="0.1" disabled="disabled" type="number" id="tues_sum" max="24" min="0"></td>
                  <td><input class="form-control pull-right" step="0.1" disabled="disabled" type="number" id="wed_sum"  max="24" min="0"></td>
                  <td><input class="form-control pull-right" step="0.1" disabled="disabled" type="number" id="thur_sum" max="24" min="0"></td>
                  <td><input class="form-control pull-right" step="0.1" disabled="disabled" type="number" id="fri_sum"  max="24" min="0"></td>
                  <td><input class="form-control pull-right" step="0.1" disabled="disabled" type="number" id="sat_sum"  max="24" min="0"></td>
                </tr>

                <tr>
                  <th>请假:</th>
                  <td><input class="form-control pull-right" disabled="disabled"  type="number" id="dayoff" name="late" max="10" min="0"></td>
                  <th>迟到:</th>
                  <td><input class="form-control pull-right" disabled="disabled" type="number" id="late" name="dayoff" max="10" min="0"></td>
                  <th colspan="3">总时间:</th>
                  <td><input class="form-control pull-right" disabled="disabled" type="number" id="totaltime" name="totaltime" max="100" min="0"></td>
                </tr>

                <tr>
                  <th>备注:</th>
                  <td colspan="7">
                    <textarea name="note" class="form-control" disabled="disabled" style="width:100%;height:100%;resize:none;" id="note"></textarea>
                  </td>
                </tr>

              </table>
            </form>
          </div>
          <div class="modal-footer">

          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <%-- <script src="wr/Static/js/jquery-3.3.1.min.js"></script>
    <script src="wr/Static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> --%>
    <script src="Static/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="Static/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="Static/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>


    <!-- Table Method
    ================================================== -->
    <script type="text/javascript">
      $(function(){
        //加载表格
        initTime();
        var oTable = new TableInit();
        oTable.Init();
        initTimePicker();
        calculate();
      })

      function calculate(){
        var sun_sum = calculateMethod($("#sun_am_in").val(), $("#sun_am_out").val()) + calculateMethod($("#sun_pm_in").val(), $("#sun_pm_out").val()) + calculateMethod($("#sun_eve_in").val(), $("#sun_eve_out").val());
        sun_sum = sun_sum.toFixed(1);
        $('#sun_sum').val(sun_sum);
        var mon_sum = calculateMethod($("#mon_am_in").val(), $("#mon_am_out").val()) + calculateMethod($("#mon_pm_in").val(), $("#mon_pm_out").val()) + calculateMethod($("#mon_eve_in").val(), $("#mon_eve_out").val());
        mon_sum = mon_sum.toFixed(1);
        $('#mon_sum').val(mon_sum);
        var tues_sum = calculateMethod($("#tues_am_in").val(), $("#tues_am_out").val()) + calculateMethod($("#tues_pm_in").val(), $("#tues_pm_out").val()) + calculateMethod($("#tues_eve_in").val(), $("#tues_eve_out").val());
        tues_sum = tues_sum.toFixed(1);
        $('#tues_sum').val(tues_sum);
        var wed_sum = calculateMethod($("#wed_am_in").val(), $("#wed_am_out").val()) + calculateMethod($("#wed_pm_in").val(), $("#wed_pm_out").val()) + calculateMethod($("#wed_eve_in").val(), $("#wed_eve_out").val());
        wed_sum = wed_sum.toFixed(1);
        $('#wed_sum').val(wed_sum);
        var thur_sum = calculateMethod($("#thur_am_in").val(), $("#thur_am_out").val()) + calculateMethod($("#thur_pm_in").val(), $("#thur_pm_out").val()) + calculateMethod($("#thur_eve_in").val(), $("#thur_eve_out").val());
        thur_sum = thur_sum.toFixed(1);
        $('#thur_sum').val(thur_sum);
        var fri_sum = calculateMethod($("#fri_am_in").val(), $("#fri_am_out").val()) + calculateMethod($("#fri_pm_in").val(), $("#fri_pm_out").val()) + calculateMethod($("#fri_eve_in").val(), $("#fri_eve_out").val());
        fri_sum = fri_sum.toFixed(1);
        $('#fri_sum').val(fri_sum);
        var sat_sum = calculateMethod($("#sat_am_in").val(), $("#sat_am_out").val()) + calculateMethod($("#sat_pm_in").val(), $("#sat_pm_out").val()) + calculateMethod($("#sat_eve_in").val(), $("#sat_eve_out").val());
        sat_sum = sat_sum.toFixed(1);
        $('#sat_sum').val(sat_sum);
        var total = parseFloat(sun_sum) + parseFloat(mon_sum) + parseFloat(tues_sum) + parseFloat(wed_sum)
         + parseFloat(thur_sum) + parseFloat(fri_sum) + parseFloat(sat_sum);
        $('#totaltime').val(total);
      };

      function calculateMethod(inTime, outTime){
        var in_h = inTime.replace(/:../, "");
        var in_m = inTime.replace(/.*:/, "");
        var out_h = outTime.replace(/:../, "");
        var out_m = outTime.replace(/.*:/, "");

        var hour = out_h - in_h;

        var minute = out_m - in_m;

        if(minute < 0){
          hour = hour - 1;
          minute = 60 + minute;
        }

        minute = (minute/60).toFixed(1);
        var result = parseInt(hour) + parseFloat(minute);
        return result;
      }


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


      function initTimePicker(){
        $('.am_in').timepicker({
          template:false,
          defaultTime:'8:30',
          showMeridian:false
        });
        $('.am_out').timepicker({
          template:false,
          defaultTime:'11:30',
          showMeridian:false,
        });
        $('.pm_in').timepicker({
          template:false,
          defaultTime:'14:30',
          showMeridian:false,
        });
        $('.pm_out').timepicker({
          template:false,
          defaultTime:'17:30',
          showMeridian:false,
        });
        $('.eve_in').timepicker({
          template:false,
          defaultTime:'18:30',
          showMeridian:false,
        });
        $('.eve_out').timepicker({
          template:false,
          defaultTime:'20:30',
          showMeridian:false,
        });
      };


      function initTime(){
        $.ajax({
          url:"function/gettime",
          type:"get",
          async: false,
          success:function(data){
            var nw = data[0].nw;
            var term = data[0].term;
            $('#term').val(data[0].term);
            $('#nw').val(data[0].nw);
          }
        });
      };

      //表格初始化方法
      var TableInit = function () {
          var oTableInit = new Object();
          oTableInit.Init = function () {
              $('#td_signCol').bootstrapTable({
                  url: "function/getsignsbytermandnw",                 //请求后台的URL（*）//bootstrap table要求的数据要有rows和total
                  method: "post",                      //请求方式（*）
                  cache: true,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
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
                      term: $('#term').val(),
                      nw: $('#nw').val()
                    };
                    return temp;
                  },
                  columns: [
                    [{
                      title: "签到",
                      align: "center",
                      valign: "middle",
                      colspan: 7
                    }],
                    [{
                        field: "name",
                        title: "姓名",
                        align: "center",
                        valign: "middle",
                        colspan: 1,
                        rowspan: 1
                    }, {
                        field: "totalTime",
                        title: "总时间",
                        align: "center",
                        valign: "middle",
                        colspan: 1,
                        rowspan: 1
                    }, {
                      field: "late",
                      title: "迟到",
                      align: "center",
                      valign: "middle",
                      colspan: 1,
                      rowspan: 1
                    },{
                      field: "dayoff",
                      title: "请假",
                      align: "center",
                      valign: "middle",
                      colspan: 1,
                      rowspan: 1
                    },{
                      field: "note",
                      title: "备注",
                      align: "center",
                      valign: "middle",
                      colspan: 1,
                      rowspan: 1
                    },{
                      field: "qualify",
                      title: "是否达标",
                      align: "center",
                      valign: "middle",
                      colspan: 1,
                      rowspan: 1,
                      formatter: function(value, row, index){
                        if (row.qualify == 0) {
                          return "未审核";
                        }
                        if(row.qualify == 1){
                          return "达标";
                        }
                        if (row.qualify == 2) {
                          return "未达标";
                        }
                      }
                    },{
                      field:"operation",
                      title:"编辑",
                      align: "center",
                      valign: "middle",
                      colspan: 1,
                      rowspan: 1,
                      formatter: function(value, row, index) {
                        var ret = "<button class='btn btn-primary' id='editTable' style='margin-left:10px'><i class='fa fa-list'>查看</i></button>";
                        return ret;
                      },
                      //这里是一个监听对象，描述发生一定动作后执行的操作，这里是click动作生成模态框
                      events:{
                        'click #editTable':function(e, value, row, index){
                          $.ajax({
                            url:"function/getmembersign",
                            type: "post",
                            contentType:"application/x-www-form-urlencoded",
                            async: true,
                            data: {
                              name:row.name,
                              term:row.term,
                              nw: row.nw
                            },
                            success:function(data){
                              var nw = row.nw;
                              var term = row.term;
                              $('#tablehead').text(term + "第" + nw + "周签到");
                              $('#sun_am_in').val(data.sun_am_in);
                              $('#sun_am_out').val(data.sun_am_out);
                              $('#sun_pm_in').val(data.sun_pm_in);
                              $('#sun_pm_out').val(data.sun_pm_out);
                              $('#sun_eve_in').val(data.sun_eve_in);
                              $('#sun_eve_out').val(data.sun_eve_out);

                              $('#mon_am_in').val(data.mon_am_in);
                              $('#mon_am_out').val(data.mon_am_out);
                              $('#mon_pm_in').val(data.mon_pm_in);
                              $('#mon_pm_out').val(data.mon_pm_out);
                              $('#mon_eve_in').val(data.mon_eve_in);
                              $('#mon_eve_out').val(data.mon_eve_out);

                              $('#tues_am_in').val(data.tues_am_in);
                              $('#tues_am_out').val(data.tues_am_out);
                              $('#tues_pm_in').val(data.tues_pm_in);
                              $('#tues_pm_out').val(data.tues_pm_out);
                              $('#tues_eve_in').val(data.tues_eve_in);
                              $('#tues_eve_out').val(data.tues_eve_out);

                              $('#wed_am_in').val(data.wed_am_in);
                              $('#wed_am_out').val(data.wed_am_out);
                              $('#wed_pm_in').val(data.wed_pm_in);
                              $('#wed_pm_out').val(data.wed_pm_out);
                              $('#wed_eve_in').val(data.wed_eve_in);
                              $('#wed_eve_out').val(data.wed_eve_out);

                              $('#thur_am_in').val(data.thur_am_in);
                              $('#thur_am_out').val(data.thur_am_out);
                              $('#thur_pm_in').val(data.thur_pm_in);
                              $('#thur_pm_out').val(data.thur_pm_out);
                              $('#thur_eve_in').val(data.thur_eve_in);
                              $('#thur_eve_out').val(data.thur_eve_out);

                              $('#fri_am_in').val(data.fri_am_in);
                              $('#fri_am_out').val(data.fri_am_out);
                              $('#fri_pm_in').val(data.fri_pm_in);
                              $('#fri_pm_out').val(data.fri_pm_out);
                              $('#fri_eve_in').val(data.fri_eve_in);
                              $('#fri_eve_out').val(data.fri_eve_out);

                              $('#sat_am_in').val(data.sat_am_in);
                              $('#sat_am_out').val(data.sat_am_out);
                              $('#sat_pm_in').val(data.sat_pm_in);
                              $('#sat_pm_out').val(data.sat_pm_out);
                              $('#sat_eve_in').val(data.sat_eve_in);
                              $('#sat_eve_out').val(data.sat_eve_out);

                              $('#late').val(data.late);
                              $('#dayoff').val(data.dayoff);
                              $('#totaltime').val(data.totalTime);
                              $('#note').val(toTextarea(data.note));
                              calculate();
                              $('#checkmodal').modal();
                            }
                          });
                        }
                      }
                    }
                    ]
                  ]
              });
          };
          return oTableInit;
      };



      $('#term').change(function(){
            $("#td_signCol").bootstrapTable('refresh');
      });

      $('#nw').change(function(){
            $("#td_signCol").bootstrapTable('refresh');
      });
    </script>
  </body>
</html>
