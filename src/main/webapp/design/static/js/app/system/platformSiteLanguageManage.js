$(function () {
	initDialog();
});
function initDialog () {
	$("#platFormDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 600,
		height: 420,
		resizable: false,
		buttons : [ {
				text : "保存",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					if (validate()) {
						saveUser();
					}
				}
			}
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#userDialog");
		}
	});
	
	$("#siteDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 600,
		height: 400,
		resizable: false,
		buttons : [ {
				text : "保存",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					saveUserNavigator();
				}
			}
		],
		close: function( event, ui ) {
			
		}
	});
}

function showPlatformDialog(title) {
	$("#platFormDialog").dialog("option", "title", title);
	$("#platFormDialog").dialog("open");
	loadPlatformList();
}

function showSiteDialog(title) {
	$("#siteDialog").dialog("option", "title", title);
	$("#siteDialog").dialog("open");
}

function loadPlatformList() {
	$("#platformListTable tr:gt(0)").remove();
	$.ajax({
		url : "/system/getPlatformList",
		type: 'POST',
		dataType : "json",
		success : function (data) {
			$.message.showMessage(data);
		}
	});
}