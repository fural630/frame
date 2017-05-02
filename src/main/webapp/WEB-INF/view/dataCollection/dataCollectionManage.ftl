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
    
    <div style="margin:0px 10px;">
		<table style="width:100%; margin-top:10px;">
			<tr>
				<td colspan="2">
					<textarea class="txt width_100 remark form-control" name="collectionUrl" style="height:60px;" placeholder="请填写要采集的产品网址"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<div style="color: #03a2b6;">* 目前支持：1688网站采集，请勿输入多个网址，单次只允许采集一个网址的产品信息。</div>
				</td>
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
		<hr style="margin-top: 0px;margin-bottom: 0px;border: 0; border-top: 1px solid #e5e5e5;"/>
	</div>
	
  	<div class="current_nav_name clearfix"> 数据采集
  		<!--
		<div class="fr small_size"> 
			<button class="btn btn-sm " type="button" onclick="showCollectionDialog()">
				<i class="icon icon-plus-sign"></i> <@s.message "product.collection"/>
			</button>
		</div>
		-->
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
	          	<td>
	          		<ul>
	          			<li>
	          				<#if page.params.status??> 
	          					<@select id="status" name="params[status]" selected="${page.params.status}" optionClass="DataCollectionStatus"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				<#else>
	          					<@select id="status" name="params[status]"  optionClass="DataCollectionStatus"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				</#if>
	          			</li>
	          			<li></li>
					</ul>
	          	</td>
	          	<td>
	          		<ul>
						<li>
							<label>从：</label>
							<input type="text" class="txt width_100px datepicker" name="params[collectionTimeFrom]" value="${page.params.collectionTimeFrom!""}" />
						</li>
						<li>
							<label>到：</label>
							<input type="text" class="txt width_100px datepicker" name="params[collectionTimeTo]" value="${page.params.collectionTimeTo!""}" />
						</li>
					</ul>
	          	</td>
	          	<td></td>
	          </tr>
	          </form>
	          	<#if collection??>
	          		<#list collection as obj>
	      		 <tr>
		            <td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="${obj.id}" onclick="countCheckbox()" /></td>
		            <td>
            			<img src="${obj.imageUrl!""}" data-image="${obj.imageUrl!""}" class="img-thumbnail" width="80"/>
        				<br/><a href="${obj.url!"#"}" target="_blank">采集链接</a>
		            </td>
		            <td>
		            	${obj.sku!""}
		            </td>
		            <td>
		            	${obj.spu!""}
		            </td>
		            <td>
		            	${obj.color!""}
		            </td>
		            <td>${obj.size!""}</td>
		            <td>${obj.price!""}</td>
		            <td>
		            	${obj.weight!""}
		            </td>
		            <td>${obj.freight!""}</td>
		            <td>${obj.beginAmount!""}</td>
		            <td>
		           		<@matchValue key="${obj.status}" optionClass="DataCollectionStatus"/>
		            </td>
		            <td>
		            	${obj.collectionTime!""}
		            </td>
		            <td class="optionTd" style="width:60px;text-align:center;">
		            	<div class="btn-group">
						  <button type="button" class="btn dropdown-toggle btn-sm" data-toggle="dropdown">
						  	操作
						  	<span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu pull-right" role="menu">
							    <li><a href="javascript:void(0)" onclick="editProduct()"><i class="icon icon-edit"></i> 编辑 </a></li>
							    <li class="divider"></li>
							    <li><a href="javascript:void(0)" onclick="confirmMsg('deleteDataCollection(${obj.id})')" ><i class="icon icon-trash"></i> 删除 </a></li>
						  </ul>
						</div>
		            </td>
		          </tr>
		        </#list>
		  		</#if>
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
									<option value="batchDeleteDataCollection">批量删除</option>
									<option value="batchSubmitAudit">批量移送产品中心</option>
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
	
	<!--
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
		<table class="tb_border tb_full stripe" style="margin-top:10px;" name="collectionResultTable">
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
		</table>
		
	</div>
	-->
	
  </body>
</html>