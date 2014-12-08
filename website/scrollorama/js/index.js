//$(window).scrollTop();
var section1top = $('#section-id-1').offset().top;
//var section2top = $('#section-id-2').offset().top;
//var section3top = $('#section-id-3').offset().top;


// initialize the plugin, pass in the class selector for the sections of content (blocks)
var scrollorama = $.scrollorama({ 
  blocks:'body'
});

scrollorama.animate('#section-id-1 .hr-left', { 
  delay:0,duration:300,property:'left', start:'50%', end:'0%'
})
.animate('#section-id-1 .hr-right', { 
  delay:0,duration:300,property:'right', start:'0%',end:'0%'
})
.animate('#section-id-1 .section-content', { 
  delay:0,duration:0,property:'opacity', start:'0',end:'1'
})
.animate('#section-id-1 .page-section', { 
  delay:2000,duration:500,property:'top', end:'100px'
})
.animate('#section-id-1 .page-section', { 
  delay:2000,duration:500,property:'opacity', end:'0'
})


.animate('#section-id-2 .hr-left', { 
  delay:2000,duration:300,property:'left', start:'0%', end:'0%'
})
.animate('#section-id-2 .hr-right', { 
  delay:2000,duration:300,property:'right', start:'0%',end:'0%'
})
.animate('#section-id-2 .section-content', { 
  delay:2500,duration:3000,property:'opacity', start:'0',end:'1'
})
.animate('#section-id-2 .page-section', { 
  delay:3000,duration:5000,property:'top', end:'100px'
})
.animate('#section-id-2 .page-section', { 
  delay:3000,duration:5000,property:'opacity', end:'0'
})


.animate('#section-id-3 .hr-left', { 
  delay:3500,duration:300,property:'left', start:'-50%', end:'0%'
})
.animate('#section-id-3 .hr-right', { 
  delay:3500,duration:300,property:'right', start:'-50%',end:'0%'
})
.animate('#section-id-3 .section-content', { 
  delay:3500,duration:300,property:'opacity', start:'0',end:'1'
})
.animate('#section-id-3 .page-section', { 
  delay:4500,duration:500,property:'top', end:'1000px'
})
.animate('#section-id-3 .page-section', { 
  delay:4500,duration:500,property:'opacity', end:'0'
});



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
