window.onload = function() {
    draw();
}

function draw() {
    var canvas = document.getElementById('mycanvas');
    if(!canvas || !canvas.getContext) return false;
    var ctx = canvas.getContext('2d');

    ctx.font = 'bold 20px Verdana';
    ctx.textAlign = 'left'; // right, center, start, end
    ctx.fillStyle = 'red';
    ctx.strokeStyle = 'pink';

    ctx.fillText('dotinstall', 20, 20, 200);
    ctx.strokeText('dotinstall', 20, 120, 200);
}
