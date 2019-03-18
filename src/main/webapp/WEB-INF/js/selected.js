$(function () {
    var isPublic=$("#isPublicValue").val();
    var courseId=$("#courseIdValue").val();
    var title=$("#titleValue").val();
    if(isPublic!="") {
        $("#isPublic").val(isPublic);
    }
    if(courseId!="") {
        $("#courseId").val(courseId);
    }
    if(title!=""){
        $("#title").val(title);
    }
})