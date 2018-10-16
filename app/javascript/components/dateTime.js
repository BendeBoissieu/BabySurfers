$( document ).on('turbolinks:load', function() {
  $('#datetimepicker').datetimepicker({
    locale: 'fr',
    sideBySide: true,
    format: "YYYY-MM-DD h:mm A"
  });
});
