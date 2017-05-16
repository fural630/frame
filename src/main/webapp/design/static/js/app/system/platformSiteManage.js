$(function () {
	initDialog();
});
function initDialog () {
	$("#platFormSiteDialog").dialog({
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
					savePlatformSite();
				}
			}
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#platFormSiteDialog");
		}
	});
	
}

function savePlatformSite() {
	var dialog = $("#platFormSiteDialog");
	
	var platformId = dialog.find("select[name='platformId']").val();
	var currency = dialog.find("select[name='currency']").val();
	var language = dialog.find("select[name='language']").val();
	var siteNameCn = $.trim(dialog.find("input[name='siteNameCn']").val());
	var siteNameEn = $.trim(dialog.find("input[name='siteNameEn']").val());
	
	var message = "";
	
	if (platformId == "") {
		message += "平台不能为空\n";
	} 
	if (currency == "") {
		message += "币种不能为空\n";
	}
	if (language == "") {
		message += "语言不能为空\n";
	} 
	if (siteNameCn == "") {
		message += "站点中文不能为空\n";
	} 
	if (siteNameEn == "") {
		message += "站点英文不能为空\n";
	}
	
	if (message != "") {
		alert(message);
		return;
	}
	 
	
}

function showPlatformSiteDialog(title) {
	$("#platFormSiteDialog").dialog("option", "title", title);
	$("#platFormSiteDialog").dialog("open");
}
