// var open = document.getElementById("openmodel");
// open.addEventListener("click", function () {
//   alert("alert opened");
// });

$(document).ready(function () {
  $("#load_data").click(function () {
    $("#fun").load("sample.txt");
  });
});
