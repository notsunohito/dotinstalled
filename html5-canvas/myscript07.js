window.onload = function() {
    draw();
}

function draw() {
    var canvas = document.getElementById('mycanvas');
    if(!canvas || !canvas.getContext) return false;
    var ctx = canvas.getContext('2d');

    ctx.beginPath();
    ctx.arc(100, 100, 50, 0/180*Math.PI, 270/180*Math.PI);
    ctx.lineWidth = 15;
    ctx.lineCap = "round"; // "butt", "square"
    ctx.stroke();
    // ctx.fill();
}
