import '../Entities/Priority.dart';
import '../Entities/Todo.dart';
import 'TodoValues.dart';

class TestTodo {

  String id;
  String title;
  String note;
  DateTime? completeBy;
  Priority priority;
  bool completed;

  TestTodo({ required this.id, required this.title, this.note = "", this.completeBy, this.priority = Priority.none, this.completed = false});

  factory TestTodo.fromTodo(todo) {
    return TestTodo(
        id: todo.id,
        title: todo.title,
        note: todo.note,
        completeBy: todo.completeBy,
        priority: todo.priority,
        completed: todo.completed
    );
  }

  factory TestTodo.fromTodoValues(String id, TodoValues values) {
    return TestTodo(
        id: id,
        title: values.title,
        note: values.note,
        completeBy: values.completeBy,
        priority: values.priority,
        completed: values.completed
    );
  }

  void setValues(TodoValues values) {
    title = values.title;
    note = values.note;
    completeBy = values.completeBy;
    priority = values.priority;
    completed = values.completed;
  }

  Todo get toTodo => Todo(
      id: this.id,
      title: this.title,
      note: this.note,
      completeBy: this.completeBy,
      priority: this.priority,
      completed: this.completed
  );
}

