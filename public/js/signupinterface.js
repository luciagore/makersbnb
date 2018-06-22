"use strict";
$(document).ready(function(){
  $('#submitSignUp').on('click', function(){
    let email = $('#emailSignUp').val();
    let password = $('#passwordSignUp').val();
    let name = $('#nameSignUp').val();
    let username = $('#userNameSignUp').val();

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
