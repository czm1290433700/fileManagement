$(function(){
    $(".file").on("change",function(){
        var filepath=$(this).val(),src = window.URL.createObjectURL(this.files[0]);
        $(".info-form-pic").attr('src',src);
    })
})