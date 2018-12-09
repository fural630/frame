var vm = new Vue({
  el: '#app',
  data : {
	  q : {
		  name : '',
		  departmentCid : '',
		  status : ''
	  },
	  user : {
		  username : '',
		  deptName : '',
		  email : '',
		  mobile : '',
		  roleIdList : [],
		  status: 1
	  },
	  statusList : [
		  { text : '正常', value : '1' },
		  { text : '禁用', value : '0' }
	  ],
	  ruleValidate : {
		userName : [
			{required: true, message: '用户名不能为空', trigger: 'blur'}
		],
	  },
	  showList : true,
	  title : ''
  },
  methods : {
	  query : function () {
		  layui.table.reload('userTable', {
			  where : {
				  status : this.q.status === undefined ? '' : this.q.status,
				  name : this.q.name,
				  departmentCid : this.q.departmentCid
			  }
		  });
	  },
	  add : function () {
		  this.title = '添加';
		  this.showList = false;
		  this.user.status = 1;
	  },
	  saveOrUpdate : function () {
		  alert(1123);
	  },
	  reload : function () {
		  this.showList = true;
	  },
	  handleSubmit : function (name) {
		  handleSubmitValidate(vm, name, function () {
              vm.saveOrUpdate();
          });
	  },
      handleReset: function (name) {
    	  this.$refs[name].resetFields();
      }
  }
});


layui.use('table', function() {
	var table = layui.table;
	var $ = layui.$;
	
	table.render({
		elem: '#userTable'
		,toolbar: '#userToolbar'
		,url:'/sys/user/page'
		,autoSort : false
		,parseData: function(res){
		    return {
		      "code": res.code,
		      "count": res.page.total,
		      "data": res.page.list
		    };
		}
		,cols: [[
		  {type:'checkbox'}
		  ,{field : 'id',width : 60, title : 'ID', sort : true }
		  ,{field : 'name', width : 80, title : '姓名'}
		  ,{field : 'account', width : 200, title : '账号'}
		  ,{field : 'phone', width : 140, title : '电话'}
		  ,{field : 'email', width : 180, title : '邮箱'}
		  ,{field : 'sex', width : 70,  title : '性别',
			  templet : function (d) {
				  return transGender(d.sex)
			  }
		  }
		  ,{field : 'birthDay', width : 140, title : '出生日期', sort : true,
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
		var column = obj.field;
		if (obj.field == "birthDay") {
			column = "birth_day";
		}
		table.reload('userTable', {
		  initSort : obj,
		  where : {
			  field: column,
			  order: obj.type
		  }
	  });
	});
});