<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include "../common/common.ftl"/>
    <script type="text/javascript" src="/design/frame/zui/lib/chosen/chosen.min.js"></script>
    <script type="text/javascript" src="/design/static/js/app/dataCollection/dataCollectionManage.js"></script>
  </head>
  <body>
    <form action="/dataCollection/dataCollectionManage" id="mainPageForm" method="post">
  	<div class="current_nav_name clearfix"> 数据采集
		<div class="fr small_size"> 
			<button class="btn btn-sm " type="button" onclick="showCollectionDialog()">
				<i class="icon icon-plus-sign"></i> <@s.message "product.collection"/>
			</button>
		</div>
	</div>
	<#include "../common/page.ftl"/>
	<div class="mainbody clearfix"> 
	  <div class="tableview clearfix">
	    <div class="content">
	    
	      <table class="tb_border tb_full stripe" id="userManageTable" name="pageTable">
	          <tr>
	          	<th></th>
	          	<th>主图</th>
	            <th>SKU</th>
	            <th>SPU</th>
	            <th>颜色</th>
	            <th>尺寸</th>
	            <th>价格</th>
	            <th>重量</th>
	            <th>运费</th>
	            <th>起批数量</th>
	            <th>采集状态</th>
	            <th>采集时间</th>
	            <th>操作</th>
	          </tr>
	          <tr class="conditionTr">
	          	<td></td>
	          	<td></td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[sku]" value="${page.params.sku!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[skuLike]" <#if page.params.skuLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[spu]" value="${page.params.spu!''}" /></li>
          				<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[spuLike]" <#if page.params.spuLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td></td>
	          	<td></td>
	          	<td></td>
	          	<td></td>
	          	<td></td>
	          	<td></td>
	          	<td></td>
	          	<td>
	          		<ul>
						<li>
							<label>从：</label>
							<input type="text" class="txt width_100px datepicker" name="params[createTimeFrom]" value="${page.params.createTimeFrom!""}" />
						</li>
						<li>
							<label>到：</label>
							<input type="text" class="txt width_100px datepicker" name="params[createTimeTo]" value="${page.params.createTimeTo!""}" />
						</li>
					</ul>
	          	</td>
	          	<td></td>
	          </tr>
	          </form>
	          	<#--<#if collection??>
	          		<#list collection as obj>
	          		-->
	      		 <tr>
		            <td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="1" onclick="countCheckbox()" /></td>
		            <td>
		            	<img src="https://cbu01.alicdn.com/img/ibank/2017/042/158/3915851240_1619311604.jpg" data-image="https://cbu01.alicdn.com/img/ibank/2017/042/158/3915851240_1619311604.jpg" class="img-thumbnail" width="80"/>
		            </td>
		            <td>
		            	sk1
		            </td>
		            <td>
		            	sk-xml
		            </td>
		            <td>
		            	黄色
		            </td>
		            <td>XL【110-120斤】</td>
		            <td>16.0</td>
		            <td>
		            	0.5
		            </td>
		            <td>6</td>
		            <td>1</td>
		            <td>
		           		待编辑
		           		完成编辑
		           		已加入商品中心辑
		            </td>
		            <td>
		            	2016-01-01 12:00:00
		            </td>
		            <td class="optionTd" style="width:60px;text-align:center;">
		            	<div class="btn-group">
						  <button type="button" class="btn dropdown-toggle btn-sm" data-toggle="dropdown">
						  	操作
						  	<span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu pull-right" role="menu">
							    <li><a href="javascript:void(0)" onclick="editProduct()"><i class="icon icon-edit"></i> 编辑 </a></li>
							    <li><a href="javascript:void(0)" onclick="reviewAudit()" ><i class="icon icon-check-board"></i> 查看审核 </a></li>
							    <li class="divider"></li>
							    <li><a href="javascript:void(0)" onclick="confirmMsg('deleteProduct()')" ><i class="icon icon-trash"></i> 删除 </a></li>
						  </ul>
						</div>
		            </td>
		          </tr>
		        <#--</#list>
		  		</#if>-->
	      	</table>
			<div class="paging clearfix">
				<div class="massaction">
					<table class="tb_common">
						<tr>
							<td style="width:40%" class="td_left">
								<a href="javascript:void(0)" onclick="pageSelectAll();">全选</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								<a href="javascript:void(0)" onclick="pageNoSelectAll();">全不选</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								<a href="javascript:void(0)" onclick="pageUnselected();">反选</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								已选择&nbsp;<span id="pageCheckCount">0</span>&nbsp;条
							</td>
							<td class="td_right">批量操作&nbsp;&nbsp;
								<select class="sel" id="batchOptionSelect">
									<option value="" selected></option>
									<#if page.params._roleLevel gte 10>
										<#if !page.permissionBut?seq_contains("batch.distribute.edit.user")>
											<option limit="0" value="batchDistributeEditUser">批量分配编辑人</option>
										</#if>
										<#if !page.permissionBut?seq_contains("batch.distribute.publish.user")>
											<option limit="0" value="batchDistributePublishUser">批量分配刊登人</option>
										</#if>
											<!--<option value="batchApproved">批量通过审核</option>-->
										<#if !page.permissionBut?seq_contains("batch.delete.product")>
											<option value="batchDeleteProduct">批量删除</option>
										</#if>
										<option value="exportProductData">导出商品数据</option>
									<#else>
										<option value="batchSubmitAudit">批量提交审核</option>
									</#if>
								</select>
								&nbsp; <button class="btn btn-sm" type="button" onclick="batchOptionSubmit()">提交</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
	    </div>
	  </div>
	</div>
	
	<div id="dataCollectionDialog" style="display:none;" title="产品采集">
		<div class="alert alert-info" style="padding:10px;">
		 	目前支持：1688网站采集，请勿输入多个网址，单次只允许采集一个网址的产品信息。
		</div>
		<table style="width:100%">
			<tr>
				<td>
					<textarea class="txt width_100 remark" name="collectionUrl" style="height:60px;" placeholder="请填写要采集的产品网址"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<div class="fr small_size" style="margin-top:10px;margin-bottom: 10px;"> 
						<button class="btn btn-sm btn-primary" type="button" onclick="startCollection()">
							开始采集
						</button>
						<button class="btn btn-sm" type="button" onclick="resetCollectionUrl()">
							清空
						</button>
					</div>
				</td>
			</tr>
		</table>
		
		SPU&nbsp;:&nbsp;<input type="text" class="txt width_100px" name="firstSku"/>
		<button class="btn btn-sm" type="button" onclick="aKeyCreateSku()">
		一键生成SKU</button> 生成格式为：SPU-颜色-尺寸
		<table class="tb_border tb_full stripe" style="margin-top:10px;">
			<tr>
				<th></th>
				<th>主图</th>
				<th>SKU</th>
				<th>SPU</th>
				<th>颜色</th>
				<th>尺寸</th>
				<th>价格</th>
				<th>重量</th>
				<th>运费</th>
				<th>起批数量</th>
				<th>操作</th>
			</tr>
			<tr>
				<td style="text-align:center"><input name="" type="checkbox" value="1" onclick="countCheckbox()" /></td>
				<td>
					<img src="https://cbu01.alicdn.com/img/ibank/2017/042/158/3915851240_1619311604.jpg" data-image="https://cbu01.alicdn.com/img/ibank/2017/042/158/3915851240_1619311604.jpg" class="img-thumbnail" width="80"/>
				</td>
				<td><input type="text" class="txt width_100px" name="sku"/></td>
				<td><input type="text" class="txt width_100px" name="parentSku"/></td>
				<td><input type="text" class="txt width_100px" name="color"/></td>
				<td><input type="text" class="txt width_100px" name="size"/></td>
				<td><input type="text" class="txt width_80px" name="price"/></td>
				<td><input type="text" class="txt width_80px" name="weight"/></td>
				<td><input type="text" class="txt width_80px" name="freight"/></td>
				<td><input type="text" class="txt width_80px" name="beginAmount"/></td>
				<td>
					<button class="btn btn-sm btn-danger" type="button" onclick="removeMultiSkuRow(this)"><i class="icon icon-trash"></i></button>
				</td>
			</tr>
		</table>
		
	</div>
	
	
  </body>
</html>