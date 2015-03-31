var Promise = require('bluebird');

function taskA() {
    console.log("Task A");
}

function taskB() {
    console.log("Task B");
    // throw new Error();
}

function onRejected(error) {
    console.log("Catch Error: A or B", error);
}

function finalTask() {
    console.log("Final Task");
}

var promise = Promise.resolve();
promise
    .then(taskA)
    .then(taskB)
    .catch(onRejected)
    .then(finalTask);
