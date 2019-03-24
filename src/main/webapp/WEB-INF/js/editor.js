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
        if($("#user").val()==""){
            alert("请先登录!");
        }
        else if($("#content").text()==""){
            alert("回答内容不能为空");
        }
    })
})
function checkForm() {
    if($("#user").val()==""){
        return false;
    }else if($("#content").text()==""){
        return false;
    }else{
        return true;
    }
}