window.onload = function() {
    draw();
}

function draw() {
    var canvas = document.getElementById('mycanvas');
    if(!canvas || !canvas.getContext) return false;
    var ctx = canvas.getContext('2d');

    ctx.fillStyle = "red";
    var y = 0;

    (function loop() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        if(y>canvas.height) y = 0;
        y++;
        ctx.fillRect(0, y, 50, 50);
        setTimeout(loop, 10);
    })();
}
