"use strict";
$(document).ready(function(){
  let xhr = $.get('/getusers');
  xhr.done(function(response){
    for(let i in response){
      $('#listings').append("<li>" + response[i].name_of_space + " - " + response[i].description + " by: " + response[i].email + "</li>");
    }
  });
});
