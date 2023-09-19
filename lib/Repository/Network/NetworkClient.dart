
import 'package:todo_api/api.dart';

abstract interface class NetworkClient {
  Future<List<TodoResponse>?> getAllTodos();
  Future<TodoResponse?> getTodo(String id);
  Future<TodoResponse?> createTodo(TodoParams params);
  Future<TodoResponse?> updateTodo(String id, TodoParams params);
  Future<void> deleteTodo(String id);

}


