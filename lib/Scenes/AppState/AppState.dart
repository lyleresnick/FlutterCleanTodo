import 'package:flutter_todo/Entities/Todo.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemState.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

abstract class AppState {
  List<Todo> toDoList;
  TodoItemStartMode itemStartMode;
  TodoItemState itemState;
}

