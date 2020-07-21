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

		<!--Font Awesome CSS-->
		<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">

    <!-- Custom styles for this project -->
    <link href="Static/css/style.css" rel="stylesheet">

    <!--Wang Editor CSS-->
    <link rel="stylesheet" href="Static/wangEditor-3.1.0/wangEditor.min.css">

    <!--datetimepicker CSS-->
    <link href="Static/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

    <!--Bootstrap table-->
    <link rel="stylesheet" href="Static/bootstrap-table/bootstrap-table.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <body>
      <div class="container col-md-10 col-md-offset-1"  style="margin-top:50px;">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">周报汇总</h3>
          </div>
          <div class="panel-body">
            <div class="col-md-10 col-md-offset-1">
              <table id="td_RR"></table>
            </div>
          </div>
        </div>
      </div>


      <div class="modal fade" id="repModal" tabindex="-1" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="">本周汇报</h4>
            </div>
            <div class="modal-body col-md-12">
              <form class="col-md-12" id="reportForm" name="reportForm">
                <div class="form-group col-md-4 col-xs-12">
                  <label for="dtp_input1">起始日期</label>
                  <div class="input-group form_date date" data-date="" data-date-format="yyyy-MM-dd">
                    <input class="form-control" size="16" type="text" name="startDate" id="startDate" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                  </div>
                </div>
                <div class="form-group col-md-4 pull-right col-xs-12">
                  <label for="dtp_input2">终止日期</label>
                  <div class="input-group date form_date" data-date="" data-date-format="yyyy-MM-dd">
                    <input class="form-control" size="16" type="text" name="endDate" id="endDate" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                  </div>
                </div>
                <div class="form-group col-md-12">
                  <label for="">1.上周计划做什么</label>
                  <textarea class="form-control" rows="5" cols="7" style="resize: vertical" name="LPlan" id="LPlan"></textarea>
                </div>
                <div class="form-group col-md-12">
                  <label for="">2.今周完成了什么</label>
                  <textarea class="form-control" rows="5" cols="7" style="resize: vertical" name="Done" id="Done"></textarea>
                </div>
                <div class="form-group col-md-12">
                  <label for="">3.今周有什么总结</label>
                  <div id="div1" style="border: 1px solid #ccc; border-bottom:0px; background:#f5f5f5;"></div>
                  <div id="div2" style="border: 1px solid #ccc; border-top:0px; height:300px; color: #555; background-color: #fff;"></div>
                </div>
                <div class="form-group col-md-12">
                  <label for="">4.下周计划做什么</label>
                  <textarea class="form-control" rows="5" cols="7" style="resize: vertical" name="NPlan" id="NPlan"></textarea>
                </div>
                <div class="form-group col-md-12">
                  <label for="">5.今周阅读了什么</label>
                  <textarea class="form-control" rows="5" cols="7" style="resize: vertical" name="LRead" id="LRead"></textarea>
                </div>
                <div class="form-group col-md-12">
                  <label for="">6.下周计划阅读什么</label>
                  <textarea class="form-control" rows="5" cols="7" style="resize: vertical" name="NRead" id="NRead"></textarea>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
            </div>
          </div>
        </div>
      </div>




    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->


    <%-- <script src="wr/Static/js/jquery-3.3.1.min.js"></script> --%>
    <%-- <script src="wr/Static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> --%>
    <script src="Static/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="Static/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
    <script src="Static/wangEditor-3.1.0/wangEditor.min.js"></script>
    <script type="text/javascript">

    var nownw;
    var nowterm;

    $(function(){
      initTime();
      InitEditor();
      initTable();
    });

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

    function initTime(){
      $.ajax({
        url:"function/gettime",
        type:"get",
        async: false,
        success:function(data){
          nownw = data[0].nw;
          nowterm = data[0].term;
        }
      });
    };

    var editor;
    function InitEditor(){
      var E = window.wangEditor;
      editor = new E('#div1', '#div2'); // 两个参数也可以传入 elem 对象，class 选择器
      // 或者 var editor = new E( document.getElementById('editor') )
      // editor.customConfig.uploadImgServer = '/upload' ; // 上传图片到服务器
      editor.customConfig.showLinkImg = false;
      editor.customConfig.uploadImgShowBase64 = true ;
      editor.customConfig.menus = [];
      editor.create();
    }

          function initTable(){
            if(nownw == 0){
              var head = "系统未开启";
            }else{
              var head = nowterm + "第" + nownw + "周周报汇总表";
            }

            $('#td_RR').bootstrapTable({
              url: "function/getweekrepbygroup", //请求后台的URL（*）//bootstrap table要求的数据要有rows和total
              method: "get",                      //请求方式（*）
              cache: true,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
              pagination: true,                   //是否显示分页（*）
              sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
              contentType: "application/x-www-form-urlencoded",
              pageNumber: 1,                       //初始化加载第一页，默认第一页
              pageSize: 10,                       //每页的记录行数（*）
              uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
              columns: [
                [{
                  title: head,
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
                },{
                    field: "term",
                    title: "学期",
                    align: "center",
                    valign: "middle",
                    colspan: 1,
                    rowspan: 1
                },
                {
                    field: "nw",
                    title: "周数",
                    align: "center",
                    valign: "middle",
                    colspan: 1,
                    rowspan: 1
                },{
                    field: "upload",
                    title: "附件",
                    align: "center",
                    valign: "middle",
                    colspan: 1,
                    rowspan: 1,
                    formatter: function(value, row, index){
                        var ret = "";
                        $.ajax({
                          url:'function/getfilelist',
                          type: 'post',
                          data: {
                            term: row.term,
                            nw: row.nw,
                            name: row.name
                          },
                          async:false,
                          success:function(data){
                            if(data != ""){
                              for (var i = 0; i < data.length; i++) {
                                ret = ret + '<a href="javascript:void(0)" style="overflow:hidden" class = "dl">' + data[i] +'</a><br/>';
                              }
                            } else {
                              ret = "无附件";
                            }
                          }
                        });
                        return ret;
                    },
                    events:{
                      'click .dl':function(e, value, row, index){

                        var form = $("<form>");
                        form.attr("style","display:none");
                        form.attr("target","");
                        form.attr("method","post");
                        form.attr("action","function/downloadsinglefile");

                        var input1 = $("<input>");
                        input1.attr("type","hidden");
                        input1.attr("name","term");
                        input1.attr("value",row.term);

                        var input2 = $("<input>");
                        input2.attr("type","hidden");
                        input2.attr("name","nw");
                        input2.attr("value",row.nw);

                        var input3 = $("<input>");
                        input3.attr("type","hidden");
                        input3.attr("name","name");
                        input3.attr("value",row.name);

                        var input4 = $("<input>");
                        input4.attr("type","hidden");
                        input4.attr("name","filename");
                        input4.attr("value",e.target.innerHTML);

                        $('body').append(form);
                        form.prepend(input1);
                        form.prepend(input2);
                        form.prepend(input3);
                        form.prepend(input4);
                        form.submit();
                        form.remove();
                        }
                      }
                  },{
                  field:"check",
                  title:"查看",
                  align: "center",
                  valign: "middle",
                  colspan: 1,
                  rowspan: 1,
                  formatter: function(value, row, index) {
                    var ret = "<button class='btn btn-info' id='editTable' style='margin-left:10px'><i class='fa fa-list'>查看</i></button>";
                    return ret;
                  },
                  //这里是一个监听对象，描述发生一定动作后执行的操作，这里是click动作生成模态框
                  events:{
                    'click #editTable':function(e, value, row, index){
                      $.ajax({
                        url: "function/getmemberrep",
                        type: "post",
                        data:{
                          nw: row.nw,
                          term: row.term,
                          name: row.name
                        },
                        contentType:"application/x-www-form-urlencoded",
                        async: false,
                        success:function(data){
                          $('#startDate').val(toTextarea(data[0].sdate));
                          $('#endDate').val(toTextarea(data[0].edate));
                          $('#LPlan').val(toTextarea(data[0].lplan));
                          $('#Done').val(toTextarea(data[0].done));
                          editor.txt.html(data[0].summary);
                          $('#LRead').val(toTextarea(data[0].lread));
                          $('#NPlan').val(toTextarea(data[0].nplan));
                          $('#NRead').val(toTextarea(data[0].nread));
                          $('#repModal').modal();
                        },
                        error:function(){
                          alert("网络错误");
                        }
                      });
                    }
                  }
                },
                {
                    field: "review",
                    title: "是否通过",
                    align: "center",
                    valign: "middle",
                    colspan: 1,
                    rowspan: 1,
                    formatter: function(value, row, index) {
                      var ret = "<button class='btn btn-success' id='qualified' style='margin-left:10px'><i class='fa fa-circle-thin'>是</i></button>"+
                      "<button class='btn btn-warning' id='unqualified' style='margin-left:10px'><i class='fa fa-close'>否</i></button>";
                      return ret;
                    },
                    events:{
                      'click #qualified':function(e, value, row, index){
                        $.ajax({
                          url:'function/review',
                          type: 'post',
                          data: {
                            qualify: 1,
                            nw: row.nw,
                            term: row.term,
                            name: row.name
                          },
                          async: false,
                          success:function(){

                          }
                        })
                        refresh();
                      },
                      'click #unqualified':function(e, value, row, index){
                        if(row.qualify == 0 || row.qualify == 2){
                          $.ajax({
                            url:'function/review',
                            type: 'post',
                            data: {
                              qualify: 2,
                              nw: row.nw,
                              term: row.term,
                              name: row.name
                            },
                            async: false,
                            success:function(){

                            }
                          })
                        } else if (row.qualify == 1) {
                          alert("审核已通过，不得修改");
                        }
                        refresh();
                      }
                    }
                },{
                    field: "qualify",
                    title: "审核状态",
                    align: "center",
                    valign: "middle",
                    colspan: 1,
                    rowspan: 1,
                    formatter: function(value, row, index){
                      if (row.qualify == 0) {
                        return "未审核";
                      }
                      if(row.qualify == 1){
                        return "通过";
                      }
                      if (row.qualify == 2) {
                        return "不通过";
                      }
                    }
                  }
                ]
              ]
          });
        };

        function refresh(){
          $('#td_RR').bootstrapTable('refresh');
        }

    </script>


  </body>
</html>
