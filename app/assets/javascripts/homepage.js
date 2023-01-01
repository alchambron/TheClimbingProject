let width = window.innerWidth;
let sliderPerView = 1;

if (width > 800) {
  sliderPerView = 3;
}

let swiper = new Swiper(".mySwiper", {
  slidesPerView: sliderPerView,
  spaceBetween: 30,
  slidesPerGroup: sliderPerView,
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


