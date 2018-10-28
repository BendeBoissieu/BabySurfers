$('document').ready(function (){
  var myVar = document.getElementById("aloha").addEventListener("click", likeSurfer);
  function likeSurfer(){

   //console.log(mySwiper.activeIndex);
   // FIND THE USER ID OF THE ACTIVE SWIPER CARD
  // var activenb = mySwiper.activeIndex;
  // var idUser = mySwiper.slides[activenb].firstChild.nextElementSibling.innerText
   //  console.log(idUser);
   //document.getElementById("demo").innerHTML = idUser;




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
