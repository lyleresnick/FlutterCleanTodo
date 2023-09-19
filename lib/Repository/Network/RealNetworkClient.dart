//  Copyright © 2023 Lyle Resnick. All rights reserved.

import 'package:todo_api/api.dart';

import 'NetworkClient.dart';

class RealNetworkClient implements NetworkClient {
  final TodoApi _todoApi;

  RealNetworkClient(): _todoApi = TodoApi(ApiClient());

  @override
  Future<TodoResponse?> createTodo(TodoParams params) => _todoApi.createTodo(params);

  @override
  Future<void> deleteTodo(String id) => _todoApi.deleteTodo(id);

  @override
  Future<List<TodoResponse>?> getAllTodos() => _todoApi.getAllTodos();

  @override
  Future<TodoResponse?> getTodo(String id) => _todoApi.getTodoById(id);

  @override
  Future<TodoResponse?> updateTodo(String id, TodoParams params)  => _todoApi.updateTodo(id, params);
}
