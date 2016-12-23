<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include "../common/common.ftl"/>
    <script type="text/javascript" src="/design/frame/zui/lib/chosen/chosen.min.js"></script>
    <script type="text/javascript" src="/design/static/js/app/product/productManage.js"></script>
	<link rel="stylesheet" type="text/css" href="/design/frame/zui/lib/chosen/chosen.css"/>
    <link rel="stylesheet" type="text/css" href="/design/static/css/product/productManage.css"/>
  </head>
  <body>
    <form action="/product/productManage" id="mainPageForm" method="post">
  	<div class="current_nav_name clearfix">产品中心
		<div class="fr small_size"> 
		<button class="btn btn-sm " type="button" onclick="showProductDialog('添加产品')">
			<i class="icon icon-plus-sign"></i> 添加产品
		</button>
		<button class="btn btn-sm " type="button" onclick="showUploadProductDialog('批量导入产品')">
			<i class="icon icon-upload-alt"></i> 批量导入产品
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
	            <th>SKU</th>
	            <th>SPU</th>
	            <th>基本信息</th>
	            <th style="min-width:110px;">主图</th>
	            <!--
	            <th>尺寸信息</th>
	            -->
	            <th style="min-width:120px;">采购信息</th>
	            <th>审核状态</th>
	            <th>人员信息</th>
	            <th style="min-width:180px;">时间信息</th>
	            <th style="min-width:40px;">日志</th>
	            <th>操作</th>
	          </tr>
	          <tr class="conditionTr">
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
	          	<td>
	          		<ul>
	          			<li>
	          				<#if page.params.productNameQuery??> 
	          					<@select id="productNameQuery" name="params[productNameQuery]" selected="${page.params.productNameQuery}" optionClass="ProductNameQuery"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				<#else>
	          					<@select id="productNameQuery" name="params[productNameQuery]"  optionClass="ProductNameQuery"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				</#if>
	          			</li>
	          			<li><input type="text" class="txt width_100px" name="params[productNameValue]" value="${page.params.productNameValue!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[productNameValueLike]" <#if page.params.productNameValueLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td></td>
	          	<td></td>
	          	<td>
	          		<ul>
	          			<li>
	          			<#if page.params.auditStatus??> 
          					<@select id="auditStatus" name="params[auditStatus]" selected="${page.params.auditStatus}" optionClass="ProductAuditStatus"  cssClass="sel width_50px" headerKey="" headerValue=""/>
          				<#else>
          					<@select id="auditStatus" name="params[auditStatus]"  optionClass="ProductAuditStatus"  cssClass="sel width_50px" headerKey="" headerValue=""/>
          				</#if>
	          			</li>
	          			<li></li>
					</ul>	
	          	</td>
	          	<td>
	          		<ul>
	          			<li>
		          			<#if page.params.productUserQuery??> 
	          					<@select id="productUserQuery" name="params[productUserQuery]" selected="${page.params.productUserQuery}" optionClass="ProductUserQuery"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				<#else>
	          					<@select id="productUserQuery" name="params[productUserQuery]"  optionClass="ProductUserQuery"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				</#if>
	          			</li>
	          			<li>
	          				<#if page.params.userSelect??> 
	          					<@select id="userSelect" name="params[userSelect]" selected="${page.params.userSelect}" optionClass="UserSelect"  cssClass="chosen-select form-control width_100px" headerKey="" headerValue="" tabindex="2"/>
	          				<#else>
	          					<@select id="userSelect" name="params[userSelect]"  optionClass="UserSelect"  cssClass="chosen-select form-control width_100px" headerKey="" headerValue="" tabindex="2"/>
	          				</#if>
	          			</li>
	          		<ul>
	          	</td>
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
	          	<td></td>
	          </tr>
	          </form>
	          	<#if collection??>
	          		<#list collection as obj>
	      		 <tr>
		            <td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="1" onclick="countCheckbox()" /></td>
		            <td>
		            	${obj.sku!''}
		            </td>
		            <td>
		            	${obj.spu!''}
		            </td>
		            <td>
		            	中文名：${obj.nameCn!''}<br/>
		            	英文名：${obj.nameEn!''}
		            </td>
		            <td><img src="${obj.mainImage!''}" width="100" height="100"/></td>
		            <!--
		            <td>
		            	包裹长度：10（cm）<br/>
		          		包裹宽度：10（cm）<br/>
		          		包裹高度：5（cm）<br/>
		          		包裹重量：50（g）<br/>
		            </td>
		            -->
		            <td>
		            	采购价：${obj.purchasePrice!''}<br/>
		            	采购链接：<a href="${obj.purchaseUrl!''}" target="_blank" >打开链接</a><br/>
		            	采购备注：${obj.purchaseNotes!''}
		            </td>
		            <td><@matchValue key="${obj.auditStatus!''}" optionClass="ProductAuditStatus"/></td>
		            <td>
		            	创建人：<@matchValue key="${obj.creatorId!''}" optionClass="UserSelect"/><br/>
		            	编辑人：<@matchValue key="${obj.editorId!'未分配'}" optionClass="UserSelect"/><br/>
		            	刊登人：<@matchValue key="${obj.publishUserId!'未分配'}" optionClass="UserSelect"/><br/>
		            </td>
		            <td>
		            	创建时间：<br/>${obj.createTime!''}<br/>
		            	修改时间：<br/>${obj.updateTime!''}<br/>
		            </td>
		            <td>
		            	<a href="javascript:void(0)" onclick="showLog(this)"><img src="/design/static/images/common/system-log.png"/></a>
		            	<div class="log_content">
		            		${obj.optionLog!''}
		            	</div>
		            </td>
		            <td class="optionTd" style="width:60px;text-align:center;">
		            	<div class="btn-group">
						  <button type="button" class="btn dropdown-toggle btn-sm" data-toggle="dropdown">
						  	操作
						  	<span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu pull-right" role="menu">
						    <li><a href="javascript:void(0)" onclick="editProduct(${obj.id})"><i class="icon icon-edit"></i> 编辑 </a></li>
						    <li><a href="javascript:void(0)" onclick="reviewAudit(${obj.id})" ><i class="icon icon-check-board"></i> 查看审核 </a></li>
						    <li><a href="javascript:void(0)" onclick="showDistributionEditUserDialog('分配编辑人')" ><i class="icon icon-hand-right"></i> 分配编辑人</a></li>
						    <li><a href="javascript:void(0)" onclick="reviewAudit(${obj.id})" ><i class="icon icon-hand-right"></i> 分配刊登人</a></li>
						    <li class="divider"></li>
						    <li><a href="javascript:void(0)" onclick="confirmMsg('deleteProduct(${obj.id})')" ><i class="icon icon-trash"></i> 删除 </a></li>
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
									<option value="batchUploadOffers">批量分配编辑人</option>
									<option value="batchUpdateToWaitPendding">批量分配刊登人</option>
									<option value="batchShelvesProduct">批量删除</option>
									<option value="batchDelete">批量通过审核</option>
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
	
	<div id="productDialog" style="display:none;">
		<input type="hidden" name="id"/>
		<div id="tabs">
		  <ul>
		    <li><a href="#tabs-1">基本信息</a></li>
		    <li><a href="#tabs-2">视图信息</a></li>
		    <li><a href="#tabs-3">采购信息</a></li>
		    <li><a href="#tabs-4">尺寸信息</a></li>
		    <li><a href="#tabs-5">描述信息</a></li>
		  </ul>
		  <div id="tabs-1">
		    <table class="popup_tb">
		 		<tr>
		 			<td class="title width_100px">SKU<i class="star">*</i></td>
		 			<td><input type="text" class="txt width_50" name="sku"/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">SPU<i class="star">*</i></td>
		 			<td><input type="text" class="txt width_50" name="spu"/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">中文名<i class="star">*</i></td>
		 			<td><input type="text" class="txt width_98" name="nameCn"/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">英文名</td>
		 			<td><input type="text" class="txt width_98" name="nameEn" /></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">法语名</td>
		 			<td><input type="text" class="txt width_98" name="nameFr" /></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">德语名</td>
		 			<td><input type="text" class="txt width_98" name="nameDe" required/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">意大利语名</td>
		 			<td><input type="text" class="txt width_98" name="nameIt" required/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">日语名</td>
		 			<td><input type="text" class="txt width_98" name="nameJp" required/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">西班牙语名</td>
		 			<td><input type="text" class="txt width_98" name="nameEs" required/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">中文报关名</td>
		 			<td><input type="text" class="txt width_98" name="declarationNameCn" required/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">英文报关名</td>
		 			<td><input type="text" class="txt width_98" name="declarationNameEn" required/></td>
		 		</tr>
		 	</table>
		  </div>
		  
		  <div id="tabs-2">
			<div class="alert alert-info" style="padding:10px;">
			 	注意：第一张图片为主图，拖拽图片可移动图片位置。删除图片后，点击保存才会生效。
			</div>
			<input type="text" class="txt" style="width:80%;" id="imageUrlAddress" placeholder="图片地址/Url" value="http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg"/>
		  	<button class="btn btn-sm " type="button" onclick="addImageUrlAddress();">
				<i class="icon icon-plus-sign"></i> 添加
			</button>
			
			<table class="width_100" style="margin-top:10px;">
				<tr>
					<td>
						<ul id="sortable"></ul>
					</td>
				</tr>
			</table>
			
	 	  </div>
	 	  
		  <div id="tabs-3">
	  		<table class="popup_tb">
		 		<tr>
		 			<td class="title width_100px">采购价格</td>
		 			<td><input type="text" class="txt width_100px" name="purchasePrice"/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">采购链接</td>
		 			<td><input type="text" class="txt width_96" name="purchaseUrl"/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">采购备注</td>
		 			<td><textarea class="txt width_96 remark" name="purchaseNotes" style="height:150px;"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">销售备注</td>
		 			<td><textarea class="txt width_96 remark" name="salesNotes" style="height:150px;"></textarea></td>
		 		</tr>
	 		</table>
		  </div>
		  
		  <div id="tabs-4">
			  <table class="popup_tb">
		 		<tr>
		 			<td class="title width_100px">含包装重量(g)</td>
		 			<td><input type="text" class="txt width_100px" name="packageWeight"/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">包装长度(cm)</td>
		 			<td><input type="text" class="txt width_100px" name="packageLength"/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">包装宽度(cm)</td>
		 			<td><input type="text" class="txt width_100px" name="packageWidth"/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">包装高度(cm)</td>
		 			<td><input type="text" class="txt width_100px" name="packageHeight"/></td>
		 		</tr>
	 		</table>
		  </div>
		  
		  <div id="tabs-5">
	  		<table class="popup_tb">
		 		<tr>
		 			<td class="title width_100px">中文描述</td>
		 			<td><textarea id="descriptionCn" name="descriptionCn"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">英文描述</td>
		 			<td><textarea id="descriptionEn" name="descriptionEn"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">法语描述</td>
		 			<td><textarea id="descriptionFr" name="descriptionFr"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">德语描述</td>
		 			<td><textarea id="descriptionDe" name="descriptionDe"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">日语描述</td>
		 			<td><textarea id="descriptionJp" name="descriptionJp"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">西班牙语描述</td>
		 			<td><textarea id="descriptionEs" name="descriptionEs"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">意大利语描述</td>
		 			<td><textarea id="descriptionIt" name="descriptionIt"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">中文简述</td>
		 			<td><textarea id="briefDescriptionCn" name="briefDescriptionCn"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">英文简述</td>
		 			<td><textarea id="briefDescriptionEn" name="briefDescriptionEn"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">法语简述</td>
		 			<td><textarea id="briefDescriptionFr" name="briefDescriptionFr"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">德语简述</td>
		 			<td><textarea id="briefDescriptionDe" name="briefDescriptionDe"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">日语简述</td>
		 			<td><textarea id="briefDescriptionJp" name="briefDescriptionJp"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">西班牙语简述</td>
		 			<td><textarea id="briefDescriptionEs" name="briefDescriptionEs"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">意大利语简述</td>
		 			<td><textarea id="briefDescriptionIt" name="briefDescriptionIt"></textarea></td>
		 		</tr>
	 		</table>
		  </div>
		  
		</div>
		<div class="validateTip"></div>
	</div>
	
	<div id="uploadProductDialog" style="display:none;">
		<table class="popup_tb">
	 		<tr>
	 			<td class="title width_100px">上传文件<i class="star">*</i></td>
	 			<td><input type="file" class="form-control" value="" style="width:50%"></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">模板文件下载<i class="star">*</i></td>
	 			<td><a><i class="icon icon-file-excel"></i> 商品导入文件模板下载</a></td>
	 		</tr>
 		</table>
		
	</div>
	
	<div id="auditProductDialog" style="display:none;">
		<div class="comments">
		  <section class="comments-list">
		    <div class="comment">
		      <a href="###" class="avatar">
		        <i class="icon-user icon-2x"></i>
		      </a>
		      <div class="content">
		        <div class="pull-right text-muted">2016-05-10 10:56:25</div>
		        <div><a href="###"><strong>Catouse</strong></a></div>
		        <div class="text">你到底把我家钥匙放哪里了...</div>
		      </div>
		    </div>
		    
		    <div class="comment">
		      <a href="###" class="avatar">
		        <i class="icon-yinyang icon-2x"></i>
		      </a>
		      <div class="content">
		        <div class="pull-right text-muted">2016-05-10 10:56:25</div>
		        <div><a href="###"><strong>张三</strong></a></div>
		        <div class="text">对不起我也没看见</div>
		      </div>
		    </div>
		    
		  </section>
		  <footer>
		    <div class="reply-form" id="commentReplyForm1">
		      <a href="###" class="avatar"><i class="icon-user icon-2x"></i></a>
		      <form class="form">
		        <div class="form-group">
		          <textarea class="form-control new-comment-text" rows="3" placeholder="撰写留言..." style="width:98%"></textarea>
		        </div>
		      </form>
		    </div>
		  </footer>
		</div>
	</div>
	
	<div id="distributionEditUserDialog" style="display:none;">
		<table class="popup_tb">
	 		<tr>
	 			<td class="title width_100px">分配编辑人员<i class="star">*</i></td>
	 			<td>
	 				<select id="editUserSelect" class="chosen-select form-control" tabindex="2">
			            <option value="cat">小猫</option>
			            <option value="dog">小狗</option>
			            <option value="fish">金鱼</option>
			            <option value="dragon">龙</option>
			            <option value="cat">小猫</option>
			            <option value="dog">小狗</option>
			            <option value="fish">金鱼</option>
			            <option value="dragon">龙</option>
			            <option value="cat">小猫</option>
			            <option value="dog">小狗</option>
			            <option value="fish">金鱼</option>
			            <option value="dragon">龙</option>
			            <option value="cat">小猫</option>
			            <option value="dog">小狗</option>
			            <option value="fish">金鱼</option>
			            <option value="dragon">龙</option>
		          </select>
	 			</td>
	 		</tr>
 		</table>
	</div>
	
  </body>
</html>