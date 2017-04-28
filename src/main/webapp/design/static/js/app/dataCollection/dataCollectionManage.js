$(function () {
	initDialog();
});

function initDialog() {
	$("#dataCollectionDialog").dialog({
		autoOpen: false,
		modal: true,
		width: document.body.scrollWidth * 0.96,
		height: document.body.scrollHeight * 0.98,
		resizable: false,
		buttons : [ {
				text : "关闭",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					$("#dataCollectionDialog").dialog("close");
					refresh(1000);
				}
			}
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#dataCollectionDialog");
		}
	});
}


function showCollectionDialog() {
	$("#dataCollectionDialog").dialog("open");
}

function startCollection() {
	var dialog = $("#dataCollectionDialog");
	var collectionUrl = dialog.find("textarea[name='collectionUrl']").val();
	if ($.trim(collectionUrl) == "") {
		var param = {status : 0, message : "请填写采集网址"};
		$.message.showMessage(param);
		return;
	}
	
	$.ajax({
		url : "/dataCollection/startCollection",
		type: 'POST',
		dataType : "json",
		data : {
			collectionUrl : collectionUrl
		},
		success : function (data) {
			$.message.showMessage(data);
		}
	});
}

function resetCollectionUrl() {
	var dialog = $("#dataCollectionDialog");
	dialog.find("textarea[name='collectionUrl']").val("");
}