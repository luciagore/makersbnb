"use strict";
$(document).ready(function() {

    $('#submit').on('click', function(){
      let body = $('#inputMessage').val();
      let email = $('#inputEmail').val();
      let space_id = Number($('#space_idRequest').val());
      let user_id = Number($('#user_idRequest').val());


      let xhr = $.post('/newrequest',
      {
        user_id: user_id,
        space_id: space_id,
        body: body,
        email: email
      });

      xhr.done(function(response){
        $('#response4').append(
          "Made a new request:<br>email: " + response.email +
          "<br>Message body: " + response.body
        );
      });
    });


  });
