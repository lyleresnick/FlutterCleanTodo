import 'package:flutter_todo/Entities/Todo.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemState.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

abstract class AppState {
  late List<Todo> toDoList;
  late TodoItemStartMode itemStartMode;
  late TodoItemState itemState;
}

