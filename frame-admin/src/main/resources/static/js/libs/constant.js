var constant = {
	sexList : [
		{ text : '男', value : '1' },
		{ text : '女', value : '0' }	
	],
	userStatusList : [
		{ text : '正常', value : '1' },
		{ text : '禁用', value : '0' }	
	],
	
	
	
	transGender : function (gender) {
		if (gender == 1) {
	        return '男';
	    }
	    if (gender == 0) {
	        return '女';
	    }
	    return '';
	},

	transUserStatus : function (status) {
		if (status == 1) {
			return '<button class="layui-btn layui-btn-sm layui-btn-normal">正常</button>';
		}
		if (status == 0) {
			return '<button class="layui-btn layui-btn-sm layui-btn-danger">禁用</button>';
		}
		return '';
	},
}