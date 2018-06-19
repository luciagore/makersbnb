"use strict";
$(document).ready(function() {

    $('#submit').on('click', function(){
      let body = $('#body').val();
      let email = $('#email').val();
      let space_id = $('#space_id').val();

      let xhr = $.post('/newrequest',
      {
        space_id: space_id,
        body: body,
        email: email
      });

      xhr.done(function(response){
        $('#response').append(
          "Made a new request:<br>email: " + response.email +
          "<br>Message body: " + response.body
        );
      });
    });


  });
