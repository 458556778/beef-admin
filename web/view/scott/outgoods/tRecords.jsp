<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <%@include file="/view/resource.jsp" %>
  </head>
  <style>
	  .blockdiv{
		  width: 60px;padding-top: 5px; margin-left: 5px; margin-right: 5px;float:left;text-align: center ;
	  }
	  .blockdiv-input{
		  width: 100%;border: 1px solid black;padding-top: 3px;margin: 1px;
	  }
	  .redborder{
		  border: 1px solid red;
	  }

	 .printdivblock{

	 }
	  .printableblock{
		  margin-left: 5px;
		  /*border-right:1px dashed ;*/
	  }
	  .printableblock tr{
		  margin-top: 3px;
	  }


  </style>


  <body class="easyui-layout">
 	 <!-- Search panel start -->
 	 <div class="ui-search-panel" region="north" style="height: 80px;" title="过滤条件" data-options="striped: true,collapsible:false,iconCls:'icon-search',border:false" >  
 	 <form id="searchForm">
        <p class="ui-fields">
			<label class="ui-label">仓库:</label>
			<select  class="easyui-combobox"   name="warehouseid" id="warehouseid"  style="width:100px;">
			</select>
			<label class="ui-label">型号:</label>
			<select  class="easyui-combobox"  name="goodskindid" id="goodskindid" style="width:100px;" >
			</select>
			<label class="ui-label">买家:</label>
			<select  class="easyui-combobox"   name="peopleid" id="peopleid" style="width:100px;" >
			</select>
			<label class="ui-label">时间阶段:</label>
			<input name="begintime" id="begintime" type="text" maxlength="" class="easyui-datetimebox" >
			-
			<input name="endtime" id="endtime" type="text" maxlength="" class="easyui-datetimebox" >


	    </p>
	    <a href="#" id="btn-search" class="easyui-linkbutton" iconCls="icon-search">查询</a>
      </form>  
     </div> 
     <!--  Search panel end -->

     <!-- Data List -->
     <div region="center" border="false" >
     <table id="data-list"></table>
	 </div>

     <!-- Edit Win&Form -->
     <div id="edit-win" class="easyui-dialog" title="出库码单" data-options="closed:true,iconCls:'icon-save',modal:true,maximizable:true" style=" margin-top: 5px; width:515px; height: 600px;">
     	<form id="editForm" class="ui-form" method="post">  
     		 <input class="hidden" name="id" >
     		 <div class="ui-edit">
		     	   <div class="ftitle"></div>
					<div>
						<label>仓库:</label>
						<select class="easyui-combobox" name="warehouseid" id="formwarehouseid" style="width: 80px"></select>
						<label>时间:</label>
						<input name="createtime" type="text" maxlength="" class="easyui-datetimebox" missingMessage="请填写创建时间">
						<br/>
						<label>买家:</label>
						<select class="easyui-combobox" name="peopleid" id="formpeopleid" style="width: 80px">
						</select>
						<label>型号:</label>
						<select class="easyui-combobox" name="goodskindid" id="formgoodskindid" style="width: 80px"></select>
						<label>价格(元/斤):</label>
						<input name="price" id="price"  type="text"  style="width: 55px">
						<label>件数:</label>
						<input name="nums" id="nums" type="text" style="width: 55px"  readonly="true" >

					<%--<label>状态</label>--%>
						<input name="status" type="hidden" value="2" >
					</div>

					<div style=" margin:5px auto;  padding-top: 5px;  border-top:1px solid #ccc;  width:470px; ">
						<label>重量格式:</label>
							<select id="weightformat" name="weightformat" style="width: 80px" disabled="true" >
								<option value="0">四位数</option>
								<option value="1">五位数</option>
							</select>
						&nbsp;&nbsp;&nbsp;<label>各仓库剩余件数:&nbsp;</label><label id="warehousuleft"></label>
						<br/><br/>
						<input name="details" id="details" type="hidden" >
						<div id="divlistblock" style=" width: 88%; text-align: center; margin: 0 auto; "></div>
						<div style="clear: both;margin-top: 5px">
							<%--<label>备注:</label>--%>
							<input name="remark" id="remark" type="hidden" >
							<%--<textarea id="remarktextarea" style="width: 100%;height: 50px " ></textarea>--%>
								&nbsp;&nbsp;
							<label>总重:</label>
							<label id="totalweight" >******</label> (公斤/KG)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label>总价</label><label style="color: red" >(总价=总重*2*单价)</label><label>:</label>
							<label id="totalprice">******</label>(元)
						</div>
					</div>
  			</div>
     	</form>
  	 </div>
	 <div id="print-win" class="easyui-dialog" title="打印预览" data-options="closed:true,iconCls:'icon-save',modal:true,maximizable:true" style=" margin-top: 5px; width:1054px; height: 620px;">
		 <div id="printdivblock" style=" width: 100%;text-align: left;" >
			 <h2 style="text-align: center" >销售单</h2>
			<table id="printableblock" style="width: 95%; margin: 10px auto">

			</table>
		 </div>
	 </div>
	 <script type="text/javascript" src="<%=basePath%>/view/scott/outgoods/page-tRecords.js"></script>
	 <script type="text/javascript" src="/js/jprint/jquery.jqprint-0.3.js"></script>
  </body>
</html>
