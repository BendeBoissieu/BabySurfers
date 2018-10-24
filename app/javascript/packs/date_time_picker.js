$( document ).on('turbolinks:load', function() {
  $('#datetimepicker').datetimepicker({
    sideBySide: true,
    format: "DD-MM-YYYY h:mm A"
  });
});

