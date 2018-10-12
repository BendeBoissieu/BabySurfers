$( document ).on('turbolinks:load', function() {
  $('#datetimepicker').datetimepicker(function){
    console.log('test');
    locale: 'fr',
    sideBySide: true,
    format: "DD-MM-YYYY h:mm A"
  };
});
