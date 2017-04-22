<script>
	window.parent.unblock();
	var uploadImages = [];
</script>

<#if imageList??>
	<#list imageList as image>
	<script>
		uploadImages.push('${image}');
	</script>
	</#list>
	<script>
		for (var i=0; i < uploadImages.length; i++) {
			window.parent.createSelectImageHtml(uploadImages[i]);
		}
	</script>
</#if>