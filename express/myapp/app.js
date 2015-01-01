var express = require('express'),
    morgan = require('morgan'),
    bodyParser = require('body-parser'),
    app = express();



app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

app.use(bodyParser());
app.use(morgan('short'));
app.use(express.static(__dirname + '/public'));

app.param('id', function(req, res, next, id) {
    var users = ['notsu', 'san', 'desu'];
    req.params.name = users[id];
    next();
});

app.get('/', function(req, res) {
    res.render('index', { title: 'titile です！'});
});

app.get('/hello/:id', function(req, res) {
    res.send('hello ' + req.params.name);
});

app.get('/new', function(req, res) {
    res.render('new');
});

app.post('/create', function(req, res) {
    res.send(req.body.name);
});

app.listen(3000);
console.log("server starting...");

