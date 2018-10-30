/**
 * 翻译性别
 * @param gender
 * @returns {*}
 */
function transGender(gender) {
    if (gender == 1) {
        return '男';
    }
    if (gender == 0) {
        return '女';
    }
    return '';
};

/**
 * 翻译日期
 * @param date
 * @param fmt
 * @returns {*}
 */
function transDate(date, fmt) {
    if (date) {
        if (typeof date == 'string') {
            return new Date(date).dateFormat(fmt);
        } else {
            try {
                return new Date(date.replace('-', '/').replace('-', '/')).dateFormat(fmt);
            } catch (e) {
                return '-';
            }
        }
    } else {
        return '';
    }
};

function transUserStatus (status) {
	if (status == 1) {
		return '<button class="layui-btn layui-btn-sm layui-btn-normal">正常</button>';
	}
	if (status == 0) {
		return '<button class="layui-btn layui-btn-sm layui-btn-danger">禁用</button>';
	}
	return '';
}