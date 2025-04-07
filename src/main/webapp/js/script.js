var swiper = new Swiper(".mySwiper", {
    loop: true,
    grabCursor: true,
    spaceBetween: 20,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
      dynamicBullets:true,
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    breakpoints:{
        0:{
          slidesPerView: 1
        },
        768:{
          slidesPerView: 2
        },
        992:{
          slidesPerView: 5
        },
       }
  });
  