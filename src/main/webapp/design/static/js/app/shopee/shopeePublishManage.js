$(function () {
	initDialog();
});

function initDialog() {
	$("#shopeeProductDialog").dialog({
		autoOpen: true,
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
		console.log(elm);
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
	
//	var elm = $(element);
//	console.log(icon);
//	if (icon != undefined) {
//		if (icon.hasClass("icon-checked")) {
//			icon.removeClass("icon-checked");
//			icon.addClass("icon-check-empty");
//		} else if (icon.hasClass("icon-check-empty")) {
//			icon.removeClass("icon-check-empty");
//			icon.addClass("icon-checked");
//		}
//	} else {
//		if (elm.hasClass("img-thumbnail-selected")) {
//			elm.removeClass("img-thumbnail-selected");
//			elm.addClass("img-thumbnail");
//		} else if (elm.hasClass("img-thumbnail")) {
//			elm.removeClass("img-thumbnail");
//			elm.addClass("img-thumbnail-selected");
//		}
//	}
}