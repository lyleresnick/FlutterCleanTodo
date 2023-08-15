import 'package:flutter_todo/Repository/Entities/Todo.dart';
import 'package:rxdart/rxdart.dart';
import 'TodoItemStartMode.dart';

abstract class AppState {
  final toDoListSubject = BehaviorSubject<List<Todo>>();
  final toDoListCallbackSubject = BehaviorSubject<Todo>();
  final itemStartModeSubject = BehaviorSubject<TodoItemStartMode>();
  final currentTodoSubject = BehaviorSubject<Todo?>.seeded(null);
}

