function superSwiper() {


  $(document).ready(function () {
    //initialize swiper when document ready
    var mySwiper = new Swiper ('.swiper-container', {
      // Optional parameters
      direction: 'horizontal',
      loop: true
    })
  });

        var mySwiper = new Swiper ('.swiper-container', {
        // Optional parameters
        direction: 'vertical',
        loop: true,

        // If we need pagination
        pagination: '.swiper-pagination',

        // Navigation arrows
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',

        // And if we need scrollbar
        scrollbar: '.swiper-scrollbar',
      })
}

superSwiper();
export { superSwiper };
