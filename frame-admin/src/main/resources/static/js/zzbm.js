var setting = {
    data: {
        simpleData: {
            enable: true,
            idKey : "id",
			pIdKey : "parentId",
            rootPId: 0
        },
        key: {
            url: "nourl"
        }
    },
    callback: {
		onClick: zTreeOnClick
	},
	view: {
		selectedMulti: false
	}
};
var ztree;

function zTreeOnClick (event, treeId, treeNode) {
	var title = vm.title;
	if (title == '') {
		return;
	}
	if (title == '修改') {
		vm.update();
	}
	if (title == '添加') {
		vm.add();
	}
}

var vm = new Vue({
	el : '#app',
	data : {
		zzbm : {
			qyid : '',
			bmmc : '',
			sjdwmc : '',
			bmlx : '',
			bmjc : '',
			lxdz : '',
			lxdh : '',
			jkyh : '',
			jkyhzh : '',
			fydw1 : '',
			fydw2 : '',
			dfbm : '',
			yb : ''
		},
		zzlxList : [
			{text : '单位', key : 1},
			{text : '部门', key : 2}
		],
		cityList : constant.cityList,
		ruleValidate : {
			bmmc : [ {
				required : true,
				message : '组织名称不能为空'
			} ],
			qyid : [ {
					required : true,
					message : '管辖区域不能为空'
			} ],
			bmlx : [ {
				required : true,
				message : '状态必须设置',
				type : 'number'
			} ],
		},
		showList : true,
		title : ''
	},
	methods : {
		reloadTree : function () {
			Ajax.request({
                url: '../sys/zzbm/list',
                async: true,
                successCallback: function (data) {
                	var zNodes = [];
                	var list = data.list;
                	for (var i = 0; i < list.length; i++) {
                		var zNode = {
                			id : list[i].zzid,
                			parentId : list[i].sjid,
                			name : list[i].bmmc
                		};
                		zNodes.push(zNode);
                	}
                    ztree = $.fn.zTree.init($("#zzbmTree"), setting, zNodes);
                }
            });
		},
		add : function() {
			this.title = '添加';
			this.showList = false;
			var nodes = ztree.getSelectedNodes();
			var sjdwmc = '';
			var sjid = '0';
			if (nodes.length > 0) {
				sjdwmc = nodes[0].name;
				sjid = nodes[0].id;
			}
			this.zzbm = {
				qyid : '',
				bmmc : '',
				sjdwmc : sjdwmc,
				sjid : sjid,
				bmlx : '',
				bmjc : '',
				lxdz : '',
				lxdh : '',
				jkyh : '',
				jkyhzh : '',
				fydw1 : '',
				fydw2 : '',
				dfbm : '',
				yb : ''
			}
		},
		update : function() {
			var nodes = ztree.getSelectedNodes();
			if (nodes.length == 0) {
				iview.Message.warning('请选择要修改的数据!');
				return;
			}
			this.title = '修改';
			this.showList = false;
			var id = nodes[0].id;
			Ajax.request({
                url: "../sys/zzbm/info/" + id,
                async: true,
                successCallback: function (r) {
                    vm.zzbm = r.zzbm;
                }
            });
			
		},
		del : function () {
			var nodes = ztree.getSelectedNodes();
			if (nodes.length == 0) {
				iview.Message.warning('请选择要删除的数据!');
				return;
			}
			confirm('确定要删除选中的记录？', function () {
                Ajax.request({
                    url: "../sys/zzbm/delete/" + nodes[0].id,
                    successCallback: function () {
                        alert('操作成功', function (index) {
                        	var node = ztree.getSelectedNodes()[0];
                        	ztree.removeNode(node);
                        });
                    }
                });
            });
		},
		saveOrUpdate : function() {
			var url = this.zzbm.zzid == undefined ? "../sys/zzbm/save"
					: "../sys/zzbm/update";
			Ajax.request({
				url : url,
				params : JSON.stringify(vm.zzbm),
				contentType : "application/json",
				type : 'POST',
				successCallback : function(data) {
					alert('操作成功', function(index) {
						if (vm.zzbm.zzid == undefined) { //添加
							var parentNode = ztree.getSelectedNodes()[0];
							var newNode = {
								id : data.id,
								parentId : parentNode.id,
								name : vm.zzbm.bmmc
							};
							ztree.addNodes(parentNode, newNode);
						} else {
							var newNode = ztree.getSelectedNodes()[0];
							newNode.name = vm.zzbm.bmmc;
							ztree.updateNode(newNode);
						}
					});
				}
			});
		},
		reload : function() {
//			this.showList = false;
//			this.reloadTree();
		},
		handleSubmit : function(name) {
			handleSubmitValidate(vm, name, function() {
				vm.saveOrUpdate();
			});
		},
		handleReset : function(name) {
			this.$refs[name].resetFields();
		}
	},
	created : function () {
		this.reloadTree();
	}
});

layui.use('table', function() {
	var table = layui.table;
	var $ = layui.$;

	table.render({
		elem : '#userTable',
		toolbar : '#userToolbar',
		url : '/sys/user/page',
		autoSort : false,
		parseData : function(res) {
			return {
				"code" : res.code,
				"count" : res.page.total,
				"data" : res.page.list
			};
		},
		cols : [ [ {
			type : 'checkbox'
		}, {
			field : 'id',
			width : 60,
			title : 'ID',
			sort : true
		}, {
			field : 'name',
			width : 80,
			title : '姓名'
		}, {
			field : 'account',
			width : 200,
			title : '账号'
		}, {
			field : 'phone',
			width : 140,
			title : '电话'
		}, {
			field : 'email',
			width : 180,
			title : '邮箱'
		}, {
			field : 'sex',
			width : 70,
			title : '性别',
			templet : function(d) {
				return constant.transGender(d.sex)
			}
		}, {
			field : 'birthDay',
			width : 140,
			title : '出生日期',
			sort : true,
			templet : function(d) {
				return transDate(d.birthDay, 'yyyy年MM月dd日')
			}
		}, {
			field : 'departmentCid',
			minWidth : 100,
			title : '所属部门'
		}, {
			field : 'status',
			width : 80,
			title : '状态',
			sort : true,
			templet : function(d) {
				return constant.transUserStatus(d.status)
			}
		} ] ],
		page : true
	});

	table.on('sort(userTable)', function(obj) {
		var column = obj.field;
		if (obj.field == "birthDay") {
			column = "birth_day";
		}
		table.reload('userTable', {
			initSort : obj,
			where : {
				field : column,
				order : obj.type
			}
		});
	});
});