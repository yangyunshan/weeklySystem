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

    <!--Bootstrap Table CSS-->
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
          <h3 class="panel-title">用户管理</h3>
        </div>
        <div class="panel-body">
          <div class="" style="margin-bottom:15px">
            <button type="button" class="btn btn-primary" id="new_btn">
              <i class="fa fa-plus"></i>新增</button>
          </div>
          <div class="">
            <table id="td_user" ></table>
          </div>
        </div>
      </div>
    </div>

    <!--动态操作模态框-->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="editModalLabel">编辑</h4>
          </div>
          <div class="modal-body">
            <form class="" action="index.html" method="post" id="editForm">
              <div class="form-group">
                <label for="iUsername">用户名</label>
                <input type="text" class="form-control" id="iUsername" disabled>
              </div>
              <div class="form-group">
                <label for="iName">姓名</label>
                <input type="text" class="form-control" id="iName">
              </div>

              <div class="form-group">
                <label for="iPW">密码</label>
                <input type="password" class="form-control" id="iPW">
              </div>
              <div class="form-group">
                <label for="">角色</label>
                <select class="form-control" id="iRole" onchange="iSelect();">
                  <option value="groupmember">组员</option>
                  <option value="groupleader">组长</option>
                  <option value="secretary">科研秘书</option>
                  <option value="teacher">导师</option>
                </select>
              </div>
              <div class="form-group">
                <label for="">归属</label>
                <select class="form-control" id="iBelong">
                </select>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" id="btn_save">保存</button>
          </div>
        </div>
      </div>
    </div>

    <!--新增操作模态框-->
    <div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="">编辑</h4>
          </div>
          <div class="modal-body">
            <form class="" action="index.html" method="post" id="newForm">
              <div class="form-group">
                <label for="inputName">姓名</label>
                <input type="text" class="form-control" id="inputName">
              </div>
              <div class="form-group">
                <label for="inputUsername">用户名</label>
                <input type="text" class="form-control" id="inputUsername">
              </div>
              <div class="form-group">
                <label for="inputPW">密码</label>
                <input type="password" class="form-control" id="inputPW">
              </div>
              <div class="form-group">
                <label for="">角色</label>
                <select class="form-control" id="inputRole" onchange="inputSelect();">
                  <option value="groupmember">组员</option>
                  <option value="groupleader">组长</option>
                  <option value="secretary">科研秘书</option>
                  <option value="teacher">导师</option>
                </select>
              </div>
              <div class="form-group">
                <label for="">归属（仅设置组员所属组长）</label>
                <select class="form-control" id="inputBelong">
                </select>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
            <button type="button" class="btn btn -primary" id="btn_submit"><i class="fa fa-save"></i>保存</button>
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
    <script src="wr/Static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> --%>
    <script src="Static/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="Static/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript">


      $(function(){
        var ouserTble = new UserTable();
        ouserTble.Init();
      })


      function initIBelong(){
        $('#iBelong').html("");
        $('#iBelong').append('<option value = ""></option>');
        $.ajax({
          url:"function/getglnames",
          type: "get",
          contentType:"application/json",
          async: false,
          success:function(data){
            for (var i = 0; i < data.length; i++) {
              var name = data[i];
              $('#iBelong').append('<option value = "'+ name +'">' + name + '</option>');
            }
          }
        })
      }

      function iSelect(){
        if ($('#iRole').val() != "groupmember") {
          $('#iBelong').val("");
          $('#iBelong').attr("disabled","disabled");
        } else {
          $('#iBelong').removeAttr("disabled");
        }
      }

      function inputSelect(){
        if ($('#inputRole').val() != "groupmember"){
          $('#inputBelong').val("");
          $('#inputBelong').attr("disabled","disabled");
        } else {
          $('#inputBelong').removeAttr("disabled");
        }
      }

      function initInputBelong(){
        $('#inputBelong').html("");
        $('#inputBelong').append('<option value = ""></option>');
        $.ajax({
          url:"function/getglnames",
          type: "get",
          contentType:"application/json",
          async: false,
          success:function(data){
            for (var i = 0; i < data.length; i++) {
              var name = data[i];
              $('#inputBelong').append('<option value = "'+ name +'">' + name + '</option>');
            }
          }
        })
      }



      var UserTable = function () {
          var oTableInit = new Object();
          oTableInit.Init = function () {
              $('#td_user').bootstrapTable({
                  url: "function/getalluser",                  //请求后台的URL（*）//bootstrap table要求的数据要有rows和total
                  method: "get",                      //请求方式（*）
                  cache: true,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                  pagination: true,                   //是否显示分页（*）
                  sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
                  //responseHandler:responseHandler自定义来生成total和row字段
                  //dataField:"data",设置接口返回值中用于填充表格数据的字段
                  pageNumber: 1,                       //初始化加载第一页，默认第一页
                  pageSize: 10,                       //每页的记录行数（*）
                  pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                  uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                  columns: [ {
                      field: "name",
                      title: "姓名",
                      align: "center",
                      valign: "middle"
                  }, {
                      field: "username",
                      title: "用户名",
                      align: "center",
                      valign: "middle"
                  }, {
                      field: "role",
                      title: "角色",
                      align: "center",
                      valign: "middle",
                      formatter: function(value, row, index){
                        if (row.role == "groupmember") {
                          return "组员";
                        } else if (row.role == "groupleader") {
                          return "组长";
                        } else if(row.role == "teacher") {
                          return "导师";
                        } else if (row.role == "secretary") {
                          return "科研秘书";
                        }
                      }
                  }, {
                    field:"operation",
                    title:"编辑",
                    align: "center",
                    valign: "middle",
                    formatter: function(value, row, index) {
                      var ret = "<button class='btn btn-primary' id='editTable' style='margin-left:10px'><i class='fa fa-edit'>编辑</i></button>"+
                      "<button class='btn btn-danger' id='removeTable' style='margin-left:10px'><i class='fa fa-remove'>删除</i></button>";
                      return ret;
                    },
                    //这里是一个监听对象，描述发生一定动作后执行的操作，这里是click动作生成模态框
                    events:{
                      'click #editTable':function(e, value, row, index){
                        initIBelong();
                        $('#iName').val(row.name); //TODO:$('#saveBtn').function(){};编辑操作。其它属性读取
                        $('#iUsername').val(row.username);
                        $('#iPW').val(row.password);
                        $("#iRole").val(row.role);
                        $('#iBelong').val(row.belong);
                        if (row.role != "groupmember") {
                          $('#iBelong').attr("disabled","disabled");
                        } else {
                          $('#iBelong').removeAttr("disabled");
                        }
                        $('#editModal').modal();
                      },
                      'click #removeTable':function(e, value, row, index){
                        $('#removeText').text("是否删除用户" + row.name );
                        $('#removeBtn').click(function(){             //TODO:添加删除后台数据的方法
                          $.ajax({
                            url: "function/deleteuser",
                            type: "post",
                            data:{
                              username: row.username,
                            },
                            contentType:"application/x-www-form-urlencoded",
                            async: false,
                            success:function(){
                              $("#td_user").bootstrapTable('refresh');
                              $('#removeModal').modal('hide');
                            },
                            error:function(){
                              alert("网络错误");
                            }
                          });          //$('#td_signCol').bootstrapTable('refresh');
                        });
                       $('#removeModal').modal();
                      }
                    }
                  },
                  ],
              });
          };
          return oTableInit;
      };

      $('#new_btn').click(function(){
        initInputBelong();
        $('#newModal').modal();
      });

      $('#btn_save').click(function(){
        if ($('#iName').val() == "" || $('#iPW').val() == "" || $('#iUsername').val() == "") {
          alert('请填写完整');
        } else if ($('#iRole').val() == "groupmember" && $('#iBelong').val() == '') {
          alert('选择组员所属组长');
        }else {
          // TODO:
          $.ajax({
            url: "function/saveuser",
            type: "post",
            data:{
              username: $('#iUsername').val(),
              name: $('#iName').val(),
              password: $('#iPW').val(),
              role: $('#iRole').val(),
              belong: $('#iBelong').val(),
            },
            contentType:"application/x-www-form-urlencoded",
            async: true,
            success:function(message){
              $('#iBelong').find("option").remove();
              $("#newForm").find('select,input').each(function() {
                $(this).val('');
              });
              $("#td_user").bootstrapTable('refresh');
              $('#editModal').modal('hide');
            },
            error:function(){
              alert("网络错误");
            }
          });
        }
      });

      $('#btn_submit').click(function(){
        if ($('#inputName').val() == "" || $('#inputPW').val() == "" || $('#inputUsername').val() == "") {
          alert('请填写完整');
        } else if ($('#inputRole').val() == 'groupmember' && $('#inputBelong').val() == '') {
          alert("选择组员所属组长");
        }
        else {
          $.ajax({
            url: "function/newuser",
            type: "post",
            data:{
              username: $('#inputUsername').val(),
              name: $('#inputName').val(),
              password: $('#inputPW').val(),
              role: $('#inputRole').val(),
              belong: $('#inputBelong').val(),
            },
            contentType:"application/x-www-form-urlencoded",
            async: true,
            success:function(){
              $('#inputBelong').find("option").remove();
              $("#newForm").find('select,input').each(function() {
                $(this).val('');
              });
              $("#td_user").bootstrapTable('refresh');
              $('#newModal').modal('hide');
            },
            error:function(){
              alert("网络错误");
            }
          });
        }
      });
    </script>
  </body>
</html>
