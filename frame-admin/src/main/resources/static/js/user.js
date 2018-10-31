var app = new Vue({
  el: '#app',
  data : {
	  name : null,
	  deptId : null
  },
  methods : {
	  search : function () {
		  layui.table.reload('userTable', {
			  where : {
				  name : this.name,
				  deptId : this.deptId
			  }
		  });
	  },
	  sortTable : function (field, type, obj) {
		  layui.table.reload('userTable', {
			  initSort : obj,
			  where : {
				  name : this.name,
				  deptId : this.deptId,
				  field : field,
				  type : type
			  }
		  });
	  },
	  reset : function () {
		  
	  }
  }
});


layui.use('table', function() {
	var table = layui.table;
	var $ = layui.$;
	
	table.render({
		elem: '#userTable'
		,toolbar: '#userToolbar'
		,url:'/sys/user/list'
		,autoSort : false
		,request : {
			pageName : 'nowPage',
			limitName : 'pageSize'
		}
		,response : {
			countName : 'totalNum',
			dataName : 'items',
			statusCode : 200
		}
		,cols: [[
		  {type:'checkbox'}
		  ,{field : 'id', width : 60, title : 'ID', sort : true }
		  ,{field : 'name', width : 80, title : '姓名'}
		  ,{field : 'account', width : 200, title : '账号'}
		  ,{field : 'phone', width : 140, title : '电话'}
		  ,{field : 'email', width : 180, title : '邮箱'}
		  ,{field : 'sex', width : 70,  title : '性别', sort : true, 
			  templet : function (d) {
				  return transGender(d.sex)
			  }
		  }
		  ,{field : 'birthDay', width : 120, title : '出生日期', 
			  templet : function (d) {
				  return transDate(d.birthDay, 'yyyy年MM月dd日')
			  }
		  }
		  ,{field : 'departmentCid', minWidth : 100, title: '所属部门'}
		  ,{field : 'status', width : 80, title : '状态', sort : true, 
			  templet : function (d) {
				  return transUserStatus(d.status)
			  }
		  }
		]]
		,page: true
	});
	
	table.on('sort(userTable)', function (obj){
		var field = obj.field;
		var type = obj.type;
		if (type) {
			app.sortTable(field, type, obj);
		}
	});
});