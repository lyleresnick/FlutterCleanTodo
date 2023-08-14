import 'package:flutter_todo/Repository/Entities/Todo.dart';
import 'TodoItemStartMode.dart';

abstract class AppState {
  List<Todo>? toDoList;
  void Function(Todo)? todoListCallback;
  TodoItemStartMode? itemStartMode;
  Todo? currentTodo;
}

