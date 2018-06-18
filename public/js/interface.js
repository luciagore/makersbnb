"use strict";
$(document).ready(function() {
    function search() {
        var xhr = $.get("http://localhost:9292/spaces/new/hi");
        xhr.done(function(response) {
          alert('done!')
            }
        });
      search();
    }
  });
