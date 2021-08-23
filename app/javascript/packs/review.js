document.addEventListener("turbolinks:load", function(){
$(".writeReviewDiv").hide();
    $(".reviewButton").click(function(){
        $(this).parent().find(".writeReviewDiv").show();        
    });
});