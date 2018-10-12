$( document ).on('turbolinks:load', function() {
  $('#datetimepicker').datetimepicker({
    console.log('test');
    locale: 'fr',
    sideBySide: true,
    format: "DD-MM-YYYY h:mm A"
  });
});
