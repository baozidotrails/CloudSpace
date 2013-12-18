$(function() {



  // user
  $('#tabs a').on('click', function() {
    if(!$(this).hasClass('open')) {
      var oldContent = $('#tabs a.open').attr('href');
      var newContent = $(this).attr('href');
      $(oldContent).fadeOut('fast', function() {
        $(newContent).fadeIn().removeClass('hidden');
        $(oldContent).addClass('hidden');
      });
      $('#tabs a').removeClass('open');
      $(this).addClass('open');
    }
  });

  // space
  $('#g').click(function() {
    $('#space_editor').append('<div class="lot"></div>');
    $('.lot').draggable({
      stop: function() {
        var lot = {
          'id': $(this).attr('id'),
          'width': $(this).width().toString(),
          'height': $(this).height().toString(),
          'pos_x': $(this).position().left.toString(),
          'pos_y': $(this).position().top.toString()
        }
        // console.log(lot);
        // $.ajax({
        //   type: 'PUT',
        //   url: '/lots/' + $(this).attr('id'),
        //   data: JSON.stringify(block),
        //   contentType: 'application/json',
        //   dataType: 'json'
        // });
      }
    }).resizable({
      stop: function() {
        var lot = {
          'id': $(this).attr('id'),
          'width': $(this).width().toString(),
          'height': $(this).height().toString(),
          'pos_x': $(this).position().left.toString(),
          'pos_y': $(this).position().top.toString()
        }
        // console.log(lot);
      }
    });

  });

    $('.lot').draggable({
      containment: "parent",
      stop: function(event, ui) {
        var lot = {
          'id': $(this).attr('id'),
          'width': $(this).width().toString(),
          'height': $(this).height().toString(),
          'pos_left': $(this).position().left.toString(),
          'pos_top': $(this).position().top.toString()
        }
        console.log(lot);
        $.ajax({
          type: 'PUT',
          url: '/lots/' + $(this).attr('id') + ".json",
          data: JSON.stringify(lot),
          contentType: 'application/json',
          dataType: 'json',
          error: function(xhr, msg, error) {
            alert('error');
          }
        });
      }
  }).resizable({
      stop: function(event, ui) {
        var lot = {
          'id': $(this).attr('id'),
          'width': $(this).width().toString(),
          'height': $(this).height().toString(),
          'pos_left': $(this).position().left.toString(),
          'pos_top': $(this).position().top.toString()
        }
        console.log(lot);
        $.ajax({
          type: 'PUT',
          url: '/lots/' + $(this).attr('id') + ".json",
          data: JSON.stringify(lot),
          contentType: 'application/json',
          dataType: 'json',
          error: function(xhr, msg, error) {
            alert('error');
          }
        });
      }
  });



});