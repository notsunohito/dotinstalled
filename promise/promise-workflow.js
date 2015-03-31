function asyncFunction() {
    return new Promise(function(resolve, reject) {
        setTimeout(function() {
            resolve('Async Hello World');
        }, 1000);
    });
}

asyncFunction().then(function(value) {
    console.log(value);
    // throw new Error();
    return 100;
}).then(function(value) {
    console.log(value);
}).catch(function(error) {
    console.log('Hello' + error);
});
