document.addEventListener("turbolinks:load", function(){
    $("#imgUpload").change(function(event){
        var image = document.getElementById('userimage');
        image.src = URL.createObjectURL(event.target.files[0]);
    });
});

