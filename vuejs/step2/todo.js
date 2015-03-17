var app = new Vue({
    el: '#todo',
    data: {
        todos: []
    },
    computed: {
        lefts: function() {
            return this.todos.filter(function(t) { return !t.isDone; }).length;
        }
    },
    created: function() {
        this.title = "My Todos";
        var suffix = ["a","b","c","d","e"];
        suffix.forEach(function() {
            this.todos.push({ isDone:false, title: "task-"+ this.todos.length });
        }, this);
    },
    methods: {
        addTodo: function() {
            this.todos.push({ isDone:false, title: "task-" + this.todos.length });
        }
    }
});
