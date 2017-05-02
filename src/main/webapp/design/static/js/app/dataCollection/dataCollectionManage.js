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
		beforeSend : function (xhr) {
			$.blockUI({
				message: '<img src="/design/static/images/common/progressbar10.gif">',
				timeout: 10000,
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
				var dataList = data.data;
				insertIntoCollectionTable(dataList);
			}
		}
	});
}

var collectionIndex = 0;
function insertIntoCollectionTable(dataList) {
	var table = $("table[name='collectionResultTable']");
	for (var i = 0; i < dataList.length; i++) {
		var obj = dataList[i];
		var html = "";
		html += '<tr>';
		html += '	<td style="text-align:center"><input name="" type="checkbox" value="{index}" onclick="countCheckbox()" /></td>';
		html += '	<td>';
		html += '		<img src="{image}" data-image="{image}" class="img-thumbnail" width="80"/>';
		html += '	</td>';
		html += '	<td><input type="text" class="txt width_100px" name="sku_{index}"/></td>';
		html += '	<td><input type="text" class="txt width_100px" name="parentSku_{index}"/></td>';
		html += '	<td><input type="text" class="txt width_100px" name="color_{index}" value="{color}"/></td>';
		html += '	<td><input type="text" class="txt width_100px" name="size_{index}"  value="{size}"/></td>';
		html += '	<td><input type="text" class="txt width_50px" name="price_{index}"  value="{price}"/></td>';
		html += '	<td><input type="text" class="txt width_50px" name="weight_{index}"  value="{weight}"/></td>';
		html += '	<td><input type="text" class="txt width_50px" name="freight_{index}"  value="{freight}"/></td>';
		html += '	<td><input type="text" class="txt width_50px" name="beginAmount_{index}"  value="{beginAmount}"/></td>';
		html += '	<td>';
		html += '		<button class="btn btn-sm btn-danger" type="button" onclick="removeCollectionResultRow(this)"><i class="icon icon-trash"></i></button>';
		html += '	</td>';
		html += '</tr>';
		
		
		html = html.replace(/{index}/g, collectionIndex);
		html = html.replace(/{image}/g, obj.imageUrl);
		
		html = html.replace(/{color}/g, obj.color);
		html = html.replace(/{size}/g, obj.size);
		html = html.replace(/{price}/g, obj.refPrice);
		html = html.replace(/{weight}/g, obj.weight == undefined ? "" : obj.weight);
		html = html.replace(/{freight}/g, obj.freight);
		html = html.replace(/{beginAmount}/g, obj.beginAmount);
		collectionIndex++;
		table.append(html);
	}
}

function resetCollectionUrl() {
	$("textarea[name='collectionUrl']").val("");
}