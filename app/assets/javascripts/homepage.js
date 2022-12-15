let swiper = new Swiper(".mySwiper", {
    slidesPerView: 3,
    spaceBetween: 30,
    slidesPerGroup: 3,
    loop: true,
    loopFillGroupWithBlank: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  let swipercard = new Swiper('.swiper-container', {
    // d'autres options de configuration
    slidesPerView: 'auto',
    spaceBetween: 20,
    loop: true,
    
    width: 200,  // définissez la largeur des images ici
    height: 100, // définissez la hauteur des images ici
});


