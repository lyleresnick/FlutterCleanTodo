//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Scenes/AppState/AppState.dart';
import 'package:flutter_todo/Scenes/Common/ErrorMessages.dart';
import 'package:flutter_todo/Scenes/Common/StarterBloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditPresentationModel.dart';
import 'package:flutter_todo/Entities/Todo.dart';

import 'TodoItemEditUseCaseOutput.dart';

class EditingTodo {
  String? id;
  String title;
  String note;
  DateTime? completeBy;
  Priority priority;
  bool completed;

  EditingTodo(
      {this.id,
      this.title = "",
      this.note = "",
      this.completeBy,
      this.priority = Priority.none,
      this.completed = false});

  factory EditingTodo.fromTodo(Todo todo) {
    return EditingTodo(
        id: todo.id,
        title: todo.title,
        note: todo.note,
        completeBy: todo.completeBy,
        priority: todo.priority,
        completed: todo.completed);
  }
}

abstract class TodoItemEditUseCase with StarterBloc<TodoItemEditUseCaseOutput> {
  late EditingTodo _editingTodo;

  final AppState _appState;

  TodoItemEditUseCase(this._appState);

  EditingTodo getInitialEditingTodo();
  Future<Result<Todo>> save(EditingTodo editingTodo);
  void copyTodoToList(Todo todo);
  void cancel();

  void eventViewReady() {
    _editingTodo = getInitialEditingTodo();
    _refreshPresentation();
  }

  _refreshPresentation(
      {ErrorMessage? errorMessage, bool showEditCompleteBy = false}) {
    emit(presentModel(TodoItemEditPresentationModel.fromEditingTodo(
        _editingTodo,
        errorMessage: errorMessage,
        showEditCompleteBy: showEditCompleteBy)));
  }

  void eventEditedTitle(String title) {
    _editingTodo.title = title;
  }

  void eventEditedNote(String note) {
    _editingTodo.note = note;
  }

  void eventCompleteByClear() {
    _editingTodo.completeBy = null;
    _refreshPresentation();
  }

  void eventCompleteByToday() {
    _editingTodo.completeBy = DateTime.now();
    _refreshPresentation();
  }

  void eventEnableEditCompleteBy() {
    _refreshPresentation(showEditCompleteBy: true);
  }

  void eventEditedCompleteBy(DateTime completeBy) {
    _editingTodo.completeBy = completeBy;
    _refreshPresentation();
  }

  void eventCompleted(bool completed) {
    _editingTodo.completed = completed;
  }

  void eventEditedPriority(Priority priority) {
    _editingTodo.priority = priority;
  }

  void eventSave() async {
    if (_editingTodo.title == "") {
      _refreshPresentation(errorMessage: ErrorMessage.titleIsEmpty);
      return;
    }
    final result = await save(_editingTodo);
    switch (result) {
      case success(:final data):
        _appState.itemState.currentTodo = data;
        copyTodoToList(data);
        _appState.itemState.itemChanged = true;
        emit(presentSaveCompleted());
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  void eventCancel() {
    cancel();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
