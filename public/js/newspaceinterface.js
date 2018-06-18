"use strict";
$(document).ready(function() {
  // $.get('/', function(response) {
  //   let name = response[0].email;
  //  console.log("got response" + name);
  // });
    $('#submit').on('click', function(){
      let name_of_space = $('#name_of_space').val();
      let email = $('#email').val();
      let description = $('#description').val();

      let xhr = $.post('/new',
      {
        name_of_space: name_of_space,
        email: email,
        description: description
      });

      xhr.done(function(response){
        $('#response').append("Made a new listing:<br>email: " + response.email + "<br>name of space: " + response.name_of_space + "<br>description: " +response.description);
      });
    });


  });
