//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../Abstraction/TodoValues.dart';
import '../Entities/Priority.dart';
import '../Entities/Todo.dart';

class EphemeralTodo {

  String id;
  String title;
  String note;
  DateTime? completeBy;
  Priority priority;
  bool completed;

  EphemeralTodo({ required this.id, required this.title, this.note = "", this.completeBy, this.priority = Priority.none, this.completed = false});

  factory EphemeralTodo.fromTodo(todo) {
    return EphemeralTodo(
        id: todo.id,
        title: todo.title,
        note: todo.note,
        completeBy: todo.completeBy,
        priority: todo.priority,
        completed: todo.completed
    );
  }

  factory EphemeralTodo.fromTodoValues(String id, TodoValues values) {
    return EphemeralTodo(
        id: id,
        title: values.title,
        note: values.note,
        completeBy: values.completeBy,
        priority: values.priority,
        completed: values.completed
    );
  }

  void fromValues(TodoValues values) {
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

