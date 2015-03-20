window.onload = function() {
    draw();
}

function draw() {
    var canvas = document.getElementById('mycanvas');
    if(!canvas || !canvas.getContext) return false;
    var ctx = canvas.getContext('2d');

    ctx.shadowColor = "#ccc";
    ctx.shadowOffsetX = 5;
    ctx.shadowOffsetY = 5;
    ctx.shadowBlur = 5;

    ctx.globalAlpha = 0.5;

    ctx.fillRect(0, 0, 100, 100);
}
