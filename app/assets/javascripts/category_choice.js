//= require jquery

$(document).ready(function() {
  $(".category-choice").click(function(){
    $(this).toggleClass("active");
  });
});


  $(document).ready(function () {
    //initialize swiper when document ready
    var mySwiper = new Swiper ('.swiper-container', {
      // Optional parameters
      direction: 'horizontal',
      loop: true
    })
  });


/*Toggleclass Jquery method if the class doest exit, add it*/
