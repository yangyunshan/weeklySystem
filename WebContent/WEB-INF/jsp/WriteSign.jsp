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

    <!--datetimepicker CSS-->
    <link href="Static/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
        <style media="screen">
              table{
                table-layout: fixed;
                word-break: break-all;
                word-wrap: break-word;
              }
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

                <div class="container col-md-12 col-xs-12" style="margin-top:10px;">
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h3 class="panel-title">本周签到信息</h3>
                    </div>
                    <div class="panel-body">
                      <div class="container col-md-12" style="margin-bottom:15px">
                        <p1 id="pterm"></p1>
                        <p2 id="pnw"></p2>
                      </div>
                      <div class="col-md-12 ">
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
                                <input class="inputtime form-control timepicker timepicker-default am_in sun" type="text" id="sun_am_in" name="sun_am_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default am_out sun" type="text" id="sun_am_out" name="sun_am_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default am_in mon" type="text" id="mon_am_in" name="mon_am_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default am_out mon" type="text" id="mon_am_out" name="mon_am_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default am_in tues" type="text" id="tues_am_in" name="tues_am_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default am_out tues" type="text" id="tues_am_out" name="tues_am_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default am_in wed" type="text" id="wed_am_in" name="wed_am_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default am_out wed" type="text" id="wed_am_out" name="wed_am_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default am_in thur" type="text" id="thur_am_in" name="thur_am_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default am_out thur" type="text" id="thur_am_out" name="thur_am_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default am_in fri" type="text" id="fri_am_in" name="fri_am_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default am_out fri" type="text" id="fri_am_out" name="fri_am_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default  sat" type="text" id="sat_am_in" name="sat_am_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default  sat" type="text" id="sat_am_out" name="sat_am_out" onblur="calculate()">
                              </td>
                            </tr>

                            <tr>
                              <th>下午</th>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default pm_in sun" type="text" id="sun_pm_in" name="sun_pm_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default pm_out sun" type="text" id="sun_pm_out" name="sun_pm_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default pm_in mon" type="text" id="mon_pm_in" name="mon_pm_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default pm_out mon" type="text" id="mon_pm_out" name="mon_pm_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default pm_in tues" type="text" id="tues_pm_in" name="tues_pm_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default pm_out tues" type="text" id="tues_pm_out" name="tues_pm_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default pm_in wed" type="text" id="wed_pm_in" name="wed_pm_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default pm_out wed" type="text" id="wed_pm_out" name="wed_pm_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default pm_in thur" type="text" id="thur_pm_in" name="thur_pm_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default pm_out thur" type="text" id="thur_pm_out" name="thur_pm_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default pm_in fri" type="text" id="fri_pm_in" name="fri_pm_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default pm_out fri" type="text" id="fri_pm_out" name="fri_pm_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default  sat" type="text" id="sat_pm_in" name="sat_pm_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default  sat" type="text" id="sat_pm_out" name="sat_pm_out" onblur="calculate()">
                              </td>
                            </tr>

                            <tr>
                              <th>晚间</th>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default eve_in sun" type="text" id="sun_eve_in" name="sun_eve_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default eve_out sun" type="text" id="sun_eve_out" name="sun_eve_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default eve_in mon" type="text" id="mon_eve_in" name="mon_eve_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default eve_out mon" type="text" id="mon_eve_out" name="mon_eve_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default eve_in tues" type="text" id="tues_eve_in" name="tues_eve_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default eve_out tues" type="text" id="tues_eve_out" name="tues_eve_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default eve_in wed" type="text" id="wed_eve_in" name="wed_eve_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default eve_out wed" type="text" id="wed_eve_out" name="wed_eve_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default eve_in thur" type="text" id="thur_eve_in" name="thur_eve_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default eve_out thur" type="text" id="thur_eve_out" name="thur_eve_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default eve_in fri" type="text" id="fri_eve_in" name="fri_eve_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default eve_out fri" type="text" id="fri_eve_out" name="fri_eve_out" onblur="calculate()">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default  sat" type="text" id="sat_eve_in" name="fri_eve_in" onblur="calculate()"><br/>
                                <input class="inputtime form-control timepicker timepicker-default  sat" type="text" id="sat_eve_out" name="fri_eve_out" onblur="calculate()">
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
                              <td><input class="form-control pull-right"  type="number" step="1" id="dayoff" name="late" max="10" min="0"></td>
                              <th>迟到:</th>
                              <td><input class="form-control pull-right" type="number" step="1" id="late" name="dayoff" max="10" min="0"></td>
                              <th colspan="3">总时间:</th>
                              <td><input class="form-control pull-right" type="number" step="0.1" id="totaltime" name="totaltime" max="100" min="0"></td>
                            </tr>

                            <tr>
                              <th>备注:</th>
                              <td colspan="7">
                                <textarea name="note" class="form-control" style="width:100%;height:100%;resize:none;" id="note"></textarea>
                              </td>
                            </tr>

                          </table>
                        </form>
                        <div class="col-md-12 col-sm-12 ">
                          <p id="status" class="col-md-3 col-sm-3 col-xs-3"></p>
                          <button type="button" class="btn btn-success col-md-2 col-sm-2 pull-right" id="save">保存</button>
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
    <script src="Static/timepicker/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript">

    var nowweek;

      $(function(){
        initTime();
        initTimePicker();
        initTable();
        getStatus();
        calculate();
      });


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
        var result = parseFloat(hour) + parseFloat(minute);
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

      function getStatus(){
        $.ajax({
          url: "function/signstatus",
          type: "get",
          contentType: "application/json",
          async: false,
          success: function(data){
            if (data == "unsubmit") {
            $('#status').text("未提交");
          } else if (data == "submited") {
            $('#status').text("已提交");
            }
          }
        });
      }

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
                      nowweek = data[0].week;
                      if(data[0].nw == 0){
                      $('#tablehead').text("系统未开启");
                    } else{
                      $('#tablehead').text(term + "第" + nw + "周签到");
                    }
                    }
                  });
                };



                function initTable(){
                  $.ajax({
                    url:"function/getsign",
                    type:"get",
                    contentType:"application/json",
                    async: false,
                    success:function(data){

                      if(data.return != "false"){

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

                        var str = data.note;
                        str = toTextarea(str);
                        $('#note').val(str);
                      }
                    }
                  });
                };

                $('#save').click(function(){
                    if ($('#late').val() == '' || $('#dayoff').val() == '' || $('#totaltime').val() == '') {
                      alert("请填写迟到，早退，总时间");
                      return;
                    }
                    var formData = new FormData();
                    formData.append('sun_am_in',$('#sun_am_in').val());
                    formData.append('sun_am_out',$('#sun_am_out').val());
                    formData.append('sun_pm_in',$('#sun_pm_in').val());
                    formData.append('sun_pm_out', $('#sun_pm_out').val());
                    formData.append('sun_eve_in',$('#sun_eve_in').val());
                    formData.append('sun_eve_out',$('#sun_eve_out').val());

                    formData.append('mon_am_in',$('#mon_am_in').val());
                    formData.append('mon_am_out',$('#mon_am_out').val());
                    formData.append('mon_pm_in',$('#mon_pm_in').val());
                    formData.append('mon_pm_out', $('#mon_pm_out').val());
                    formData.append('mon_eve_in',$('#mon_eve_in').val());
                    formData.append('mon_eve_out',$('#mon_eve_out').val());

                    formData.append('tues_am_in',$('#tues_am_in').val());
                    formData.append('tues_am_out',$('#tues_am_out').val());
                    formData.append('tues_pm_in',$('#tues_pm_in').val());
                    formData.append('tues_pm_out', $('#tues_pm_out').val());
                    formData.append('tues_eve_in',$('#tues_eve_in').val());
                    formData.append('tues_eve_out',$('#tues_eve_out').val());

                    formData.append('wed_am_in',$('#wed_am_in').val());
                    formData.append('wed_am_out',$('#wed_am_out').val());
                    formData.append('wed_pm_in',$('#wed_pm_in').val());
                    formData.append('wed_pm_out', $('#wed_pm_out').val());
                    formData.append('wed_eve_in',$('#wed_eve_in').val());
                    formData.append('wed_eve_out',$('#wed_eve_out').val());

                    formData.append('thur_am_in',$('#thur_am_in').val());
                    formData.append('thur_am_out',$('#thur_am_out').val());
                    formData.append('thur_pm_in',$('#thur_pm_in').val());
                    formData.append('thur_pm_out', $('#thur_pm_out').val());
                    formData.append('thur_eve_in',$('#thur_eve_in').val());
                    formData.append('thur_eve_out',$('#thur_eve_out').val());

                    formData.append('fri_am_in',$('#fri_am_in').val());
                    formData.append('fri_am_out',$('#fri_am_out').val());
                    formData.append('fri_pm_in',$('#fri_pm_in').val());
                    formData.append('fri_pm_out', $('#fri_pm_out').val());
                    formData.append('fri_eve_in',$('#fri_eve_in').val());
                    formData.append('fri_eve_out',$('#fri_eve_out').val());

                    formData.append('sat_am_in',$('#sat_am_in').val());
                    formData.append('sat_am_out',$('#sat_am_out').val());
                    formData.append('sat_pm_in',$('#sat_pm_in').val());
                    formData.append('sat_pm_out', $('#sat_pm_out').val());
                    formData.append('sat_eve_in',$('#sat_eve_in').val());
                    formData.append('sat_eve_out',$('#sat_eve_out').val());

                    formData.append('late', $('#late').val());
                    formData.append('dayoff',$('#dayoff').val());
                    formData.append('totaltime',$('#totaltime').val());

                    var str = $('#note').val();
                    str = textareaTo(str);
                    formData.append('note',str);

                    $.ajax({
                      url: "function/submitsign",
                      type: "post",
                      contentType: "application/json",
                      async: false,
                      data: formData,
                      processData: false,
                      contentType: false,
                      success: function(){
                        alert("提交成功");
                        getStatus();
                        initTable();
                      }
                  })
                });



        </script>
  </body>
</html>
