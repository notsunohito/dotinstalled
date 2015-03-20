window.onload = function() {
    draw();
}

function draw() {
    var canvas = document.getElementById('mycanvas');
    if(!canvas || !canvas.getContext) return false;
    var ctx = canvas.getContext('2d');

    var img = new Image();
    img.src = './baby.jpg';
    img.onload = function() {
        ctx.drawImage(img, 0, 0);
    };
}
