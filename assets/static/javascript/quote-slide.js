/*****************
 * Quote Carousel
 *****************/

var $quote_carousel = $('.ds-home--testimony');

// If there's a carousel on the page...
if( $quote_carousel.length ){

    $quote_carousel.find('.ds-home--testimony-carousel--group').slick({
        fade: true,
        autoplay: true,
        dots: true,
        infinite: true,
        arrows: false,
        autoplaySpeed: 3000,
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    fade: false,
                    arrows: false,
                    slidesToShow: 1,
                    adaptiveHeight: true
                }
            }
        ]
    });

}
//
// /*****************
//  * About page our story Carousel
//  *****************/
//
// var $story_quote_carousel = $('.c-our-story-carousel--content');
//
// // If there's a carousel on the page...
// if( $story_quote_carousel.length ){
//
//     $story_quote_carousel.slick({
//         fade: true,
//         autoplay: true,
//         dots: true,
//         infinite: true,
//         arrows: false
//     });
//
// }