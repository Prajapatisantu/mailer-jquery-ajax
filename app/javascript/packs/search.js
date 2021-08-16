document.addEventListener("turbolinks:load", function(){
    $input = $('*[data-behavior="autocomplete"]')
    var options = {
      url: function(phrase){
        return "/search.json?search="+ phrase;
      },
      getValue: "name",
      list: {
        match: {
          enabled: true
        }
      }
    };
    $input.easyAutocomplete(options);
});