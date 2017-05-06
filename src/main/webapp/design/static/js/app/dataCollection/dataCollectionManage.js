$(function () {
	initDialog();
});

function initDialog() {
	$("#dataCollectionDialog").dialog({
		autoOpen: false,
		modal: true,
		width: document.body.scrollWidth * 0.96,
		height: 600,
		resizable: false,
		buttons : [ {
				text : "保存",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					saveDataCollection(5);
				}
			},
			{
				text : "完成编辑",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					saveDataCollection(10);
				}
			}
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#dataCollectionDialog");
		}
	});
}

function saveDataCollection(status) {
	var dataCollectionList = [];
	$("table[name='collectionEditTable']").find("tr:gt(0)").each(function () {
		var id = $.trim($(this).find("input[name='collectionId']").val());
		var sku = $.trim($(this).find("input[name='sku']").val());
		var spu = $.trim($(this).find("input[name='spu']").val());
		var color = $.trim($(this).find("input[name='color']").val());
		var size = $.trim($(this).find("input[name='size']").val());
		var price = $.trim($(this).find("input[name='price']").val());
		var weight = $.trim($(this).find("input[name='weight']").val());
		var freight = $.trim($(this).find("input[name='freight']").val());
		var obj = {
			id : id,
			sku : sku,
			spu : spu,
			color:color,
			size : size,
			price : price,
			weight : weight,
			freight :freight,
			status : status
		};
		dataCollectionList.push(obj);
	});
	
	if (dataCollectionList.length > 0) {
		$.ajax({
			url : "/dataCollection/saveDataCollection",
			type: 'POST',
			contentType : 'application/json;charset=utf-8',
			dataType : "json",
			data : JSON.stringify(dataCollectionList),
			success : function (data) {
				$.message.showMessage(data);
				if (data.status == "1") {
					refresh(1000);
				}
			}
		});
	}
	
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

function editDataCollection(id) {
	$.ajax({
		url : "/dataCollection/editDataCollectionById",
		type: 'POST',
		dataType : "json",
		data : {
			id : id
		},
		success : function (data) {
			if (data.status == 1) {
				var dataCollectionList = data.data;
				showCollectionDialog();
				initCollectionEditTable(dataCollectionList);
			} else {
				$.message.showMessage(data);
			}
		}
	});
}

function initCollectionEditTable(dataCollectionList) {
	$("table[name='collectionEditTable']").find("tr:gt(0)").each(function () {
		$(this).remove();
	});
	
	var table = "";
	var editSpiderUrl = "";
	if (dataCollectionList.length > 0) {
		for (var i = 0; i <dataCollectionList.length; i++) {
			var obj = dataCollectionList[i];
			table += '<tr id="tr_{id}">';
			table +=	'<td>{id}<input type="hidden" name="collectionId" value="{id}"/></td>';
			table += 	'<td>';
			table += 		'<img src="{image}" data-image="{image}" class="img-thumbnail" width="80"';
			table += 	'</td>';
			table += 	'<td><input type="text" class="txt width_120px" name="sku" value="{sku}"/></td>';
			table += 	'<td><input type="text" class="txt width_120px" name="spu" value="{spu}"/></td>';
			table += 	'<td><input type="text" class="txt width_100px" name="color" value="{color}"/></td>';
			table += 	'<td><input type="text" class="txt width_100px" name="size" value="{size}"/></td>';
			table += 	'<td><input type="text" class="txt width_80px" name="price" value="{price}"/></td>';
			table += 	'<td><input type="text" class="txt width_80px" name="weight" value="{weight}"/></td>';
			table += 	'<td><input type="text" class="txt width_80px" name="freight" value="{freight}"/></td>';
			table += 	'<td>';
			table += 		'<button class="btn btn-sm btn-danger" type="button" onclick="removeRow({id})"><i class="icon icon-trash"></i></button>';
			table += 	'</td>';
			table += '</tr>';
			
			table = table.replace(/{id}/g, obj.id);
			table = table.replace(/{image}/g, obj.imageUrl == undefined ? "" : obj.imageUrl);
			table = table.replace(/{sku}/g, obj.sku == undefined ? "" : obj.sku);
			table = table.replace(/{spu}/g, obj.spu == undefined ? "" : obj.spu);
			table = table.replace(/{color}/g, obj.color == undefined ? "" : obj.color);
			table = table.replace(/{size}/g, obj.size == undefined ? "" : obj.size);
			table = table.replace(/{price}/g, obj.price == undefined ? "" : obj.price);
			table = table.replace(/{weight}/g, obj.weight == undefined ? "" : obj.weight);
			table = table.replace(/{freight}/g, obj.freight == undefined ? "" : obj.freight);
			
			if (editSpiderUrl == "") {
				editSpiderUrl = obj.url;
			}
		}
		$("table[name='collectionEditTable']").append(table);
		$("input[name='editSpiderUrl']").val(editSpiderUrl);
	}
	
	countDataCollection();
}

function countDataCollection() {
	var count = 0;
	$("table[name='collectionEditTable']").find("tr:gt(0)").each(function () {
		count++;
	});
	$("#spiderTotal").text(count);
}

function removeRow(id) {
	confirmMsg("deleteRow('"+id+"')", "确定删除这条记录吗？");
}

function deleteRow(id) {
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
				$("#tr_" + id).remove();
			}
		}
	});
}

function batchMoveToProduct(idList) {
	$.ajax({
		url : "/dataCollection/batchMoveToProduct",
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

function openSpiderLink() {
	var link = $("input[name='editSpiderUrl']").val();
	if ($.trim(link) != "") {
		window.open(link);
	}
}

function aKeyCreateSku() {
	var globalSku = $("input[name='globalSku']").val();
	if ($.trim(globalSku) == "") {
		var param = {status : 0, message : "SPU"};
		$.message.showMessage(param);
		return;
	}
	
	$("table[name='collectionEditTable']").find("tr:gt(0)").each(function () {
		var sku = globalSku;
		var tr = $(this);
		var id = tr.attr("id").split("_")[1];
		var color = tr.find("input[name='color']").val();
		var size = tr.find("input[name='size']").val();
		
		if ($.trim(color) != "" || $.trim(size) != "") {
			if ($.trim(color) != "") {
				sku += "-" + color;
			}
			if ($.trim(size) != "") {
				sku += "-" + size;
			}
			tr.find("input[name=sku]").val(sku);
			tr.find("input[name=spu]").val(globalSku);
		}
	});
	
	var param = {status : 1};
	$.message.showMessage(param);
}

function aKeyCoverData() {
	var globalPrice = $.trim($("input[name='globalPrice']").val());
	var globalWeight = $.trim($("input[name='globalWeight']").val());
	var globalFreight = $.trim($("input[name='globalFreight']").val());
	
	if (globalPrice == "" && globalWeight == "" && globalFreight == "") {
		var param = {status : 0, message : "请至少填写价格、重量、运费中的一个"};
		$.message.showMessage(param);
		return;
	}
	
	var message = "确定<br/>";
	if (globalPrice != "") {
		message += "将价格全部覆盖为" + globalPrice + "<br/>";
	}
	if (globalWeight != "") {
		message += "将重量全部覆盖为" + globalWeight + "<br/>";
	}
	if (globalFreight != "") {
		message += "将运费全部覆盖为" + globalFreight + "<br/>";
	}
	message += "?";
	confirmMsg("coverData()", message);
	
}

function coverData() {
	var globalPrice = $.trim($("input[name='globalPrice']").val());
	var globalWeight = $.trim($("input[name='globalWeight']").val());
	var globalFreight = $.trim($("input[name='globalFreight']").val());
	
	$("table[name='collectionEditTable']").find("tr:gt(0)").each(function () {
		if (globalPrice != "") {
			$(this).find("input[name='price']").val(globalPrice);
		}
		if (globalWeight != "") {
			$(this).find("input[name='weight']").val(globalWeight);
		}
		if (globalFreight != "") {
			$(this).find("input[name='freight']").val(globalFreight);
		}
	});
	
	var param = {status : 1};
	$.message.showMessage(param);
	
}
