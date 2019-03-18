/**
 * 
 */
$(function(){
	/*创建富文本域*/
	var E = window.wangEditor;
    var editor = new E('#editor');
    editor.create();
    editor.txt.html($("#content").val());
    $("#add").click(function(){
        var content = editor.txt.html();
        $("#content").val(content);
    })
})