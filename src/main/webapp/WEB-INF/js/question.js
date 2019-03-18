/**
 *
 */
$(function(){
    /*标签添加验证*/
    $("#tag").keydown(function(event){
        var tag=$("#tag").val();
        var tagAdd="<li class='alert alert-success alert-dismissible'><span class='tag-name'>"+tag+"</span><button type='button' class='close' data-dismiss='alert' style='position: relative;padding:0;'>&times;</button></li>";
        var test=1;
        if(event.keyCode==13){
            if(tag==""){}
            else{
                $(".tag-name").each(function(){
                    if(tag==$(this).text()){
                        test=0;
                    }
                })
                if(test==1){
                    if($("#tag-ul").children("li").length<5){
                        $(".tag-alert").remove();
                        $("#tag-ul").append(tagAdd);
                        $("#tag").val("");
                    }
                    else{
                        $(".tag-alert").remove();
                        var alert="<span class='tag-alert'>最多添加五个标签</span>";
                        $(".question-tag").append(alert);
                    }
                }
                else{
                    $(".tag-alert").remove();
                    var alert="<span class='tag-alert'>您已经添加过该标签，请输入其他标签。</span>";
                    $(".question-tag").append(alert);
                }
            }
        }
    })
})