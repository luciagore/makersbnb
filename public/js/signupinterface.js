"use strict";
$(document).ready(function(){
  $('#submit').one('click', function(){
    let email = $('#email').val();
    let password = $('#password').val();
    let name = $('#name').val();
    let username = $('#username').val();

    let xhr = $.post('/signup',
    {
      email: email,
      password: password,
      name: name,
      username: username
    });

    xhr.done(function(signup){
      // $('#response').append(
      //   "You have successfully signed up, " + signup.username
      // );
      window.location.replace("/");
    });
  });
});

