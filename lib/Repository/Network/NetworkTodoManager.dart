//  Copyright © 2023 Lyle Resnick. All rights reserved.

import 'package:todo_api/api.dart';
import '../Abstraction/TodoManager.dart';
import '../Abstraction/TodoValues.dart';
import '../Abstraction/Result.dart';
import '../Entities/Todo.dart';
import '../Entities/Priority.dart';
import 'NetworkClient.dart';
import 'NetworkExceptionGuard.dart';

class NetworkTodoManager extends TodoManager with ExceptionGuard {
  final NetworkClient apiClient;
  NetworkTodoManager(this.apiClient);

  @override
  Future<Result<List<Todo>>> all() => exceptionGuard(() async {
        final response = await apiClient.getAllTodos();
        if (response == null) throw "No Content";
        return response.map((todoResponse) => todoResponse._todo).toList();
      });

  @override
  Future<Result<Todo>> completed(String id, bool completed) =>
      exceptionGuard(() async {
        final getResponse = await apiClient.getTodo(id);
        if (getResponse == null) throw "No Content";
        final values = getResponse._todo.todoValues;
        final TodoValues newValues = (
          title: values.title,
          note: values.note,
          completeBy: values.completeBy,
          priority: values.priority,
          completed: completed,
        );
        final updateResponse =
            await apiClient.updateTodo(id, newValues._todoParams);
        if (updateResponse == null) throw "No Content";
        return updateResponse._todo;
      });

  @override
  Future<Result<Todo>> create(TodoValues values) => exceptionGuard(() async {
        final response =
            await apiClient.createTodo(values._todoParams);
        if (response == null) throw "No Content";
        return response._todo;
      });

  @override
  Future<Result<Todo>> delete(String id) => exceptionGuard(() async {
        final getResponse = await apiClient.getTodo(id);
        if (getResponse == null) throw "No Content";
        await apiClient.deleteTodo(id);
        return getResponse._todo;
      });

  @override
  Future<Result<Todo>> fetch(String id) => exceptionGuard(() async {
        final response = await apiClient.getTodo(id);
        if (response == null) throw "No Content";
        return response._todo;
      });

  @override
  Future<Result<Todo>> update(String id, TodoValues values) =>
      exceptionGuard(() async {
        final response =
            await apiClient.updateTodo(id, values._todoParams);
        if (response == null) throw "No Content";
        return response._todo;
      });
}

extension on TodoValues {
  TodoParams get _todoParams {
    return TodoParams(
        title: this.title,
        note: this.note,
        priority: this.priority._priorityEnum,
        completeBy: this.completeBy,
        completed: this.completed);
  }
}

extension on Priority {
  PriorityEnum get _priorityEnum {
    return switch (this) {
      Priority.high => PriorityEnum.high,
      Priority.medium => PriorityEnum.medium,
      Priority.low => PriorityEnum.low,
      Priority.none => PriorityEnum.none
    };
  }
}

extension on TodoResponse {
  Todo get _todo {
    return (
        id: this.id,
        title: this.title,
        note: this.note ?? "",
        priority: this.priority._priority,
        completeBy: this.completeBy,
        completed: this.completed);
  }
}

extension on PriorityEnum {
  Priority get _priority {
    return switch (this) {
      PriorityEnum.high => Priority.high,
      PriorityEnum.medium => Priority.medium,
      PriorityEnum.low => Priority.low,
      PriorityEnum.none => Priority.none,
      _ => throw ("PriorityEnum must be high, medium, low or none")
    };
  }
}
