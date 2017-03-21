<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include "../common/common.ftl"/>
    <script type="text/javascript" src="/design/static/js/app/shopee/shopeePublishManage.js"></script>
    <link rel="stylesheet" type="text/css" href="/design/static/css/shopee/shopeePublishManage.css"/>
  </head>
  <body>
    <form action="/shopee/shopeePublishManage" id="mainPageForm" method="post">
  	<div class="current_nav_name clearfix">Shopee<@s.message "shopee.publish.manage"/>
		<div class="fr small_size">
			<button class="btn btn-sm" type="button" onclick="getShopeeSkuList('获取刊登SKU')"> 获取刊登SKU <span class="label label-badge" id="userShopeeCount">${userShopeeSkuCount}</span></button>
			<button class="btn btn-sm" type="button" onclick="showShopeeProductDialog('创建刊登')"><i class="icon icon-plus-sign"></i>  创建刊登 </button>
		</div>
	</div>
	<#include "../common/page.ftl"/>
	<div class="mainbody clearfix"> 
	  <div class="tableview clearfix">
	    <div class="content">
	      <table class="tb_border tb_full stripe" id="shopeePublishTable" name="pageTable">
	          <tr>
	          	<th></th>
	            <th><!--<i class="icon icon-caret-up"></i>-->SKU</th>
	            <th><!--<i class="icon icon-caret-down"></i>-->SPU</th>
	            <th style="width:110px;">主图</th>
	            <th style="width:160px;">名称</th>
	            <th style="min-width:80px;">品牌名</th>
	            <th>CategoryID</th>
	            <th style="min-width:60px;">价格</th>
	            <th>库存</th>
	            <th>产品重量</th>
	            <th>运输时间</th>
	            <th>编辑状态</th>
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
	          			<li><input type="text" class="txt width_100px" name="params[parentSku]" value="${page.params.parentSku!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[parentSkuLike]" <#if page.params.parentSkuLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td>
	          	</td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[productName]" value="${page.params.productName!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[productNameLike]" <#if page.params.productNameLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td></td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[categoryId]" value="${page.params.categoryId!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[categoryIdLike]" <#if page.params.categoryIdLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td></td>
	          	<td></td>
	          	<td></td>
	          	<td></td>
	          	<td>
	          		<li>
          				<#if page.params.status??> 
          					<@select id="status" name="params[status]" selected="${page.params.status}" optionClass="ShopeeProductStatus"  cssClass="sel width_100px" headerKey="" headerValue=""/>
          				<#else>
          					<@select id="status" name="params[status]"  optionClass="ShopeeProductStatus"  cssClass="sel width_60px" headerKey="" headerValue=""/>
          				</#if>
          			</li>
          			<li></li>
	          	</td>
	          	<td></td>
	          </tr>
	          </form>
	          	<#if collection??>
	          		<#list collection as obj>
			  		 <tr>
			            <td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="${obj.id}" onclick="countCheckbox()" /></td>
			            <td>${obj.sku}</td>
			            <td>${obj.parentSku!""}</td>
			            <td><img src="${obj.mainImage!''}" data-image="${obj.mainImage!''}" class="img-thumbnail" width="110"/></td>
			            <td>${obj.productName}</td>
			            <td>${obj.brand!""}</td>
			            <td>${obj.categoryId!""}</td>
			            <td>${obj.price!""}</td>
			            <td>${obj.stock!""}</td>
			            <td>${obj.weight!""}</td>
			            <td>${obj.shipOutIn!""}</td>
			            <td><@matchValue key="${obj.status}" optionClass="ShopeeProductStatus"/></td>
		            	<td class="optionTd" style="width:60px;text-align:center;">
			            	<div class="btn-group">
							  <button type="button" class="btn dropdown-toggle btn-sm" data-toggle="dropdown">
							  	操作
						  	  <span class="caret"></span>
							  </button>
				          		<ul class="dropdown-menu pull-right" role="menu">
								    <li><a href="javascript:void(0)" onclick="editMultiSku(${obj.id})" ><i class="icon icon-edit"></i> 编辑</a></li>
								    <li class="divider"></li>
								    <li><a href="javascript:void(0)" onclick="confirmMsg('deleteShopeeProduct(${obj.id})')" ><i class="icon icon-trash"></i> 删除 </a></li>
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
									<#if page.params._roleLevel gte 10>
										<option value="batchDistributeEditUser">生成平台上传文件</option>
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
	
	<div id="shopeeProductDialog" style="display:none;">
		<input type="hidden" name="id"/>
		<table class="popup_tb">
	 		<tr>
	 			<td class="title width_100px">SKU<i class="star">*</i></td>
	 			<td>
	 				<input type="text" class="txt width_100px" name="sku"/>
					&nbsp;<button class="btn btn-sm" type="button" onclick="getProductInfoBySku()">获取商品信息</button>	 			
	 			</td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">Parent SKU</td>
	 			<td>
	 				<input type="text" class="txt width_100px" name="parentSku"/>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">产品类别<i class="star">*</i></td>
	 			<td>
	 				<div>
	 					<button name="expandCategoryButton" class="btn btn-sm " type="button" onclick="expandCategory()">
	 						<i class="icon icon-double-angle-down"></i> <span id="categorybtnName">展开类别<span>
						</button>&nbsp;&nbsp;已选类别 &nbsp;&nbsp;:&nbsp;&nbsp;
	 					<span id="navigation"></span>
	 				</div>	
	 				<div class="category_area" id="categoryArea"></div>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">类别ID<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_100px" name="categoryId" onBlur="getCategoryById()"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">产品名称<i class="star">*</i></td>
	 			<td>
	 				<input type="text" class="txt width_60" style="height:30px;" name="productName"/>
	 				&nbsp;<button class="btn btn-sm" type="button" onclick="copyToSpuProductName()">粘贴到所有变体名称</button>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">产品图片<i class="star">*</i></td>
	 			<td>
	 				<div class="image_box">
	 					<div class="image_title">选择图片</div>
	 					<div class="image_count_info">
	 					<table class="image_info_table">
	 						<tr>
	 							<td style="text-align:left;width:70%">
	 								<input type="text" class="txt" style="width:400px;" id="imageUrlAddress_0" placeholder="图片地址/Url"/>
	 								<button class="btn btn-sm " type="button" onclick="addImageUrlAddress(0)">
	 									添加图片地址
	 								</button>
	 								<!--<a class="btn" onclick="clearImageUrlAddress();">清空</a>-->
	 							</td>
	 							<td style="text-align:right;">已选择图片：<span id="selectImageCount_0">0</span> 张 <!--| 最多 4 张图片--></div></td>
	 						</tr>
	 					</table>
	 					<div id="image_area">
	 						<ul id="sortable_0"></ul>
	 					</div>
	 				</div>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">价格<i class="star">*</i></td>
	 			<td>
	 				<input type="text" class="txt width_100px" name="price" onkeyup="inputNumOnly(this)"/>
	 				&nbsp;<button class="btn btn-sm" type="button" onclick="copyToSpuPrice()">粘贴到所有变体价格</button>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">库存<i class="star">*</i></td>
	 			<td class="form-condensed">
	 				<!--<input type="text" class="txt width_100px" name="stock"/>-->
	 				<input type="number" class="txt width_100px" name="stock" onkeyup="inputNumOnly(this)"/>
	 				&nbsp;<button class="btn btn-sm" type="button" onclick="copyToSpuStock()">粘贴到所有变体库存</button>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">产品重量<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_100px" name="weight"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">运输时间<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_100px" name="shipOutIn"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">品牌名<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_100px" name="brand"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">产品描述<i class="star">*</i></td>
	 			<td><textarea class="txt width_96 remark" name="description" style="height:150px;"></textarea></td>
	 		</tr>
 		</table>
 		
 		<br />
	 	<button class="btn btn-sm" type="button" onclick="addShopeeMultiSkuRow()">
	 		<i class="icon icon-plus-sign"></i>添加变体
	 	</button>
	 	
 		<table class="popup_tb" style="margin-top:10px;" name="multiSkuTable">
	 		<tr>
	 			<td class="title" style="text-align:center;" colspan="9">变体SKU</td>
	 		</tr>
	 		<!--
	 		<tr id="multiRow_1">
	 			<td class="title">SKU</td>
	 			<td class="width_170px">
	 				<input type="text" class="txt width_80px" name="multiSku_1"/>
	 				&nbsp;<button class="btn btn-sm" type="button" onclick="getmultiSkuProductInfo(1)">加载信息</button>
	 			</td>
	 			<td class="title">价格</td>
	 			<td class="width_100px"><input type="text" class="txt width_90" name="multiPrice_1" onkeyup="inputNumOnly(this)"/></td>
	 			<td class="title">库存</td>
	 			<td class="width_100px"><input type="number" class="txt width_90" name="multiStock_1" onkeyup="inputNumOnly(this)"/></td>
	 			<td class="title">名称</td>
	 			<td><input type="text" class="txt width_99" name="multiProductName_1"/></td>
	 			<td class="width_50px" rowspan="2"><button class="btn btn-sm btn-danger" type="button" onclick="removeMultiSkuRow(1)"><i class="icon icon-trash"></i></button></td>
	 		</tr>
	 		<tr id="multiImage_1">
	 			<td colspan="8">
	 				<div class="image_box">
	 					<div class="image_title">选择图片</div>
	 					<div class="image_count_info">
	 					<table class="image_info_table">
	 						<tr>
	 							<td style="text-align:left;width:70%">
	 								<input type="text" class="txt" style="width:400px;" id="imageUrlAddress_1" placeholder="图片地址/Url"/>
	 								<button class="btn btn-sm " type="button" onclick="addImageUrlAddress(1)">
	 									添加图片地址
	 								</button>
	 							</td>
	 							<td style="text-align:right;">已选择图片：<span id="selectImageCount_1">0</span> 张</div></td>
	 						</tr>
	 					</table>
	 					<div id="image_area">
	 						<ul id="sortable_1">
	 						</ul>
	 					</div>
	 				</div>
	 			</td>
	 		</tr>
	 		-->
 		</table>
 		<div class="validateTip"></div>
	</div>
	
	<div id="shopeeSkuListDialog" style="display:none;" title="刊登任务">
		<div class="mainbody clearfix"> 
			<div class="tableview clearfix">
				<div class="content">
					<table class="tb_border tb_full stripe" id="shopeeSkuListTable">
						<tr>
							<th></th>
							<th>SKU</th>
							<th>SPU</th>
							<th>图片</th>
							<th>名称</th>
						</tr>
					</table>
					<div class="paging clearfix">
						<div class="massaction">
							<!--
							<table class="tb_common">
								<tr>
									<td style="width:40%" class="td_left">
										<a href="javascript:void(0)" onclick="pageSelectAll();">全选</a>&nbsp;&nbsp;|&nbsp;&nbsp;
										<a href="javascript:void(0)" onclick="pageNoSelectAll();">全不选</a>&nbsp;&nbsp;|&nbsp;&nbsp;
										<a href="javascript:void(0)" onclick="pageUnselected();">反选</a>&nbsp;&nbsp;|&nbsp;&nbsp;
										已选择&nbsp;<span id="pageCheckCount">0</span>&nbsp;条
									</td>
								</tr>
							</table>
							-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>