/**
 * 
 */
$(function(){
	var folder=$.getUrlParam('folder');
	if(folder==null){
		$("#sel_folder option[value='0']").attr("selected","selected");
	}
	else{
		$("#sel_folder option").each(function(){
			var select="'"+$(this).text()+"'";
			if(folder==select){
				$(this).attr("selected","selected");
			}
		})
	}
})