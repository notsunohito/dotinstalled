window.onload = function() {
    draw();
}

function draw() {
    var canvas = document.getElementById('mycanvas');
    if(!canvas || !canvas.getContext) return false;
    var ctx = canvas.getContext('2d');

    ctx.fillStyle = "yellow";
    ctx.save();

    ctx.fillRect(0, 0, 50, 50);

    ctx.fillStyle = "blue";
    ctx.fillRect(100, 0, 50, 50);

    ctx.restore();
    ctx.fillRect(200, 0, 50, 50);
}
