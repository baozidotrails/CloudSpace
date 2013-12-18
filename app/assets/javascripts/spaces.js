$(function() {
  // pick surface or floor pic
  $('.sur_or_floor').fancybox();

  // when select on fancybox
  $('#make-sur-pic,#upload-sur-pic').click(function() {
    $('#space_editor').fadeIn('fast', function() {
      $('.sur_or_floor').remove();
    });
  });

});


