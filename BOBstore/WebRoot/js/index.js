/*
* @Author: Marte
* @Date:   2019-01-10 12:03:22
* @Last Modified by:   Marte
* @Last Modified time: 2019-01-10 12:12:31
*/

'use strict';

$(function(){
    $(".owl-carousel").owlCarousel({
        items : 1,
        loop : true,
        mergeFit : true,
        dots : true,
        autoplay : true,
        autoplayTimeout : 5000,
        autoplayHoverPause : true,
        smartSpeed : 750
    });
})

