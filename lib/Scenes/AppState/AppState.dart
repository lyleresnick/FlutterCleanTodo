import 'package:flutter_todo/Repository/Entities/Todo.dart';
import 'TodoItemState.dart';
import 'TodoItemStartMode.dart';

abstract class AppState {
  List<Todo>? toDoList;
  TodoItemStartMode? itemStartMode;
  final itemState =  TodoItemState();
}

