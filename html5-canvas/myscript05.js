window.onload = function() {
    draw();
}

function draw() {
    var canvas = document.getElementById('mycanvas');
    if(!canvas || !canvas.getContext) return false;
    var ctx = canvas.getContext('2d');

    ctx.scale(0.8, 0.8);
    ctx.rotate(30/180*Math.PI);
    ctx.translate(100, 10);

    ctx.fillRect(0, 0, 100, 100);
}
