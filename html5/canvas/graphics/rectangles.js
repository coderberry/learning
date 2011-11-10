$(document).ready(function() {
  var canvas = $("#canvas")[0];
  ctx = canvas.getContext("2d");

  // Draw a 100 by 150 pixel filled rectangle at coordinate (10,10). 
  ctx.fillRect(10,10,100,150);

  // Draw a 100 by 150 pixel outlined rectangle at coordinate (10,10). 
  ctx.strokeRect(10,10,100,150);

  // Clear a 100 by 150 pixel rectangle at coordinate (10,10). 
  ctx.clearRect(10,10,100,150);
});