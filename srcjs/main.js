$(function() {
  $('.drac-tab').on('click', function() {
    $('.drac-tab.drac-tab-active').removeClass('drac-tab-active');
    $(this).toggleClass('drac-tab-active');
  });
});
