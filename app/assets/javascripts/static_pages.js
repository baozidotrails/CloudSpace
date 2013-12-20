$(function() {
  $('.fun_board a').on('click', function() {
    if(!$(this).hasClass('open')) {
      var oldContent = $('.fun_board a.open').attr('href');
      var newContent = $(this).attr('href');
      var newData = $(this).data('title');
      $(oldContent).fadeOut('fast', function() {
        $(newContent).fadeIn('fast', function() {
          $('#useful_6').text(newData);
        }).removeClass('hidden');
        $(oldContent).addClass('hidden');
      });
      $('.fun_board a').removeClass('open');
      $(this).addClass('open');
    }
  });
});