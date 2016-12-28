jQuery.myformPlugins = {
	
	cleanForm : function (selector) {
		$(':input', selector).each(function() {
			var type = this.type;
			var tag = this.tagName.toLowerCase();
			if (type == 'text' 
				|| type == 'password' 
						|| type == 'textarea' 
							|| type == 'email' 
								|| type == 'hidden'
									|| type == 'file')
				this.value = "";
			else if (type == 'checkbox' || type == 'radio')
			      this.checked = false;
			else if (tag == 'select')
			      this.selectedIndex = 0;
		});
		$(selector).find(".validateTip").html("").hide();
	}
};