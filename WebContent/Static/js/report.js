$(function(){
  //初始化表格
  var oWRTble = new WRTable();
  oWRTble.Init();
  //创建TimePicker
  InitTimePicker();
  //创建Editor
  InitEditor();
  //表单验证
  validate();

});

var WRTable = function () {
    var oTableInit = new Object();
    oTableInit.Init = function () {
        $('#td_WR').bootstrapTable({
            url: "data.json",                  //请求后台的URL（*）//bootstrap table要求的数据要有rows和total
            method: "get",                      //请求方式（*）
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            //responseHandler:responseHandler自定义来生成total和row字段
            //dataField:"data",设置接口返回值中用于填充表格数据的字段
            pageNumber: 1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
            columns: [ {
                field: "term",
                title: "学期"
            }, {
                field: "week",
                title: "周数"
            }, {
                field: "submit",
                title: "是否提交",
                formatter:function(value, row, index){
                  // TODO:
                }
            }, {
              field:"operation",
              title:"编辑",
              formatter: function(value, row, index) {
                var ret = "<button class='btn btn-primary' id='editTable' style='margin-left:10px'><i class='fa fa-edit'>编辑</i></button>"+
                "<button class='btn btn-danger' id='removeTable' style='margin-left:10px'><i class='fa fa-remove'>删除</i></button>";
                return ret;
              },
              //这里是一个监听对象，描述发生一定动作后执行的操作，这里是click动作生成模态框
              events:{
                'click #editTable':function(e, value, row, index){
                  $('#inputName').attr("value",row.name); //TODO:$('#saveBtn').function(){};编辑操作。其它属性读取
                  $('#editModal').modal({
                    remote: "" //controller
                  });
                },
                'click #removeTable':function(e, value, row, index){
                  $('#removeText').text("是否删除" + row.week + "周报");
                  $('#removeBtn').click(function(){             //TODO:添加删除后台数据的方法
                    $('#td_user').bootstrapTable('remove',{
                      field:'week',                             //根据name字段删除
                      values:row.week                           //name的值
                    });
                    $('#removeModal').modal('hide');             //$('#td_signCol').bootstrapTable('refresh');
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

//创建富文本编辑器
function InitEditor(){
  var E = window.wangEditor;
  var editor = new E('#div1', '#div2'); // 两个参数也可以传入 elem 对象，class 选择器
  // 或者 var editor = new E( document.getElementById('editor') )
  editor.customConfig.uploadImgServer = '/upload' ; // 上传图片到服务器
  editor.customConfig.menus = [
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
  editor.create();
  //editor.txt.html('<ul><li><p></p></li></ul>')
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

//按钮事件绑定

$("#btn_add").click(function () {
    //进行表单验证
    var bv = $('#reportForm').data('bootstrapValidator');
    bv.validate();
    if (bv.isValid()) {
      $('#td_WR').bootstrapTable('append',{});
      //表单提交的方法、比如ajax提交 TODO:

      $('#newModal').modal('hide');
      
      $("#reportForm").find('textarea,select,input').each(function() {
        $(this).val('');
        editor.txt.html('');
      });
    };
});

$('#btn_save').click(function(){
  // TODO:
  $('#editModal').modal('hide');
});

//模态框隐藏后删除验证信息并重新加载验证
$('#newModal').on('hidden.bs.modal', function(){
  $("#reportForm").data('bootstrapValidator').destroy();
  $("#reportForm").data('bootstrapValidator',null);
  validate();
});
