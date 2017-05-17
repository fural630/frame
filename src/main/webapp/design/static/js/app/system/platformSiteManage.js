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
	
	var id = $.trim(dialog.find("input[name='id']").val());
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
	
	$.ajax({
		url : "/system/savePlatformSite",
		type: 'POST',
		dataType : "json",
		data : {
			id : id,
			platformId : platformId,
			currencyId : currency,
			language : language,
			siteNameCn : siteNameCn,
			siteNameEn : siteNameEn
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == 1){
				refresh(1000);
			}
		}
	});
}

function editPlatformSite(id) {
	var dialog = $("#platFormSiteDialog");
	dialog.find("input[name='id']").val(id);
	
	$.ajax({
		url : "/system/editPlatformSite",
		type: 'POST',
		dataType : "json",
		data : {
			id : id
		},
		success : function (data) {
			if (data.status == "1") {
				var platformSite = data.data;
				dialog.find("select[name='platformId']").val(platformSite.platformId);
				dialog.find("select[name='currency']").val(platformSite.currencyId);
				dialog.find("select[name='language']").val(platformSite.language);
				dialog.find("input[name='siteNameCn']").val(platformSite.siteNameCn);
				dialog.find("input[name='siteNameEn']").val(platformSite.siteNameEn);
				showPlatformSiteDialog("编辑平台与站点配置");
			} else {
				$.message.showMessage(data);
			}
		}
	});
}

function deletePlatformSite(id) {
	$.ajax({
		url : "/system/deletePlatformById",
		type: 'POST',
		dataType : "json",
		data : {
			id : id
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == 1){
				refresh(1000);
			}
		}
	});
}

function showPlatformSiteDialog(title) {
	$("#platFormSiteDialog").dialog("option", "title", title);
	$("#platFormSiteDialog").dialog("open");
}