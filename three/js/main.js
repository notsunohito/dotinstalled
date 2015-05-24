(function() {

var width = 500,
    height = 300,
    cube = [],
    count = 10,
    i,
    cubeSize;

// scene
var scene = new THREE.Scene();

// mesh
for(i=0; i<count; i++) {
    cubeSize = r(50);
    var geometry = new THREE.BoxGeometry(cubeSize, cubeSize, cubeSize);
    // var material = new THREE.MeshBasicMaterial({ color: "red" });
    var material = new THREE.MeshLambertMaterial({ color: 'rgb('+r(255)+','+r(255)+','+r(255)+')' });
    cube[i] = new THREE.Mesh(geometry, material);
    cube[i].castShadow = true;
    cube[i].position.set(0, 50+r(200), 0); // ratate, scale
    scene.add(cube[i]);
}

// var sGeometry = new THREE.SphereGeometry(30);
// var sMaterial = new THREE.MeshLambertMaterial({ color: 0x121212 });
// var sphere = new THREE.Mesh(sGeometry, sMaterial);
// sphere.position.set(100, 100, 100); // ratate, scale
// scene.add(sphere);

var pGeometry = new THREE.PlaneGeometry(300, 300);
var pMaterial = new THREE.MeshLambertMaterial({ color: 0x0096d6, side: THREE.DoubleSide });
var plane = new THREE.Mesh(pGeometry, pMaterial);
plane.receiveShadow = true;
plane.position.set(0, 0, 0); // ratate, scale
plane.rotation.x = 90 * Math.PI /180;
scene.add(plane);


// light
var light = new THREE.DirectionalLight(0xffffff, 1);
light.position.set(0, 100, 30);
light.castShadow = true;
scene.add(light);
var ambient = new THREE.AmbientLight(0x550000);
scene.add(ambient);

// camera
var camera = new THREE.PerspectiveCamera(45, width / height, 1, 1000);
// camera.position.set(0, 0, 0);
// camera.position.x = 0;
// camera.position = new THREE.Vector3(0, 0, 0);
camera.position.set(200, 300, 500);
// camera.lookAt(cube.position);

/// helper
var axis = new THREE.AxisHelper(1000);
axis.position.set(0, 0, 0);
scene.add(axis);

// rendering
var renderer = new THREE.CanvasRenderer();
renderer.setSize(width, height);
renderer.setClearColor(0xeeeeee, 1);
renderer.shadowMapEnabled = true;
document.getElementById('stage').appendChild(renderer.domElement);

// control
var controls = new THREE.OrbitControls(camera, renderer.domElement);

function render() {
    requestAnimationFrame(render);
    for(i=0; i<count; i++) {
        cube[i].rotation.x += i * Math.PI / 180;
        cube[i].rotation.y += i * Math.PI / 180;
        cube[i].rotation.z += i * Math.PI / 180;
        cube[i].position.x = Math.sin(new Date().getTime() / (200+i)) * 100;
        cube[i].position.z = Math.cos(new Date().getTime() / (200+i)) * 100;
    }
    renderer.render(scene, camera);
    controls.update();
}
render();
function r(n) {
    return Math.floor(Math.random() * (n + 1));
}

renderer.render(scene, camera);


})();
