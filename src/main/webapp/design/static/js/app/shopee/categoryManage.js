$(function () {
	initDialog();
	
});

function initDialog() {
	$("#uploadCategoryDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 600,
		height: 400,
		resizable: false,
		buttons : [ {
				text : "上传",
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
					$("#uploadCategoryDialog").dialog("close");
					refresh(1000);
				}
			}
			
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#uploadCategoryDialog");
		}
	});
}

function showImportCategoryDialog(title) {
	$("#uploadCategoryDialog").dialog("option", "title", title);
	$("#uploadCategoryDialog").dialog("open");
}

function validateCategoryFrom() {
	var dialog = $("#uploadCategoryDialog");
	var file = dialog.find("input[name=categoryFile]").val();
	if (file == "" || file == null || file == undefined) {
		var param = {
			status : 0,
			message : "请选择要上传的文件"
		};
		$.message.showMessage(param);
		return;
	}
	$.blockUI({
		message: '<img src="/design/static/images/common/progressbar10.gif">',
		timeout: 1000 * 120,
		css:{
			backgroundColor: "",
			border:"0"
		}
	});
	dialog.find("form[name=uploadCategoryFrom]").submit();
}