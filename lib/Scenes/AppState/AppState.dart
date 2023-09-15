import 'package:flutter_todo/Repository/Entities/Todo.dart';
import 'package:rxdart/rxdart.dart';
import 'TodoItemStartMode.dart';

abstract class AppState {
  final toDoSceneRefreshSubject = PublishSubject<void>();
  final itemStartModeSubject = BehaviorSubject<TodoItemStartMode>();
  final currentTodoSubject = BehaviorSubject<Todo?>();
}

