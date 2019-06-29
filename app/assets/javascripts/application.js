//= require rails-ujs
//= require_tree .
//= require jquery
//= require jquery_ujs
//= require underscore
//= require gmaps/google
//= require moment
//= require moment/fr.js
//= require swiper


/*nope.addEventListener('click', nopeListener);
love.addEventListener('click', loveListener);
*/

//= require serviceworker-companion

// app/assets/javascripts/application.js

if ('.serviceWorker' in navigator) {
  console.log('Service Worker is supported');
  navigator.serviceWorker.register('/serviceworker.js')
    .then(function(registration) {
      console.log('Successfully registered!', ':^)', registration);
      registration.pushManager.subscribe({ userVisibleOnly: true })
        .then(function(subscription) {
            console.log('endpoint:', subscription.endpoint);
        });
  }).catch(function(error) {
    console.log('Registration failed', ':^(', error);
  });
}



