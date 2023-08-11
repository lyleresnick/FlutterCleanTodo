import 'package:flutter_todo/Repository/Entities/Todo.dart';
import 'TodoItemState.dart';
import 'TodoItemStartMode.dart';

abstract class AppState {
  late List<Todo> toDoList;
  late TodoItemStartMode itemStartMode;
  late TodoItemState itemState;
}

