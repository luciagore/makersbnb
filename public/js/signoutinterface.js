"use strict";
$(document).ready(function(){
    $('#signout').on('click', function(){
      console.log("clicked signout button");
      let xhr = $.post('/signout');
      xhr.done(function(signout){
        window.location.replace("/");
      });
    });

  });
