//$(window).scrollTop();
var section1top = $('#section-id-1').offset().top;
//var section2top = $('#section-id-2').offset().top;
//var section3top = $('#section-id-3').offset().top;


// initialize the plugin, pass in the class selector for the sections of content (blocks)
var scrollorama = $.scrollorama({ 
  blocks:'.scrollblock'
});





scrollorama
.animate('#section-id-1 .section-content',{ duration:1000, property:'margin-top', start:200 , pin: true} )
.animate('#section-id-2 .section-content',{ duration:1000, property:'opacity', start:0, pin: true })
.animate('#section-id-3 .section-content',{ duration:1000, property:'padding-top', start:400, pin: true} )




//function that draws a ruler with markers every 100px down the document
//for setting up scrollorama animations

var html='';
var windowheight = $(document).height();
var windowwidth = $(document).width();

for (var i=1; i<(windowheight/100); i++) {
  var t = i * 100;
  html += '<div class="pixelmarker pixelmarker-left" style="top:'+t+'px;">'+t+'px</div>'; 
}
for (var i=1; i<(windowwidth/100); i++) {
  var t = i * 100;
  html += '<div class="pixelmarker pixelmarker-top" style="left:'+t+'px;">'+t+'px</div>'; 
}

$('body').append('<div class="ruler-wrap"></div>');
$('.ruler-wrap').append(html);

function scrollToPixel(x) {
  //$(window).scrollTop(y);
  $("html, body").animate({ scrollTop: x }, 1200);
}

