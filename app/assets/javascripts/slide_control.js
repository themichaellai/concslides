//= require jquery

var counter = 0;
var moveSlide = function (slides, moveForward) {
  slides.eq(counter).hide();
  if (moveForward) {
    counter++;
    if (counter >= slides.length) {
      counter = slides.length - 1;
    }
  } else {
    counter--;
    if (counter <= 0) {
      counter = 0;
    }
  }
  slides.eq(counter).show();
}
window.onload = function () {
  var slides = $('.slide');
  slides.hide();
  slides.first().show();

  $(document).keydown( function(e) {
    // right arrow
    if (e.which == 39) {
      moveSlide(slides, true);
    }
    else if (e.which == 37) {
      moveSlide(slides, false);
    }
  });
}
var controllerMove = function(moveForward) {
  var slides = $('.slide');
  moveSlide(slides, moveForward);
}
