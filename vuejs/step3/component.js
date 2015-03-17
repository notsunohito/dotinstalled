Vue.component("header-template", {
    template: "#headerTemplate",
    methods: {
        hello: function(e) {
            alert("hello!");
        }
    }
});

Vue.component("item-template", {
    template: "{{u.user_id}}:{{u.name}}"
});

var app = new Vue({
    el: "#app",
    data: {
        user: [ {user_id:"1",name:"hage man"}, {user_id:"2", name:"hoge girl"}]
    }
});
