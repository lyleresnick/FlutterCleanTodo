import 'package:flutter_todo/Repository/Entities/Todo.dart';
import 'package:rxdart/rxdart.dart';
import 'TodoItemStartMode.dart';

enum Refresh {
  yes
}

abstract class AppState {
  final toDoSceneRefreshSubject = BehaviorSubject<Refresh>();
  final itemStartModeSubject = BehaviorSubject<TodoItemStartMode>();
  final currentTodoSubject = BehaviorSubject<Todo?>();
}

