"use strict";
$(document).ready(function(){
  $('#submitLogIN').on('click', function(){
    let email = $('#emailLogIN').val();
    let password = $('#passwordLogIn').val();

    let xhr = $.post('/signin',
    {
      email: email,
      password: password,
    });

    xhr.done(function(signin){
      if(signin == 'error'){
        $('#response2').text('Incorrect login details. Try again');
      } else {
      window.location.replace("/");
    }
    });
  });
});
