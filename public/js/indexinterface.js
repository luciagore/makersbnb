"use strict";
$(document).ready(function(){
  let xhr = $.post('/getusers');
  xhr.done(function(response){
    for(let i in response){
      let message = "<li>" + response[i].name_of_space + " - " + response[i].description + " by: " + response[i].email
      if($('#signedin').val()){
        message = message + "<a href = '/newrequest?space_id=" + response[i].id +"'>book now!</a></li>"
      }
      $('#listings').append(message);
    }
  });
});
