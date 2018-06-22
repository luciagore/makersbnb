"use strict";
$(document).ready(function(){
  let xhr = $.post('/getusers');
  xhr.done(function(response){
    for(let i in response){
      let message1 = "<div class='p-2 item-hl'><div class='card' style='width: 18rem'><img class='card-img-top img-fluid' style = 'height:200px; width:300px;' src='userimages/" + response[i].image_name +"' alt='' class = 'user_image'><div class='card-body'><h4 class='card-title'>"
      + response[i].name_of_space +
      "</h4><p class='card-text'>"
      + response[i].description +
      "</p><p class='card-text'>£" + response[i].price_per_night + " per night</p><p class='card-text'>"
      + response[i].email +
      "</p>"
      let message2 = "</div></div></div>"
      if($('#signedin').val()){ message1 = message1 + "<a href = '/newrequest?space_id=" + response[i].id +"'>book now!</a>" }
      $('#listings').append(message1 + message2);
    }
  });
});
