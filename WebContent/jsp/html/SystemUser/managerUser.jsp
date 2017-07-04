<%@page import="java.util.List"%>
<%@page import="com.easyhousing.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
HttpSession s = request.getSession();
List<User> userList = (List<User>)session.getAttribute("userList");
%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/bootstrap.min.css>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/dataTables.bootstrap.min.css>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/style.css>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/codemirror.css>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/ace.min.css>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/font-awesome.min.css>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/jquery.min.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/bootstrap.min.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/typeahead-bs2.min.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/jquery.dataTables.min.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/jquery.dataTables.bootstrap.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/H-ui.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/H-ui.admin.js></script>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/layer.js></script>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/layer.css>
  <script src=${pageContext.request.contextPath}/jsp/html/SystemUser/js/laydate.js></script>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/laydate.css>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/laydate(1).css>

  <style>
    .dataTable th.sorting_desc:after {
      content: "\f0dd";
      top: 15px;
      color: #307ecc;
    }
    </style>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/ace-rtl.min.css>
  <link rel="stylesheet" href=${pageContext.request.contextPath}/jsp/html/SystemUser/css/ace-skins.min.css>

</head>
<body>
<div class="page-content clearfix">
  <div class="page-content clearfix" style="display: inline-block">
    <div id="Member_Ratings">
      <div class="d_Confirm_Order_style">
        <div class="search_style" style="display: block">
          <div class="title_names">搜索查询</div>
          <ul class="search_content clearfix">

            <li><label class="l_f" style="width: 60px">会员名称</label><input name="" type="text" class="text_add "
                                                      placeholder="输入会员名称、电话、邮箱" style=" width:300px"></li>

            <li style="width:90px;">
              <button type="button" class="btn_search">查询</button>
            </li>
          </ul>
        </div>

        <div class="border clearfix" style="display: block">
               <span class="l_f">
                <a href="javascript:ovid()" id="member_add" class="btn btn-warning">添加用户</a>
                <a class="btn btn-danger" onclick="deletePart();" href=${pageContext.request.contextPath}/managerUserinit.do>批量删除</a>
               </span>
          <!--<span class="r_f">共：<b>2345</b>条</span>-->
        </div>

        <div class="table_menu_list">
          <div id="sample-table_wrapper" class="dataTables_wrapper no-footer">

            <table class="table table-striped table-bordered table-hover dataTable no-footer" id="sample-table"
                   role="grid" aria-describedby="sample-table_info">
              <thead>
              <tr role="row">
                <th width="25" class="sorting_disabled" rowspan="1" colspan="1" aria-label=""
                    style="width: 20.3333px;"><label><input id="selectedAll" type="checkbox"><span
                  class="lbl"></span></label>
                </th>
                <th width="80" tabindex="0" aria-controls="sample-table" rowspan="1"
                    colspan="1" aria-sort="descending" aria-label="ID: 升序排列" style="width: 90px;">ID
                </th>
                <th width="100" tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                    aria-label="用户名" style="width: 80px;">姓名
                </th>
                <th width="100" tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                    aria-label="用户名" style="width: 80px;">用户名
                </th>
                <th width="80" tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                    aria-label="性别" style="width: 60px;">性别
                </th>
                <th width="120" tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                    aria-label="手机" style="width: 150px;">手机
                </th>
                <th width="150" tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                    aria-label="邮箱" style="width: 150px;">邮箱
                </th>
                <th width="150" tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                    aria-label="地址" style="width: 350px;">头像
                </th>
                <th width="250" tabindex="0" aria-controls="sample-table" rowspan="1" colspan="1"
                    aria-label="操作" style="width: 200px;">操作
                </th>

              </tr>
              </thead>
              <tbody>
              
              <%
              for(int i = 0; i < userList.size(); i++) {
            	  User iuser = userList.get(i);
              %>
              	<tr role="row" class="odd">
                <td><label><input type="checkbox" name="checkbox" id="<%=iuser.getUserId()%>" value="<%=iuser.getUserId()%>"><span class="lbl"></span></label></td>
                <td class="sorting_1" value="5">
                <% 
                out.print(iuser.getUserId());
                %>
                </td>
                <td><u style="cursor:pointer" class="text-primary">
                <%
             	out.print(iuser.getName());
                %></u></td>
                <td>
                <%
                out.print(iuser.getUsername());
                %></td>
                <td>
                <%
                out.print(iuser.getUserSex());
                %>
                </td>
                <td>
                <%
                out.print(iuser.getUserPhoneNumber());
                %></td>
                <td>
                <%
                out.print(iuser.getUserEmail());
                %></td>
                <td class="text-l">
                <%
                out.print(iuser.getUserPhoto());
                %>
                </td>

                <td class="td-manage">

                  <a id="<%=iuser.getUserId() %>" title="编辑" href="javascript:;" class="btn btn-xs btn-info" onclick="member_edit(this.parentNode.parentNode.cells[1].innerHTML, this.id)">编辑</a>

                  <a id="<%=iuser.getUserId() %>" title="删除" href="javascript:;" class="btn btn-xs btn-warning" onclick="member_del(this, this.parentNode.parentNode.cells[1].innerHTML, this.id)">删除</a>
                </td>
                </tr>
              <%
              }
              %>
              </tbody>


            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>



<div class="add_menber" id="add_menber_style" style="display:none">
  <form action=${pageContext.request.contextPath}/adminAddUser.do id="addUser" enctype="multipart/form-data" method="post">
  <ul class=" page-content">
    <li><label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label><span class="add_name"><input value="" name="username" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
    <li><label class="label_name">真实姓名：</label><span class="add_name"><input name="name" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>

    <li><label class="label_name">密码：</label><span class="add_name"><input name="userPassword" type="password"  class="form-control"/></span><div class="prompt r_f"></div></li>
        <li>
      <label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name">
      <input name="userSex" value="男" style="display: none"></input>
     <label><input name="form-field-radio" type="radio" checked="checked" onchange="getSex()" value="男"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio" type="radio" onchange="getSex()" value="女"><span class="lbl" value="女">女</span></label>&nbsp;&nbsp;&nbsp;
     </span>
      <div class="prompt r_f"></div>
      <script>
        function getSex() {
          var sex = $('#add_menber_style input[name="form-field-radio"]:checked ').val();
          $("#add_menber_style input[name='userSex']").val(sex);
        
        }
      </script>
    </li>
    <li><label class="label_name">手机：</label><span class="add_name"><input name="userPhoneNumber" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
    <li><label class="label_name">邮箱：</label><span class="add_name"><input name="userEmail" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
    <!--<li class="adderss"><label class="label_name">家庭住址：</label><span class="add_name"><input name="家庭住址" type="text"  class="text_add" style=" width:350px"/></span><div class="prompt r_f"></div></li>-->
    <li style="display: block">
      <nobr>
        <span class="add_name">
        <label label class="label_name">图片：</label>
        <input type="file" name="img" multiple="multiple"  style="display: inline-block" />
        </span>
      </nobr>
    </li>
  </ul>
  </form>
</div>

<div class="add_menber" id="update_menber_style" style="display:none">
  <form action=${pageContext.request.contextPath}/adminUpdateUser.do id="updateUser" enctype="multipart/form-data" method="post">
  <ul class=" page-content">
    <li><label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label><span class="add_name"><input value="" name="username" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
    <li><label class="label_name">真实姓名：</label><span class="add_name"><input name="name" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>

    <li><label class="label_name">密码：</label><span class="add_name"><input name="userPassword" type="password"  class="form-control"/></span><div class="prompt r_f"></div></li>
    <li>
      <label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name">
      <input name="userSex" value="男" style="display: none"></input>
     <label><input name="form-field-radio" type="radio" checked="checked" onchange="getSex()" value="男"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio" type="radio" onchange="getSex()" value="女"><span class="lbl" value="女">女</span></label>&nbsp;&nbsp;&nbsp;
     </span>
      <div class="prompt r_f"></div>
      <script>
        function getSex() {
          var sex = $('#update_menber_style input[name="form-field-radio"]:checked ').val();
          $("#update_menber_style input[name='userSex']").val(sex);
        
        }
      </script>
    </li>
    <li><label class="label_name">手机：</label><span class="add_name"><input name="userPhoneNumber" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
    <li><label class="label_name">邮箱：</label><span class="add_name"><input name="userEmail" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
    <!--<li class="adderss"><label class="label_name">家庭住址：</label><span class="add_name"><input name="家庭住址" type="text"  class="text_add" style=" width:350px"/></span><div class="prompt r_f"></div></li>-->
    <li style="display: block">
      <nobr>
        <span class="add_name">
        <label label class="label_name">图片：</label>
        <input type="file" name="img" multiple="multiple"  style="display: inline-block" />
        </span>
      </nobr>
    </li>
  </ul>
  </form>
</div>

<script>

	function refresh(){
		 //location.reload(); // 父页面刷新
   		window.location.reload();//刷新当前页面.
   	}

  jQuery(function($) {
    var oTable1 = $('#sample-table').dataTable( {
      "aaSorting": [[ 1, "desc" ]],//默认第几个排序
      "bStateSave": true,//状态保存
      "aoColumnDefs": [
        //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
        {"orderable":false,"aTargets":[0,7]}// 制定列不参与排序
      ] } );


    $('table th input:checkbox').on('click' , function(){
      var that = this;
      $(this).closest('table').find('tr > td:first-child input:checkbox')
        .each(function(){
          this.checked = that.checked;
          $(this).closest('tr').toggleClass('selected');
        });

    });


    $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
    function tooltip_placement(context, source) {
      var $source = $(source);
      var $parent = $source.closest('table')
      var off1 = $parent.offset();
      var w1 = $parent.width();

      var off2 = $source.offset();
      var w2 = $source.width();

      if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
      return 'left';
    }
  })
  /*用户-添加*/
  $('#member_add').on('click', function(){
	
    layer.open({
      type: 1,
      title: '添加用户',
      maxmin: true,
      shadeClose: true, //点击遮罩关闭层
      area : ['800px' , ''],
      content:$('#add_menber_style'),
      btn:['提交','取消'],
      yes:function(index,layero){
        var num=0;
        var str="";
        $("#add_menber_style input[type$='text']").each(function(n){
          if($(this).val()=="")
          {

            layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
              title: '提示框',
              icon:0,
            });
            num++;
            return false;
          }
        });
        if(num>0){  return false;}
        else{
          $("#add_menber_style #addUser").submit();
          layer.close(index);
        }
      	//refresh();
      }
    });
  });
  /*用户-查看*/
  function member_show(title,url,id,w,h){
    layer_show(title,url+'#?='+id,w,h);
  }
  /*用户-停用*/
  function member_stop(obj,id){
    layer.confirm('确认要停用吗？',function(index){
      $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
      $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
      $(obj).remove();
      layer.msg('已停用!',{icon: 5,time:1000});
    });
  }

  /*用户-启用*/
  function member_start(obj,id){
    layer.confirm('确认要启用吗？',function(index){
      $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
      $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
      $(obj).remove();
      layer.msg('已启用!',{icon: 6,time:1000});
    });
  }
  /*用户-编辑*/
  function member_edit(id, updateUserId){
	setCookie("updateUserId", updateUserId, 365);
    layer.open({
      type: 1,
      title: '修改用户信息',
      maxmin: true,
      shadeClose:false, //点击遮罩关闭层
      area : ['800px' , ''],
      content:$('#update_menber_style'),
      btn:['提交','取消'],
      yes:function(index,layero){
        var num=0;
        var str="";
        $("#update_menber_style input[type$='text']").each(function(n){
          if($(this).val()=="")
          {

            layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
              title: '提示框',
              icon:0,
            });
            num++;
            return false;
          }
        });
        if(num>0){  return false;}
        else{
          layer.alert('添加成功！',{
            title: '提示框',
            icon:1,
          });
          $("#update_menber_style #updateUser").submit();
          layer.close(index);
        }
      }
    });
  }
  /*用户-删除*/
  function member_del(obj,id,userId){
    layer.confirm('确认要删除吗？',function(index){
      $(obj).parents("tr").remove();
      
      setCookie("userId",userId,365);
      transpDel();
      layer.msg('已删除!',{icon:1,time:1000});
    });
  }
  laydate({
    elem: '#start',
    event: 'focus'
  });
  
  function transpDel() {
		$.ajax({
			type : "GET",
			async : false,
			url : "${pageContext.request.contextPath}/deleteUserAjax.do"
		})
	}

	function setCookie(c_name, value, expiredays) {
		var exdate = new Date()
		exdate.setDate(exdate.getDate() + expiredays)
		document.cookie = c_name
				+ "="
				+ escape(value)
				+ ((expiredays == null) ? "" : ";expires="
						+ exdate.toGMTString())
	}
	
	function getCookie(c_name)
	{
	if (document.cookie.length>0)
	  {
	  c_start=document.cookie.indexOf(c_name + "=")
	  if (c_start!=-1)
	    { 
	    c_start=c_start + c_name.length+1 
	    c_end=document.cookie.indexOf(";",c_start)
	    if (c_end==-1) c_end=document.cookie.length
	    return unescape(document.cookie.substring(c_start,c_end))
	    } 
	  }
	return ""
	}
	
	function transpDelPart() {
		$.ajax({
			type : "GET",
			async : false,
			url : "${pageContext.request.contextPath}/deleteUserPartAjax.do"
		})
	}

	function deletePart() {
		var chckBox = document.getElementsByName("checkbox");
		var num = chckBox.length;
		var ids = "";
		for (var index = 0; index < num; index++) {
			if (chckBox[index].checked) {
				ids += chckBox[index].value + ".";
			}
		}
		alert(ids);
		setCookie("deletePart", ids, 365);
		transpDelPart();
	}
</script>

</body>
</html>
