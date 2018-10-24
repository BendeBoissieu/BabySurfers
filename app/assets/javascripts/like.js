$('document').ready(function (){
  var myVar = document.getElementById("aloha").addEventListener("click", likeSurfer);
  function likeSurfer(){
  console.log('I like');
   document.getElementById("demo").innerHTML = "TEST";
   console.log(mySwiper.activeIndex);
  }
  var mySwiper = new Swiper('.swiper-container', {
    direction: 'horizontal',
    loop: true,
    onSlideChangeStart:function(swipe){
       // console.log(geSlideDataIndex(swipe))
    },
  });


})

function geSlideDataIndex(swipe){
    var activeIndex = swipe.activeIndex;
    console.log('test');

    return  activeIndex;
}
