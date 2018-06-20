"use strict";
$(document).ready(function(){
  $('#submit').one('click', function(){
    let email = $('#email').val();
    let password = $('#password').val();

    let xhr = $.post('/signin',
    {
      email: email,
      password: password,
    });

    xhr.done(function(signup){
      window.location.replace("/");
    });
  });
});
