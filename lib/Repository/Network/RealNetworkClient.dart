//  Copyright © 2023 Lyle Resnick. All rights reserved.

import 'package:todo_api/api.dart';

import 'NetworkClient.dart';

class RealNetworkClient implements NetworkClient {
  final TodoApi _todoApi;
  TodoApi get todoApi => _todoApi;

  RealNetworkClient(): _todoApi = TodoApi(ApiClient());

  @override
  Future<TodoResponse?> createTodo(TodoParams params) => todoApi.createTodo(params);

  @override
  Future<void> deleteTodo(String id) => todoApi.deleteTodo(id);

  @override
  Future<List<TodoResponse>?> getAllTodos() => todoApi.getAllTodos();

  @override
  Future<TodoResponse?> getTodo(String id) => todoApi.getTodoById(id);

  @override
  Future<TodoResponse?> updateTodo(String id, TodoParams params)  => todoApi.updateTodo(id, params);
}