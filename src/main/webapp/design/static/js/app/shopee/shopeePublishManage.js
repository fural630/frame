$(function () {
	initDialog();
	initSortable();
});

function initSortable() {
	$("#sortable").sortable();
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
					validateCategoryFrom();
				}
			},{
				text : "完成编辑",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					$("#uploadCategoryDialog").dialog("close");
					refresh(1000);
				}
			}
			
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#shopeeProductDialog");
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
					validateCategoryFrom();
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

function showShopeeProductDialog(title) {
	$("#shopeeProductDialog").dialog("option", "title", title);
	$("#shopeeProductDialog").dialog("open");
}

function editSku(id) {
	showShopeeProductDialog("单体编辑");
}

function changeCheckStatus(element) {
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
	countSelectImg();
}

function countSelectImg() {
	var button = $("#shopeeProductDialog button[name=checkImageButton] i");
	var count = 0;
	button.each(function () {
		if($(this).hasClass("icon-checked")) {
			count++;
		}
	});
	$("#selectImageCount").html(count);
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

function addImageUrlAddress() {
	var imageUrlAddress = $.trim($("#imageUrlAddress").val());
	if (imageUrlAddress == "") {
		var param = {
			status : 0,
			message : "请填写图片地址"
		};
		$.message.showMessage(param);
		return;
	} 
	
	createSelectImageHtml(imageUrlAddress);
}

function createSelectImageHtml(imageUrlAddress) {
	var imageHtml = "";
	imageHtml += '<li>';
	imageHtml += 	'<div class="iamge_div">';
	imageHtml += 		'<img onclick="changeCheckStatus(this)" name="productImage" src="{imageUrlAddress}" data-image="{imageUrlAddress}" class="img-thumbnail move" title="拖动改变图片顺序" width="110">';
	imageHtml += 		'<table class="width_100 image_operating_table">';
	imageHtml += 			'<tr>';
	imageHtml += 				'<td>';
	imageHtml += 					'<button name="checkImageButton" class="btn btn-sm" type="button" onclick="changeCheckStatus(this)"><i class="icon icon-check-empty"></i></button>';
	imageHtml += 				'</td>';
	imageHtml += 				'<td>';
	imageHtml += 					'<button class="btn btn-sm " type="button" onclick="deleteImage(this)"><i class="icon icon-trash"></i></button>';
	imageHtml += 				'</td>';
	imageHtml += 			'</tr>';
	imageHtml += 		'</table>';
	imageHtml += 	'</div>';
	imageHtml += '</li>';
	
	imageHtml = imageHtml.replace(/{imageUrlAddress}/g, imageUrlAddress);
	$("#sortable").append(imageHtml);
	clearImageUrlAddress();
	initSortable();
}

function deleteImage(element) {
	if(confirm("确定删除？")){
		$(element).parents("li").remove();
	}
}

function clearImageUrlAddress() {
	$("#imageUrlAddress").val("");
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
					shopeeSkuListHtml += 	'<td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="'+product.id+'" onclick="countCheckbox()" /></td>';
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