import 'package:flutter_todo/Repository/Entities/Todo.dart';
import 'TodoItemStartMode.dart';

abstract class AppState {
  List<Todo>? toDoList;
  TodoItemStartMode? itemStartMode;
  Todo? currentTodo;
}

