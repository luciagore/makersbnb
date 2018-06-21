"use strict";
$(document).ready(function(){
  $('#submit').on('click', function(){
    let email = $('#email').val();
    let password = $('#password').val();

    let xhr = $.post('/signin',
    {
      email: email,
      password: password,
    });

    xhr.done(function(signin){
      if(signin == 'error'){
        $('#response').text('Incorrect login details. Try again');
      } else {
      window.location.replace("/");
    }
    });
  });
});
