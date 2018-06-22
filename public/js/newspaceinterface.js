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
      let price = parseFloat($('#price').val());
      console.log(price)
      let user_id = $('#user_id').val();
      console.log(user_id)
      let xhr = $.post('/new',
      {
        name_of_space: name_of_space,
        email: email,
        description: description,
        price_per_night: price,
        user_id: user_id
      });

      xhr.done(function(response){
        window.location.replace('/');
      });
    });


  });
