window.onload = function() {
    draw();
}

function draw() {
    var canvas = document.getElementById('mycanvas');
    if(!canvas || !canvas.getContext) return false;
    var ctx = canvas.getContext('2d');

    ctx.strokeStyle = "rgba(255, 0, 0, 0.5)";
    ctx.lineWidth = 15;
    ctx.lineJoin = "round";//"bevel", "miter"
    
    ctx.fillStyle = "rgba(255, 0, 0, 0.5)";
    ctx.strokeRect(10, 10, 50, 50);
    ctx.fillRect(100, 10, 50, 50);
}
