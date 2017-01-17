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
//					validateProductFrom();
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