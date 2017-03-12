$(function () {
	initDialog();
});

function initSortable(rowId) {
	$("#sortable_" + rowId).sortable();
}

function initDialog() {
	$("#shopeeProductDialog").dialog({
		autoOpen: false,
		modal: true,
		width: document.body.scrollWidth * 0.9,
		resizable: false,
		buttons : [ {
				text : "保存",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					saveShopeeProduct(5);
				}
			},{
				text : "完成编辑",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					saveShopeeProduct(10);
				}
			}
			
		],
		close: function( event, ui ) {
			cleanShopeeDialog();
		}
	});
	
	$("#shopeeSkuListDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 800,
		height: 550,
		resizable: false,
		buttons : [ {
				text : "获取",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					obtainShopeePublishSku();
				}
			},{
				text : "关闭",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					$("#shopeeSkuListDialog").dialog("close");
				}
			}
			
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#shopeeSkuListDialog");
		}
	});
}

function saveShopeeProduct(status) {
	if (validateShopeeProduct()) {
		var dialog = $("#shopeeProductDialog");
		var id = dialog.find("input[name=id]").val();
		if (id == "") {
			id = null;
		}
		var sku = $.trim(dialog.find("input[name=sku]").val());
		var parentSku = $.trim(dialog.find("input[name=parentSku]").val());
		var categoryPath = $("#navigation").text();
		var categoryId = $.trim(dialog.find("input[name=categoryId]").val());
		var productName = $.trim(dialog.find("input[name=productName]").val());
		var price = $.trim(dialog.find("input[name=price]").val());
		var stock = $.trim(dialog.find("input[name=stock]").val());
		var weight = $.trim(dialog.find("input[name=weight]").val());
		var shipOutIn = $.trim(dialog.find("input[name=shipOutIn]").val());
		var brand = $.trim(dialog.find("input[name=brand]").val());
		var description = $.trim(dialog.find("textarea[name=description]").val());
		
		var imageList = getCheckedImageUrl('0');
		
		var shopeePublish = {
			id : id,
			sku : sku,
			parentSku : parentSku,
			categoryPath : categoryPath,
			categoryId : categoryId,
			productName : productName,
			price : price,
			stock : stock,
			weight : weight,
			shipOutIn : shipOutIn,
			brand : brand,
			description : description,
			imageStr : JSON.stringify(imageList),
			mainImage : imageList[0],
			status : status
		};
		
		var shopeePublishList = new Array();
		shopeePublishList.push(shopeePublish);
		
		$("table[name='multiSkuTable'] input[name^='multiSku_']").each(function () {
			var rowId = $(this).attr("name").split("_")[1];
			var multiSku = $.trim($(this).val());
			if (multiSku != "") {
				var multiPrice = $("input[name='multiPrice_" + rowId + "']").val();
				var multiStock = $("input[name='multiStock_" + rowId + "']").val();
				var multiProductName = $("input[name='multiProductName_" + rowId + "']").val();
				var multiId = $("input[name='multiId_" + rowId + "']").val();
				if (multiId == "") {
					multiId = null;
				}
				var mulitImageList = getCheckedImageUrl(rowId);
				var multiShopeePublish = {
					id : multiId,
					parentSku : parentSku,
					sku : multiSku,
					categoryPath : categoryPath,
					categoryId : categoryId,
					productName : multiProductName,
					price : multiPrice,
					stock : multiStock,
					weight : weight,
					shipOutIn : shipOutIn,
					brand : brand,
					description : description,
					imageStr : JSON.stringify(mulitImageList),
					mainImage : mulitImageList[0],
					status : status
				};
				shopeePublishList.push(multiShopeePublish);
			}
		});
		$.ajax({
			url : "/shopee/saveShopeeProduct",
			type: 'POST',
			contentType : 'application/json;charset=utf-8',
			dataType : "json",
			data : JSON.stringify(shopeePublishList),
			success : function (data) {
				$.message.showMessage(data);
				if (data.status == "1") {
					$("#shopeeSkuListDialog").dialog("close");
					refresh(1000);
				}
			}
		});

	}
}

function validateShopeeProduct() {
	var errorMassage = "";
	var dialog = $("#shopeeProductDialog");
	var sku = $.trim(dialog.find("input[name='sku']").val());
	if (sku == "") {
		errorMassage += "&nbsp;*&nbsp;请填写SKU";
	}
	
	var categoryId = $.trim(dialog.find("input[name='categoryId']").val());
	if (categoryId == "") {
		errorMassage += "&nbsp;*&nbsp;请选择产品类别或填写类别ID";
	}
	
	var productName = $.trim(dialog.find("input[name='productName']").val());
	if (productName == "") {
		errorMassage += "&nbsp;*&nbsp;请填写产品名称";
	}
	
	var button = $("#shopeeProductDialog button[name=checkImageButton_0] i");
	var count = 0;
	button.each(function () {
		if($(this).hasClass("icon-checked")) {
			count++;
		}
	});
	if (count == 0) {
		errorMassage += "&nbsp;*&nbsp;请选择图片";
	}
	
	var price = $.trim(dialog.find("input[name='price']").val());
	if (price == "") {
		errorMassage += "&nbsp;*&nbsp;请填写价格";
	}
	
	var stock = $.trim(dialog.find("input[name='stock']").val());
	if (stock == "") {
		errorMassage += "&nbsp;*&nbsp;请填写库存";
	}
	
	var weight = $.trim(dialog.find("input[name='weight']").val());
	if (weight == "") {
		errorMassage += "&nbsp;*&nbsp;请填写产品重量";
	}
	
	var shipOutIn = $.trim(dialog.find("input[name='shipOutIn']").val());
	if (shipOutIn == "") {
		errorMassage += "&nbsp;*&nbsp;请填写运输时间";
	}
	
	var brand = $.trim(dialog.find("input[name='brand']").val());
	if (brand == "") {
		errorMassage += "&nbsp;*&nbsp;请填写品牌名";
	}
	
	var description = $.trim(dialog.find("textarea[name='description']").val());
	if (description == "") {
		errorMassage += "&nbsp;*&nbsp;请填写产品描述";
	}
	
	$("table[name='multiSkuTable'] input[name^='multiSku_']").each(function () {
		var rowId = $(this).attr("name").split("_")[1];
		var multiSku = $.trim($(this).val());
		if (multiSku != "") {
			var multiPrice = $("input[name='multiPrice_"+rowId+"']").val();
			if (multiPrice == "") {
				errorMassage += "&nbsp;*&nbsp;请填写  \"" + multiSku + "\" 的价格";
			}
			var multiStock = $("input[name='multiStock_"+rowId+"']").val();
			if (multiStock == "") {
				errorMassage += "&nbsp;*&nbsp;请填写  \"" + multiSku + "\" 的库存";
			}
			var multiProductName = $("input[name='multiProductName_"+rowId+"']").val();
			if (multiProductName == "") {
				errorMassage += "&nbsp;*&nbsp;请填写  \"" + multiSku + "\" 的名称";
			}
			
			var multiButton = $("#shopeeProductDialog button[name=checkImageButton_"+rowId+"] i");
			var multiCount = 0;
			multiButton.each(function () {
				if($(this).hasClass("icon-checked")) {
					multiCount++;
				}
			});
			if (multiCount == 0) {
				errorMassage += "&nbsp;*&nbsp;请选择  \"" + multiSku + "\" 的图片";
			}
		}
	});
	if (errorMassage != "") {
		dialog.find(".validateTip").html(errorMassage).show();
		return false;
	} else {
		dialog.find(".validateTip").hide();
	}
	return true; 
}

function showShopeeProductDialog(title) {
	$("#shopeeProductDialog").dialog("option", "title", title);
	$("#shopeeProductDialog").dialog("open");
}

function editSku(id) {
	$.ajax({
		url : "/shopee/getShopeeInfoById",
		type: 'POST',
		dataType : "json",
		data : {
			id : id
		},
		success : function (data) {
			if (data != null) {
				var shopeeProductDialog = $("#shopeeProductDialog");
				shopeeProductDialog.find("input[name='id']").val(data.id);
				shopeeProductDialog.find("input[name='sku']").val(data.sku);
				shopeeProductDialog.find("input[name='parentSku']").val(data.parentSku);
				$("#navigation").text(data.categoryPath); 
				shopeeProductDialog.find("input[name='categoryId']").val(data.categoryId);
				shopeeProductDialog.find("input[name='productName']").val(data.productName);
				shopeeProductDialog.find("input[name='price']").val(data.price);
				shopeeProductDialog.find("input[name='stock']").val(data.stock);
				shopeeProductDialog.find("input[name='weight']").val(data.weight);
				shopeeProductDialog.find("input[name='shipOutIn']").val(data.shipOutIn);
				shopeeProductDialog.find("input[name='brand']").val(data.brand);
				shopeeProductDialog.find("textarea[name='description']").val(data.description);
				
				spliceSelectImageProductImage(data.imageStr, data.sku, 0);
				showShopeeProductDialog("单体编辑");
			}
		}
	});
}

function editMultiSku(id) {
	var shopeeProductDialog = $("#shopeeProductDialog");
	$.ajax({
		url : "/shopee/getMultiShopeeInfo",
		type: 'POST',
		dataType : "json",
		data : {
			id : id
		},
		success : function (data) {
			var shopeePublishList = data.data;
			if (data.status != "1") {
				$.message.showMessage(data);
			}
			if (shopeePublishList.length > 0) {
				for (var i = 0; i < shopeePublishList.length; i++) {
					var shopeePublish = shopeePublishList[i];
					if (i == 0) {
						shopeeProductDialog.find("input[name='id']").val(shopeePublish.id);
						shopeeProductDialog.find("input[name='sku']").val(shopeePublish.sku);
						shopeeProductDialog.find("input[name='parentSku']").val(shopeePublish.parentSku);
						$("#navigation").text(shopeePublish.categoryPath); 
						shopeeProductDialog.find("input[name='categoryId']").val(shopeePublish.categoryId);
						shopeeProductDialog.find("input[name='productName']").val(shopeePublish.productName);
						shopeeProductDialog.find("input[name='price']").val(shopeePublish.price);
						shopeeProductDialog.find("input[name='stock']").val(shopeePublish.stock);
						shopeeProductDialog.find("input[name='weight']").val(shopeePublish.weight);
						shopeeProductDialog.find("input[name='shipOutIn']").val(shopeePublish.shipOutIn);
						shopeeProductDialog.find("input[name='brand']").val(shopeePublish.brand);
						shopeeProductDialog.find("textarea[name='description']").val(shopeePublish.description);
						spliceSelectImageProductImage(shopeePublish.imageStr, shopeePublish.sku, 0);
					} else {
						addShopeeMultiSkuRow(shopeePublish);
					}
				}
			}
			showShopeeProductDialog("变体编辑");
		}
	});
	
}

function spliceSelectImageProductImage(selectImage, productSku, rowId) {
	var selectImageList = eval('(' + selectImage + ')');
	for (var i = 0; i < selectImageList.length; i++) {
		createSelectImageHtml(selectImageList[i], rowId, true);
	}
	$.ajax({
		url : "/product/getProductImageBySku",
		type: 'POST',
		dataType : "json",
		data : {
			sku : productSku
		},
		success : function (data) {
			for (var i = 0; i < data.length; i++) {
				if ($.inArray(data[i],selectImageList) == -1) {
					createSelectImageHtml(data[i], rowId);
				}
			}
		}
	});
	
}

function changeCheckStatus(element, rowId) {
	var tagName = $(element)[0].tagName;
	if (tagName == "IMG" || tagName == "img") {
		var icon = $(element).next().find("button:first i");
		var elm = $(element);
		if (elm.hasClass("img-thumbnail-selected")) {
			elm.removeClass("img-thumbnail-selected");
			elm.addClass("img-thumbnail");
			icon.removeClass("icon-checked");
			icon.addClass("icon-check-empty");
		} else if (elm.hasClass("img-thumbnail")) {
			elm.removeClass("img-thumbnail");
			elm.addClass("img-thumbnail-selected");
			icon.removeClass("icon-check-empty");
			icon.addClass("icon-checked");
		}
	} else if (tagName = "BUTTON" || tagName == "button") {
		var icon = $(element).find("i");
		var elm = $(element).parent().parent().parent().parent().prev();
		if (icon.hasClass("icon-checked")) {
			icon.removeClass("icon-checked");
			icon.addClass("icon-check-empty");
			elm.removeClass("img-thumbnail-selected");
			elm.addClass("img-thumbnail");
		} else if (icon.hasClass("icon-check-empty")) {
			icon.removeClass("icon-check-empty");
			icon.addClass("icon-checked");
			elm.removeClass("img-thumbnail");
			elm.addClass("img-thumbnail-selected");
		}
	}
	countSelectImg(rowId);
}

function countSelectImg(rowId) {
	var button = $("#shopeeProductDialog button[name=checkImageButton_"+rowId+"] i");
	var count = 0;
	button.each(function () {
		if($(this).hasClass("icon-checked")) {
			count++;
		}
	});
	$("#selectImageCount_" + rowId).html(count);
}

function changeCategoryStatus() {
	var button = $("#shopeeProductDialog button[name=expandCategoryButton] i");
	if (button.hasClass("icon-double-angle-down")) {
		button.removeClass("icon-double-angle-down");
		button.addClass("icon-double-angle-up");
		$("#categorybtnName").html("收起类别");
		$("#categoryArea").show();
	} else if(button.hasClass("icon-double-angle-up")) {
		button.removeClass("icon-double-angle-up");
		button.addClass("icon-double-angle-down");
		$("#categorybtnName").html("展开类别");
		$("#categoryArea").hide();
	}
}

function expandCategory() {
	var parentId = 0;
	$.ajax({
		url : "/shopee/getShopeeCategoryByParentId",
		type: 'POST',
		dataType : "json",
		data : {
			parentId : parentId
		},
		success : function (data) {
			if(data.length > 0) {
				changeCategoryStatus();
				$("#categoryArea").html("");
				shwoShopeeCategroy(data, 1);
			} else {
				var param = {
					status : 0,
					message : "未导入Shopee类别文件"
				};
				$.message.showMessage(param);
			}
		}
	});
}

function shwoShopeeCategroy(categoryList, level) {
	var categoryHtml = "";
	categoryHtml += "<div class='category_select_box' id='categoryLevel_{level}'>";
	categoryHtml += 	"<ul>";
		$.each(categoryList, function (i, category) {
			categoryHtml +=	"<li>";
			categoryHtml += 	"<a title='{categoryName}' href='javascript:getShopeeCategoryByParentId({parentId}, {isParent}, {categoryLevel}, " +'"{categoryCode}"'+ ");'>";
			categoryHtml +=			"<div id='categoryDiv_{parentId}' value='{categoryName}'>";
			categoryHtml +=				"{categoryName}{isParentMark}";
			categoryHtml +=			"</div>";
			categoryHtml +=		"</a>";
			categoryHtml +=	"</li>";
			
			var isParentMark = "";
			var isParent = 0;
			if (category.level != 3) {
				isParentMark = "&nbsp;&nbsp;>>";
				isParent = 1;
			}
			categoryHtml = categoryHtml.replace(/{parentId}/g, category.id);
			categoryHtml = categoryHtml.replace(/{isParent}/g, isParent);
			categoryHtml = categoryHtml.replace(/{categoryLevel}/g, category.level);
			categoryHtml = categoryHtml.replace(/{categoryCode}/g, category.categoryId == undefined ? "" : category.categoryId);
			categoryHtml = categoryHtml.replace(/{categoryName}/g, category.categoryName);
			categoryHtml = categoryHtml.replace(/{isParentMark}/g, isParentMark);
		});
	categoryHtml += 	"</ul>";
	categoryHtml += "</div>";
	categoryHtml = categoryHtml.replace(/{level}/g, level);
	$("#categoryArea").append(categoryHtml);
}

function getShopeeCategoryByParentId(parentId, isParent, categoryLevel, categoryCode) {
	var categoryDivList = $("#categoryLevel_" + categoryLevel).find("div[id^='categoryDiv_']");
	categoryDivList.each(function () {
		$(this).removeClass("categorySeleted");
	});
	$("#categoryLevel_" + categoryLevel).find("div[id=categoryDiv_"+ parentId +"]").addClass("categorySeleted");
	
	var categoryLevelDiv = $("div[id^=categoryLevel_]");
	categoryLevelDiv.each(function () {
		var categoryLevelIdStr = $(this).attr("id");
		var categoryLevelId = parseInt(categoryLevelIdStr.split("_")[1]);
		if (categoryLevelId > categoryLevel) {
			$("#categoryLevel_" + categoryLevelId).remove();	
		}
	});
	
	if (isParent == 1) {
		var nextCategoryLevel = categoryLevel + 1;
		getShopeeCategory(parentId, nextCategoryLevel);
	}
	
	if (isParent == 0 ) {
		var navigation = "";
		changeCategoryStatus();
		categoryLevelDiv.each(function () {
			var categoryList = $(this).find("div[id^='categoryDiv_']");
			var categorySize = categoryList.size();
			categoryList.each(function (i) {
				if($(this).hasClass("categorySeleted")) {
					navigation += $(this).attr("value") + " > ";
					return false;
				}
			});
		});
		navigation = navigation.substring(0, navigation.length - 3);//去掉最后一个 >
		$("#navigation").html(navigation);
		$("#shopeeProductDialog input[name=categoryId]").val(categoryCode);
	}
}

function getShopeeCategory (parentId, categoryLevel) {
	$.ajax({
		url : "/shopee/getShopeeCategoryByParentId",
		type: 'POST',
		dataType : "json",
		data : {
			parentId : parentId
		},
		success : function (data) {
			if (data.length > 0) {
				shwoShopeeCategroy(data, categoryLevel);
			}
		}
	});
}

function addImageUrlAddress(rowId) {
	var imageUrlAddress = $.trim($("#imageUrlAddress_" + rowId).val());
	if (imageUrlAddress == "") {
		var param = {
			status : 0,
			message : "请填写图片地址"
		};
		$.message.showMessage(param);
		return;
	} 
	
	createSelectImageHtml(imageUrlAddress, rowId);
}

function createSelectImageHtml(imageUrlAddress, rowId, isChecked) {
	var imageHtml = "";
	imageHtml += '<li>';
	imageHtml += 	'<div class="iamge_div">';
	imageHtml += 		'<img onclick="changeCheckStatus(this, {rowId})" name="productImage" src="{imageUrlAddress}" data-image="{imageUrlAddress}" class="{imageClass} move" title="拖动改变图片顺序" width="110">';
	imageHtml += 		'<table class="width_100 image_operating_table">';
	imageHtml += 			'<tr>';
	imageHtml += 				'<td>';
	imageHtml += 					'<button imageurl="{imageUrlAddress}" name="checkImageButton_{rowId}" class="btn btn-sm" type="button" onclick="changeCheckStatus(this,{rowId})"><i class="icon {iconCheckClass}"></i></button>';
	imageHtml += 				'</td>';
	imageHtml += 				'<td>';
	imageHtml += 					'<button class="btn btn-sm " type="button" onclick="deleteImage(this)"><i class="icon icon-trash"></i></button>';
	imageHtml += 				'</td>';
	imageHtml += 			'</tr>';
	imageHtml += 		'</table>';
	imageHtml += 	'</div>';
	imageHtml += '</li>';
	
	imageHtml = imageHtml.replace(/{imageUrlAddress}/g, imageUrlAddress);
	imageHtml = imageHtml.replace(/{rowId}/g, rowId);
	if (isChecked == undefined) {
		imageHtml = imageHtml.replace(/{imageClass}/g, "img-thumbnail");
		imageHtml = imageHtml.replace(/{iconCheckClass}/g, "icon-check-empty");
	} else {
		imageHtml = imageHtml.replace(/{imageClass}/g, "img-thumbnail-selected");
		imageHtml = imageHtml.replace(/{iconCheckClass}/g, "icon-checked");
	}
	$("#sortable_" + rowId).append(imageHtml);
	clearImageUrlAddress(rowId);
	initSortable(rowId);
}

function deleteImage(element) {
	if(confirm("确定删除？")){
		$(element).parents("li").remove();
	}
}

function clearImageUrlAddress(rowId) {
	$("#imageUrlAddress_" + rowId).val("");
}

function showShpeeSkuDialog() {
	$("#shopeeSkuListDialog").dialog("open");
}

function getShopeeSkuList() {
	var count = $("#userShopeeCount").html();
	if (count == 0 || count == "0") {
		var param = {
			status : 0,
			message : "没有新的SKU被分配给您"
		};
		$.message.showMessage(param);
		return;
	}
	var table = $("#shopeeSkuListTable");
	table.find("tr:gt(0)").each(function () {
		$(this).remove();
	});
	var shopeeSkuListHtml = "";
	$.ajax({
		url : "/shopee/getShopeeSkuList",
		type: 'POST',
		dataType : "json",
		success : function (data) {
			if (data.length > 0) {
				$.each(data, function (i, product) {
					shopeeSkuListHtml += '<tr>';
					shopeeSkuListHtml += 	'<td style="text-align:center"><input name="publish_sku_checkbox" type="checkbox" value="'+product.id+'" onclick="countCheckbox()" /></td>';
					shopeeSkuListHtml += 	'<td>'+product.sku+'</td>';
					shopeeSkuListHtml += 	'<td>'+product.spu+'</td>';
					shopeeSkuListHtml += 	'<td><img src="'+product.mainImage+'" data-image="'+product.mainImage+'" class="img-thumbnail" width="110"/></td>';
					shopeeSkuListHtml += 	'<td>'+product.nameCn+'</td>';
					shopeeSkuListHtml += '</tr>';
				});
			}
			table.append(shopeeSkuListHtml);
			showShpeeSkuDialog();
		}
	});
}

function obtainShopeePublishSku() {
	var publishSkuCheckBox =$("#shopeeSkuListTable").find("input[name=publish_sku_checkbox]");
	var ids = [];
	publishSkuCheckBox.each(function(){
		if ($(this).is(':checked')) {
			ids.push($(this).val());
		}
	});
	
	if (ids.length == 0) {
		var param = {
			status : 0,
			message : "请勾选需要获取的SKU"
		};
		$.message.showMessage(param);
		return;
	}
	
	$.ajax({
		url : "/shopee/obtainShopeePublishSku",
		type: 'POST',
		dataType : "json",
		data : {
			productIdList : ids
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == 1) {
				$("#shopeeSkuListDialog").dialog("close");
				refresh(1000);
			}
		}
	});
}

function cleanShopeeDialog() {
	var dialog = $("#shopeeProductDialog");
	$("#navigation").html("");
	$("#categoryArea").html("");
	var button = $("#shopeeProductDialog button[name=expandCategoryButton] i");
	button.removeClass("icon-double-angle-up");
	button.addClass("icon-double-angle-down");
	$("#categorybtnName").html("展开类别");
	$("#sortable_0").html("");
	$("#selectImageCount_0").html("0");
	$("#shopeeProductDialog input[name='stock']").val("");
	cleanMultiSkuTable();
	$.myformPlugins.cleanForm("#shopeeProductDialog");
}

function deleteShopeeProduct(id) {
	$.ajax({
		url : "/shopee/deleteShopeeProduct",
		type: 'POST',
		dataType : "json",
		data : {
			id : id
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == 1) {
				refresh(1000);
			}
		}
	});
}

function getProductInfoBySku() {
	var dialog = $("#shopeeProductDialog");
	var sku = $.trim(dialog.find("input[name=sku]").val());
	if (sku == "") {
		var param = {
			status : 0,
			message : "请先填写SKU"
		};
		$.message.showMessage(param);
		return;
	}
	dialog.find("input[name=sku]").val($.trim(sku));
	
	$.ajax({
		url : "/shopee/getProductInfoBySku",
		type: 'POST',
		dataType : "json",
		data : {
			sku : sku
		},
		success : function (data) {
			if(data.status == "1") {
				cleanShopeeDialog();
				var product = data.data;
				var sku = product.sku;
				var spu = product.spu;
				var productName = product.productName;
				var weight = product.weight;
				var description = product.description;
				var imageList = product.imageList;
				dialog.find("input[name=sku]").val(sku);
				dialog.find("input[name=parentSku]").val(spu);
				dialog.find("input[name=productName]").val(productName);
				dialog.find("input[name=weight]").val(weight);
				dialog.find("textarea[name=description]").val(description);
				for (var i = 0 ; i < imageList.length; i++) {
					var imageUrl = imageList[i];
					createSelectImageHtml(imageUrl, 0);
				}
			}
			$.message.showMessage(data);
		}
	});
}

function cleanMultiSkuTable() {
	$("table[name=multiSkuTable] tr:gt(0)").remove();
}

function getProductInfoBySpu() {
	var dialog = $("#shopeeProductDialog");
	
	var sku = $.trim(dialog.find("input[name=sku]").val());
	if (sku == "") {
		var param = {
			status : 0,
			message : "请先填写SKU"
		};
		$.message.showMessage(param);
		return;
	}
	dialog.find("input[name=sku]").val($.trim(sku));
	
	var spu = $.trim(dialog.find("input[name=parentSku]").val());
	if (spu == "") {
		var param = {
			status : 0,
			message : "请先填写Parent SKU"
		};
		$.message.showMessage(param);
		return;
	}
	dialog.find("input[name=parentSku]").val($.trim(spu));
	
	$.ajax({
		url : "/shopee/getProductInfoBySpu",
		type: 'POST',
		dataType : "json",
		data : {
			spu : spu
		},
		success : function (data) {
			if(data.status == "1") {
				cleanMultiSkuTable();
				var shopeeProductList = data.data;
				for (var i = 0; i < shopeeProductList.length; i++) {
					var shopeePublish = shopeeProductList[i];
					var mainSku = shopeePublish.sku;
					if (sku == mainSku) {
						continue;
					}
					addShopeeMultiSkuRow(shopeePublish);
				}
			}
			$.message.showMessage(data);
		}
	});
}

function addShopeeMultiSkuRow(shopeePublish) {
	var lastTr = $("table[name=multiSkuTable] tr[id^=multiRow_]:last");
	var lastId;
	var maxId;
	if (lastTr.length == 0) {
		maxId = 1;
	} else {
		lastId = lastTr.attr("id").split("_")[1];
		maxId = Number(lastId) + 1;
	}
	
	var html = "";
	html += '<tr id="multiRow_{rowId}">';
	html += 	'<td class="title">SKU</td>';
	html += 	'<td class="width_170px">';
	html += 		'<input type="text" class="txt width_80px" value="{multiSku}" name="multiSku_{rowId}"/>';
	html += 		'<input type="hidden" class="txt width_10px" value="{multiId}" name="multiId_{rowId}"/>';
	html += 		'&nbsp;<button class="btn btn-sm" type="button" onclick="getmultiSkuProductInfo({rowId})">加载信息</button>';
	html += 	'</td>';
	html += 	'<td class="title">价格</td>';
	html += 	'<td class="width_100px"><input type="text" class="txt width_90" name="multiPrice_{rowId}" value="{multiPrice}" onkeyup="inputNumOnly(this)"/></td>';
	html += 	'<td class="title">库存</td>';
	html += 	'<td class="width_100px"><input type="number" class="txt width_90" name="multiStock_{rowId}" value="{multiStock}" onkeyup="inputNumOnly(this)"/></td>';
	html += 	'<td class="title">名称</td>';
	html += 	'<td><input type="text" class="txt width_99" value="{multiProductName}" name="multiProductName_{rowId}"/></td>';
	html += 	'<td class="width_50px" rowspan="2"><button class="btn btn-sm btn-danger" type="button" onclick="removeMultiSkuRow({rowId})"><i class="icon icon-trash"></i></button></td>';
	html += '</tr>';
	html += '<tr id="multiImage_{rowId}">';
	html += 	'<td colspan="8">';
	html += 		'<div class="image_box">';
	html += 			'<div class="image_title">选择图片</div>';
	html += 			'<div class="image_count_info">';
	html += 			'<table class="image_info_table">';
	html += 				'<tr>';
	html += 					'<td style="text-align:left;width:70%">';
	html += 						'<input type="text" class="txt" style="width:400px;" id="imageUrlAddress_{rowId}" placeholder="图片地址/Url"/>';
	html += 						'<button class="btn btn-sm " type="button" onclick="addImageUrlAddress({rowId})">';
	html += 							'添加图片地址';
	html += 						'</button>';
	html += 					'</td>';
	html += 					'<td style="text-align:right;">已选择图片：<span id="selectImageCount_{rowId}">0</span> 张 <!--| 最多 4 张图片--></div></td>';
	html += 				'</tr>';
	html += 			'</table>';
	html += 			'<div id="image_area">';
	html += 				'<ul id="sortable_{rowId}">';
	html += 				'</ul>';
	html += 			'</div>';
	html += 		'</div>';
	html += 	'</td>';
	html += '</tr>';
	
	
	html = html.replace(/{rowId}/g, maxId);
	if (shopeePublish != undefined) {
		var shopeePublishId = shopeePublish.id == undefined ? "" : shopeePublish.id;
		html = html.replace(/{multiId}/g, shopeePublishId);
		html = html.replace(/{multiSku}/g, shopeePublish.sku);
		html = html.replace(/{multiProductName}/g, shopeePublish.productName);
		html = html.replace(/{multiProductName}/g, shopeePublish.productName);
		var price = shopeePublish.price == undefined ? "" : shopeePublish.price;
		var stock = shopeePublish.stock == undefined ? "" : shopeePublish.stock;
		html = html.replace(/{multiPrice}/g, price);
		html = html.replace(/{multiStock}/g, stock);
	} else {
		html = html.replace(/{multiId}/g, "");
		html = html.replace(/{multiSku}/g, "");
		html = html.replace(/{multiProductName}/g, "");
		html = html.replace(/{multiPrice}/g, "");
		html = html.replace(/{multiStock}/g, "");
	}
	$("table[name=multiSkuTable]").append(html);
	initSortable(maxId);
	if (shopeePublish != undefined) {
		var imageList = eval('(' + shopeePublish.imageStr + ')');
		if (shopeePublish.id != null) {
			spliceSelectImageProductImage(shopeePublish.imageStr, shopeePublish.sku, maxId);
		} else {
			for (var j = 0; j < imageList.length; j++) {
				createSelectImageHtml(imageList[j], maxId);
			}
		}
	} else {
		var param = {status : 1};
		$.message.showMessage(param);
	}
}

function removeMultiSkuRow(rowId) {
	$("table[name=multiSkuTable] tr[id='multiRow_"+rowId+"']").remove();
	$("table[name=multiSkuTable] tr[id='multiImage_"+rowId+"']").remove();
	var param = {status : 1};
	$.message.showMessage(param);
}

function getmultiSkuProductInfo(rowId) {
	var sku = $.trim($("table[name=multiSkuTable]").find("input[name='multiSku_"+rowId+"']").val());
	if (sku == "") {
		var param = {
			status : 0,
			message : "请先填写SKU"
		};
		$.message.showMessage(param);
		return;
	}
	
	$.ajax({
		url : "/shopee/getShopeeMultiSkuInfo",
		type: 'POST',
		dataType : "json",
		data : {
			sku : sku
		},
		success : function (data) {
			if(data.status == "1") {
				var product = data.data;
				var imageList = product.imageList;
				$("table[name=multiSkuTable]").find("input[name='multiProductName_"+rowId+"']").val(product.productName);
				for (var i = 0; i < imageList.length; i++) {
					createSelectImageHtml(imageList[i], rowId);
				}
			}
			$.message.showMessage(data);
		}
	});
}

function getCategoryById() {
	var dialog = $("#shopeeProductDialog");
	var categoryId = $.trim(dialog.find("input[name=categoryId]").val());
	if (categoryId != "") {
		dialog.find("input[name=categoryId]").val(categoryId);
		$.ajax({
			url : "/shopee/getShopeeCategoryPath",
			type: 'POST',
			dataType : "json",
			data : {
				categoryId : categoryId
			},
			success : function (data) {
				if(data.status == "1") {
					$("#navigation").html(data.data);
				}
				$.message.showMessage(data);
			}
		});
	}
}

function copyToSpuProductName() {
	var productName = $("#shopeeProductDialog input[name='productName']").val();
	if ($.trim(productName) == "") {
		var param = {status : 0, message : '请先填写产品名称'};
		$.message.showMessage(param);
		return;
	}
	$("table[name='multiSkuTable'] input[name^='multiProductName_']").each(function() {
		$(this).val(productName);
	});
	var param = {status : 1};
	$.message.showMessage(param);
}

function copyToSpuPrice() {
	var price = $("#shopeeProductDialog input[name='price']").val();
	if ($.trim(price) == "") {
		var param = {status : 0, message : '请先填写价格'};
		$.message.showMessage(param);
		return;
	}
	$("table[name='multiSkuTable'] input[name^='multiPrice_']").each(function() {
		$(this).val(price);
	});
	var param = {status : 1};
	$.message.showMessage(param);
}

function copyToSpuStock() {
	var stock = $("#shopeeProductDialog input[name='stock']").val();
	if ($.trim(stock) == "") {
		var param = {status : 0, message : '请先填写库存'};
		$.message.showMessage(param);
		return;
	}
	var re = /^[0-9]+$/;
	if (!re.test(stock)) {
		var param = {status : 0, message : "库存必须为正整数"};
		$.message.showMessage(param);
		return;
	}
	$("table[name='multiSkuTable'] input[name^='multiStock_']").each(function() {
		$(this).val(stock);
	});
	var param = {status : 1};
	$.message.showMessage(param);
}

function getCheckedImageUrl(rowId) {
	var button = $("#shopeeProductDialog button[name=checkImageButton_"+rowId+"] i");
	var count = 0;
	var imageList = new Array();
	button.each(function () {
		if($(this).hasClass("icon-checked")) {
			var imageUrl = $(this).parent().attr("imageurl");
			imageList.push(imageUrl);
		}
	});
	return imageList;
}
