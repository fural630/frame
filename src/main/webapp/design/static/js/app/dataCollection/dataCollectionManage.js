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
	var collectionUrl = $("textarea[name='collectionUrl']").val();
	if ($.trim(collectionUrl) == "") {
		var param = {status : 0, message : "请填写采集网址"};
		$.message.showMessage(param);
		return;
	}
	
	$.ajax({
		url : "/dataCollection/startCollection",
		type: 'POST',
		dataType : "json",
		beforeSend : function (xhr) {
			$.blockUI({
				message: '<img src="/design/static/images/common/progressbar10.gif">',
				timeout: 30000,
				css:{
					backgroundColor: "",
					border:"0"
				}
			});
		},
		data : {
			collectionUrl : collectionUrl
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == 1) {
				refresh(1000);
			}
		}
	});
}

function resetCollectionUrl() {
	$("textarea[name='collectionUrl']").val("");
}

function deleteDataCollection(id) {
	$.ajax({
		url : "/dataCollection/deleteDataCollectionById",
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

function batchDeleteDataCollection(idList) {
	confirmMsg("batchDeleteDataCollectionByIds('"+idList+"')");
}

function batchDeleteDataCollectionByIds(idList) {
	$.ajax({
		url : "/dataCollection/deleteDataCollectionByIds",
		type: 'POST',
		dataType : "json",
		data : {
			idList : idList
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == 1){
				refresh(1000);
			}
		}
	});
}