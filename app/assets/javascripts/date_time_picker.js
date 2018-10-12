//= require jquery
//= require rails-ujs
//= require jquery_ujs
//= require moment
//= require moment/fr.js

$( document ).on('turbolinks:load', function() {
  $('#datetimepicker').datetimepicker({
    console.log('test');
    locale: 'fr',
    sideBySide: true,
    format: "DD-MM-YYYY h:mm A"
  });
});
