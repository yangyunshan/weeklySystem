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

    <!-- Bootstrap core CSS -->
    <link href="Static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

    <!--Font Awesome CSS-->
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">

    <!-- Custom styles for this project -->
    <link href="Static/css/style.css" rel="stylesheet">

    <!--datetimepicker CSS-->
    <link href="Static/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

    <!--Bootstrap table CSS-->
    <link rel="stylesheet" href="Static/bootstrap-table/bootstrap-table.min.css">

    <!--Wang Editor CSS-->
    <link rel="stylesheet" href="Static/wangEditor-3.1.0/wangEditor.min.css">

    <!--Bootstrapvalidator CSS-->
    <link rel="stylesheet" href="Static/bootstrapvalidator/bootstrapValidator.min.css">


    <link rel="stylesheet" href="Static/bootstrap-fileinput/css/fileinput.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <div class="container col-md-10 col-md-offset-1 col-xs-12"  style="margin-top:10px;">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">周报</h3>
      </div>
      <div class="panel-body">


        <div class="container col-md-10 col-md-offset-1 col-xs-12" style="margin-bottom:15px">

            <div class="form-group col-md-3 col-xs-6">
              <button type="button" class="btn btn-primary" id="btn_new" ><i class="fa fa-plus"></i>新增</button>
            </div>



            <div class="form-group col-md-3 col-xs-6">
              <select class="form-control" id="term">
                <option>2018上半年</option>
                <option>2018下半年</option>
                <option>2019上半年</option>
                <option>2019下半年</option>
                <option>2020上半年</option>
                <option>2020下半年</option>
              </select>
            </div>

            <div class="form-group col-md-12 col-xs-12">
              <table id="td_WR" ></table>
            </div>


        </div>
      </div>
    </div>
  </div>

    <!--写周报模态框-->
    <div class="modal fade" id="newModal" tabindex="-1" role="dialog">
      <div class="modal-dialog" >
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="">本周汇报</h4>
          </div>
          <div class="modal-body col-md-12">
            <form class="col-md-12" id="reportForm" name="reportForm">
              <div class="form-group col-md-4 col-xs-12">
                <label for="dtp_input1" class="control-label">起始日期</label>
                <div class="input-group form_date date" data-date="" data-date-format="yyyy-MM-dd">
                  <input class="form-control" size="16" type="text" name="startDate" id="startDate" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
              </div>
              <div class="form-group col-md-4 pull-right col-xs-12">
                <label for="dtp_input2" class="control-label">终止日期</label>
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
              <div class="form-group col-md-12 ">
                <input id="fileinput" type="file" multiple class="file-loading" name="file">
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
            <button type="button" class="btn btn-primary" id="btn_add" ><i class="fa fa-save"></i>保存</button>
          </div>
        </div>
      </div>
    </div>

    <!-- 编辑模态框 -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="">本周汇报</h4>
          </div>
          <div class="modal-body col-md-12">
            <form class="col-md-12" id="rform" name="rform">
              <div class="row">
                <div class="form-group col-md-4 col-xs-12">
                  <label for="dtp_input1">起始日期</label>
                  <div class="input-group form_date date" data-date="" data-date-format="yyyy-MM-dd">
                    <input class="form-control" size="16" type="text" name="startDate" id="sdate" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                  </div>
                </div>
                <div class="form-group col-md-4 pull-right col-xs-12">
                  <label for="dtp_input2">终止日期</label>
                  <div class="input-group date form_date" data-date="" data-date-format="yyyy-MM-dd">
                    <input class="form-control" size="16" type="text" name="endDate" id="edate" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                  </div>
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



    <!--编辑操作模态框-->
    <%-- <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="">编辑</h4>
          </div>
          <div class="modal-body">
            <form class="" action="index.html" method="post">
              <!-- TODO: -->
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
            <button type="button" class="btn btn-primary" id="btn_save"><i class="fa fa-save"></i>保存</button>
          </div>
        </div>
      </div>
    </div> --%>
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

    <%-- <script src="wr/Static/js/jquery-3.3.1.min.js"></script>
    <script src="wr/Static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> --%>
    <script src="Static/datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <script src="Static/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="Static/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
    <script src="Static/wangEditor-3.1.0/wangEditor.min.js"></script>
    <script src="Static/bootstrapvalidator/bootstrapValidator.min.js"></script>
    <script src="Static/bootstrap-fileinput/js/fileinput.min.js"></script>
    <script src="Static/bootstrap-fileinput/js/zh.js"></script>


    <script type="text/javascript">

    var nowterm;
    var nownw;
    var nowweek;
    var editterm;
    var editnw;


    $(function(){
      //初始化表格
      initTime();
      initTable();
      //创建TimePicker
      InitTimePicker();
      //创建Editor
      InitEditor();
      //表单验证
      validate();
      //初始化文件上传
      InitFileInput();
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
          nowweek = data[0].week;
          $('#term').val(data[0].term);
        }
      });
    };

    //创建表格

        function initTable () {
            $('#td_WR').bootstrapTable({
                url: "function/getuserreptable", //请求后台的URL（*）//bootstrap table要求的数据要有rows和total
                method: "post",                      //请求方式（*）
                cache: true,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
                contentType: "application/x-www-form-urlencoded",
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                sortStable:true,
                pageSize: 10,                       //每页的记录行数（*）
                sortName:"nw",
                sortOrder:"desc",
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                queryParams : function (params) {
                  var temp = {
                    term: $('#term').val()
                  };
                  return temp;
                },
                columns: [ {
                    field: "term",
                    title: "学期",
                    align: "center",
                    valign: "middle"
                },
                {
                    field: "nw",
                    title: "周数",
                    align: "center",
                    valign: "middle"
                },{
                    field: "upload",
                    title: "附件",
                    align: "center",
                    valign: "middle",
                    formatter: function(value, row, index){
                        var ret = "";
                        $.ajax({
                          url:'function/getuserfilelist',
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
                        form.attr("action","function/download");

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
                      field: "qualify",
                      title: "审核结果",
                      align: "center",
                      valign: "middle",
                      formatter:function(value, row, index) {
                        if (row.qualify == 0) {
                          return "未审核";
                        }
                        if(row.qualify == 1){
                          return "通过";
                        }
                        if (row.qualify == 2) {
                          return "未通过";
                        }
                      }
                  },
                  {
                  field:"operation",
                  title:"编辑",
                  align: "center",
                  valign: "middle",
                  formatter: function(value, row, index) {
                    if (row.nw < nownw || row.term != nowterm) {
                      ret = "<button class='btn btn-primary' id='editTable' style='margin-left:10px'><i class='fa fa-list'>查看</i></button>";
                      return ret;
                    }else if(row.nw == nownw && row.term == nowterm){
                      var ret = "<button class='btn btn-primary' id='editTable' style='margin-left:10px'><i class='fa fa-edit'>编辑</i></button>"+
                      "<button class='btn btn-danger' id='removeTable' style='margin-left:10px'><i class='fa fa-remove'>删除</i></button>";
                      return ret;
                    }
                  },
                  //这里是一个监听对象，描述发生一定动作后执行的操作，这里是click动作生成模态框
                  events:{
                    'click #editTable':function(e, value, row, index){
                        if (row.nw < nownw || row.term != nowterm || nownw == 0) {
                          $('#btn_save').attr('disabled',"true");
                        } else {
                          //// TODO: 回复保存按钮
                          $('#btn_save').removeAttr('disabled');
                        }
                        $.ajax({
                          url: "function/getrep",
                          type: "post",
                          data:{
                            nw: row.nw,
                            term: row.term
                          },
                          contentType:"application/x-www-form-urlencoded",
                          async: true,
                          success:function(data){
                            $('#sdate').val(toTextarea(data[0].sdate));
                            $('#edate').val(toTextarea(data[0].edate));
                            $('#lplan').val(toTextarea(data[0].lplan));
                            $('#done').val(toTextarea(data[0].done));
                            editor2.txt.html(data[0].summary);
                            $('#nplan').val(toTextarea(data[0].nplan));
                            $('#lread').val(toTextarea(data[0].lread));
                            $('#nread').val(toTextarea(data[0].nread));

                            $('#editModal').modal();
                            editterm = row.term;
                            editnw = row.nw;
                          },
                          error:function(){
                            alert("网络错误");
                          }
                        });
                    },
                    'click #removeTable':function(e, value, row, index){
                        $('#removeText').text("是否删除" + row.term + "第" + row.nw + "周周报");
                        $('#removeBtn').click(function(){             //TODO:添加删除后台数据的方法
                          $.ajax({
                            url: "function/deletereport",
                            type: "post",
                            data:{
                              nw: row.nw,
                              term: $('#term').val()
                            },
                            contentType:"application/x-www-form-urlencoded",
                            async: true,
                            success:function(){
                              $('#removeModal').modal('hide');
                              $("#td_WR").bootstrapTable('refresh');
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

    //创建TimePicker
    function InitTimePicker(){
      $('.form_date').datetimepicker({
        format: 'yyyy-mm-dd',
        todayHighlight: 1,
        minView: "month",
        startView:2,
        forceParse: 0,
        showMeridian: 1,
        autoclose: 1
      });
    };

    //创建FileInput
    function InitFileInput(){
      $("#fileinput").fileinput({
        theme: 'explorer-fa',
        language: 'zh', //设置语言
        allowedFileExtensions: ['jpg', 'gif', 'png','docx','doc','xlsx','xls','jpeg','ppt','pptx','bmp'],//接收的文件后缀
        showUpload: false, //是否显示上传按钮
        showCaption: false,//是否显示标题
        showPreview :true,//是否显示预览
        browseClass: "btn btn-primary", //按钮样式
        dropZoneEnabled: true,//是否显示拖拽区域
        maxFileSize: 102400,//单位为kb，如果为0表示不限制文件大小
        //minFileCount: 0,
        maxFileCount: 5, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
      });

      $("#finput").fileinput({
        theme: 'explorer-fa',
        language: 'zh', //设置语言
        allowedFileExtensions: ['jpg', 'gif', 'png','docx','doc','xlsx','xls','jpeg','ppt','pptx','bmp'],//接收的文件后缀
        showUpload: false, //是否显示上传按钮
        showCaption: false,//是否显示标题
        showPreview :true,//是否显示预览
        browseClass: "btn btn-primary", //按钮样式
        dropZoneEnabled: true,//是否显示拖拽区域
        maxFileSize: 102400,//单位为kb，如果为0表示不限制文件大小
        //minFileCount: 0,
        maxFileCount: 5, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
      });
    };

    //创建富文本编辑器
    var editor1;
    var editor2;
    function InitEditor(){
      var E = window.wangEditor;
      editor1 = new E('#div1', '#div2'); // 两个参数也可以传入 elem 对象，class 选择器
      // 或者 var editor = new E( document.getElementById('editor') )
      // editor.customConfig.uploadImgServer = '/upload' ; // 上传图片到服务器
      editor2 = new E('#div3', '#div4');
      editor1.customConfig.showLinkImg = false;
      editor1.customConfig.uploadImgServer = 'function/saveImage';
      editor1.customConfig.uploadFileName = 'image';
      editor1.customConfig.menus = [
        'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'foreColor',  // 文字颜色
        'italic',  // 斜体
        'underline',  // 下划线
        'strikeThrough',  // 删除线
        'image',  // 插入图片
        'list',  // 列表
        'justify',  // 对齐方式
        'table',  // 表格
        'code',  // 插入代码
      ];


      editor2.customConfig.showLinkImg = false;
      editor2.customConfig.uploadImgServer = 'function/saveImage';
      editor2.customConfig.uploadFileName = 'image';
      editor2.customConfig.menus = [
        'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'foreColor',  // 文字颜色
        'underline',  // 下划线
        'strikeThrough',  // 删除线
        'image',  // 插入图片
        'list',  // 列表
        'justify',  // 对齐方式
        'table',  // 表格
        'code',  // 插入代码
      ];
      editor1.create();
      editor2.create();
    };

    //表单验证
    function validate(){
      $('#reportForm').bootstrapValidator({
        fields:{
          week:{
            trigger:'change',
            validators:{
              notEmpty: {//检测非空,radio也可用
                message: '必须选择'
              },
              callback: function(value, validator){
                if (value == 0) {
                  return false;
                } else {
                  return true;
                }
              }
            }
          },
          startDate:{
            trigger:'change',
            validators:{
              notEmpty: {//检测非空,radio也可用
                message: '必须选择'
              }
            }
          },
          endDate:{
            trigger:'change',
            validators:{
              notEmpty: {//检测非空,radio也可用
                message: '必须选择'
              }
            }
          },
          LPlan:{
            validators:{
              notEmpty: {//检测非空,radio也可用
                message: '必须输入'
              }
            }
          },
          Done:{
            validators:{
              notEmpty: {//检测非空,radio也可用
                message: '必须输入'
              }
            }
          },
          NPlan:{
            validators:{
              notEmpty: {//检测非空,radio也可用
                message: '必须输入'
              }
            }
          },
          LRead:{
            validators:{
              notEmpty: {//检测非空,radio也可用
                message: '必须输入'
              }
            }
          },
          NRead:{
            validators:{
              notEmpty: {//检测非空,radio也可用
                message: '必须输入'
              }
            }
          }
        }
      });
    };


    //新添加周报按钮
    $('#btn_new').click(function(){
      if (nowweek != 5) {
        alert("不在规定时间内，不得提交");
      } else{
        $('#newModal').modal('show');
      }
    });


    //新建模态框保存
    $("#btn_add").click(function () {
        //进行表单验证

          var bv = $('#reportForm').data('bootstrapValidator');
          bv.validate();
          if (bv.isValid()) {
            var formData = new FormData();
            var summary = editor1.txt.html();

            formData.append('sdate',textareaTo($('#startDate').val()));
            formData.append('edate',textareaTo($('#endDate').val()));
            formData.append('lplan',textareaTo($('#LPlan').val()));
            formData.append('done', textareaTo($('#Done').val()));
            formData.append('summary', summary);
            formData.append('nplan',textareaTo($('#NPlan').val()));
            formData.append('lread',textareaTo($('#LRead').val()));
            formData.append('nread',textareaTo($('#NRead').val()));


            for(var i=0; i<$('#fileinput')[0].files.length;i++){
            var file = $('#fileinput')[0].files[i];
            formData.append('file', file);
            }

            $.ajax({
              url:"function/reportsubmit",
              type:"post",
              data:formData,
              processData:false,
              contentType:false,
              async: true,
              success:function(message){
                $("#reportForm").find('textarea,select,input').each(function() {
                  $(this).val('');
                  editor1.txt.clear();
                });

                $("#td_WR").bootstrapTable('refresh');
                $('#newModal').modal('hide');
              } ,
              error:function(){
                alert("网络错误");
              }
            });
          };


    });


    //编辑模态框保存
    $('#btn_save').click(function(){
      //进行表单验证
      var bv = $('#reportForm').data('bootstrapValidator');
      bv.validate();
      if (bv.isValid()) {
        //TODO:表单提交的方法、比如ajax提交。这里不可以用dataform和ajax，因为会乱码
        var formData = new FormData();
        var summary = editor2.txt.html();

        formData.append('sdate',textareaTo($('#sdate').val()));
        formData.append('edate',textareaTo($('#edate').val()));
        formData.append('lplan',textareaTo($('#lplan').val()));
        formData.append('done', textareaTo($('#done').val()));
        formData.append('summary', summary);
        formData.append('nplan',textareaTo($('#nplan').val()));
        formData.append('lread',textareaTo($('#lread').val()));
        formData.append('nread',textareaTo($('#nread').val()));
        formData.append('nw', editnw);
        formData.append('term', editterm);

        for(var i=0; i<$('#finput')[0].files.length;i++){
        var file = $('#finput')[0].files[i];
        formData.append('file', file);
        }

        $.ajax({
          url:"function/repupdate",
          type:"post",
          data:formData,
          processData:false,
          contentType:false,
          async: true,
          success:function(message){
            $("#rform").find('textarea,select,input').each(function() {
              $(this).val('');
              editor2.txt.clear();
            });
            $("#td_WR").bootstrapTable('refresh');
            $('#editModal').modal('hide');
          } ,
          error:function(){
            alert("网络错误");
          }
        });
      };
    });


    //模态框隐藏后删除验证信息并重新加载验证
    $('#newModal').on('hidden.bs.modal', function(){
      $("#reportForm").data('bootstrapValidator').destroy();
      $("#reportForm").data('bootstrapValidator',null);
      validate();
    });

    $('#term').change(function(){
          $("#td_WR").bootstrapTable('refresh');
    });

    </script>
  </body>
</html>
