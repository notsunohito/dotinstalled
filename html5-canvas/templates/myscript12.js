window.onload = function() {
    draw();
}

function draw() {
    var canvas = document.getElementById('mycanvas');
    if(!canvas || !canvas.getContext) return false;
    var ctx = canvas.getContext('2d');

    ctx.globalAlpha = 0.5;

    for(var i=0; i<100; i++) {
        var x = Math.floor(Math.random() * 400);
        var y = Math.floor(Math.random() * 200);
        var r = Math.floor(Math.random() * 200);

        ctx.fillStyle = "rgb("+ rgb() +","+ rgb() +","+ rgb()+")";
        ctx.beginPath();
        ctx.arc(x, y, r, 0, 2*Math.PI);
        ctx.stroke();
        ctx.fill();
    }

    function rgb() {
        return Math.floor(Math.random() * 255);
    }
}

