window.onload = function() {
    draw();
}

function draw() {
    var canvas = document.getElementById('mycanvas');
    if(!canvas || !canvas.getContext) return false;
    var ctx = canvas.getContext('2d');

    // var g = ctx.createLinearGradient(0, 0, 100, 100);
    var g = ctx.createRadialGradient(50, 50, 20, 50, 50, 60);

    g.addColorStop(0.0, "red");
    g.addColorStop(0.5, "yellow");
    g.addColorStop(1.0, "blue");

    ctx.fillStyle = g;

    ctx.fillRect(0, 0, 100, 100);
}
