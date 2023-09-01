//  Copyright © 2023 Lyle Resnick. All rights reserved.

import '../Abstraction/TodoManager.dart';
import '../Abstraction/TodoValues.dart';
import '../Abstraction/Result.dart';
import '../Entities/Todo.dart';
import 'NetworkClient.dart';
import 'NetworkExceptionGuard.dart';

class NetworkTodoManager extends TodoManager with ExceptionGuard {
  final NetworkClient networkClient;
  NetworkTodoManager(this.networkClient);

  @override
  Future<Result<List<Todo>>> all() => exceptionGuard(() async {
        final response = await networkClient.todoApi.getAllTodos();
        if (response == null) throw "No Content";
        return response.map((todo) => Todo.fromTodoResponse(todo)).toList();
      });

  @override
  Future<Result<Todo>> completed(String id, bool completed) =>
      exceptionGuard(() async {
        final getResponse = await networkClient.todoApi.getTodoById(id);
        if (getResponse == null) throw "No Content";
        final values = Todo.fromTodoResponse(getResponse).toTodoValues();
        final newValues = TodoValues(
          title: values.title,
          note: values.note,
          completeBy: values.completeBy,
          priority: values.priority,
          completed: completed,
        );
        final response =
            await networkClient.todoApi.updateTodo(id, newValues.toTodoParams());
        if (response == null) throw "No Content";
        return Todo.fromTodoResponse(response);
      });

  @override
  Future<Result<Todo>> create(TodoValues values) => exceptionGuard(() async {
        final response =
            await networkClient.todoApi.createTodo(values.toTodoParams());
        if (response == null) throw "No Content";
        return Todo.fromTodoResponse(response);
      });

  @override
  Future<Result<Todo>> delete(String id) => exceptionGuard(() async {
        final getResponse = await networkClient.todoApi.getTodoById(id);
        if (getResponse == null) throw "No Content";
        await networkClient.todoApi.deleteTodo(id);
        return Todo.fromTodoResponse(getResponse);
      });

  @override
  Future<Result<Todo>> fetch(String id) => exceptionGuard(() async {
        final response = await networkClient.todoApi.getTodoById(id);
        if (response == null) throw "No Content";
        return Todo.fromTodoResponse(response);
      });

  @override
  Future<Result<Todo>> update(String id, TodoValues values) =>
      exceptionGuard(() async {
        final response =
            await networkClient.todoApi.updateTodo(id, values.toTodoParams());
        if (response == null) throw "No Content";
        return Todo.fromTodoResponse(response);
      });
}
