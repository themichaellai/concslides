//= require jquery

var counter = 0;
var moveSlide = function (slides, moveForward, callback) {
  slides.eq(counter).hide();
  if (moveForward) {
    counter++;
    if (counter >= slides.length) {
      counter = slides.length - 1;
    }
  } else {
    counter--;
    if (counter < 0) {
      counter = 0;
    }
  }
  slides.eq(counter).show();
  callback(counter);
}
var jumpSlide = function (jumpTo) {
  var slides = $('.slide');
  slides.eq(counter).hide();
  counter = jumpTo
  if (counter >= slides.length) {
    counter = slides.length - 1;
  }
  if (counter < 0) {
    counter = 0;
  }
  slides.eq(counter).show();
}
window.onload = function () {
}
var controllerMove = function(moveForward) {
  var slides = $('.slide');
  moveSlide(slides, moveForward);
}
