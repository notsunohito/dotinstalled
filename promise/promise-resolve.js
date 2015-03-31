var Promise = require('bluebird');

Promise.resolve(42).then(function(value) {
    console.log(value);
});
