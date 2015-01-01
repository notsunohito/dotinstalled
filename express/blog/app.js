var express = require('express'),
    morgan = require('morgan'),
    bodyParser = require('body-parser'),
    methodOverride = require('method-override');
    app = express(),
    post = require('./routes/post');

app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

// middleware
app.use(bodyParser());
app.use(morgan('short'));
app.use(methodOverride());

// routing
app.get('/', post.index);
app.get('/posts/:id([0-9]+)', post.show);
app.get('/posts/new', post.new);
app.post('/posts/create', post.create);
app.get('/posts/:id/edit', post.edit);
app.put('/posts/:id', post.update);
app.delete('/posts/:id', post.destroy);

app.listen(3000);
console.log("server starting...");

