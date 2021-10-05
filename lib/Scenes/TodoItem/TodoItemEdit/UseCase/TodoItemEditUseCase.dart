//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Managers/TodoValues.dart';
import 'package:flutter_todo/Scenes/AppState/TodoAppState.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/Common/ErrorMessages.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditPresentationModel.dart';
import 'package:flutter_todo/Entities/Todo.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

import 'TodoItemEditUseCaseOutput.dart';

class EditingTodo {
  String id;
  String title;
  String note;
  DateTime completeBy;
  Priority priority;
  bool completed;

  EditingTodo(
      {this.id,
      this.title = "",
      this.note = "",
      this.completeBy,
      this.priority = Priority.none,
      this.completed = false});

  EditingTodo.fromTodo(Todo todo) {
    id = todo.id;
    title = todo.title;
    note = todo.note;
    completeBy = todo.completeBy;
    priority = todo.priority;
    completed = todo.completed;
  }
}

class TodoItemEditUseCase extends Bloc {
  final _controller = StreamController<TodoItemEditUseCaseOutput>();
  Stream<TodoItemEditUseCaseOutput> get stream => _controller.stream;

  EditingTodo _editingTodo;

  final EntityGateway _entityGateway;
  final TodoAppState _appState;

  TodoItemEditUseCase(this._entityGateway, this._appState);

  void eventViewReady() {
    if (_appState.itemStartMode is TodoItemStartModeUpdate) {
      _editingTodo = EditingTodo.fromTodo(_appState.itemState.currentTodo);
    } else {
      _editingTodo = EditingTodo();
    }
    _refreshPresentation();
  }

  _refreshPresentation({ErrorMessage errorMessage, bool showEditCompleteBy = false}) {
    _controller.sink.add(PresentModel(
        TodoItemEditPresentationModel.fromEditingTodo(_editingTodo,
            errorMessage: errorMessage, showEditCompleteBy: showEditCompleteBy)));
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
    Result result;

    if (_editingTodo.title == "") {
      _refreshPresentation(errorMessage: ErrorMessage.titleIsEmpty);
      return;
    }
    switch (_appState.itemStartMode.runtimeType) {
      case TodoItemStartModeCreate:
        result = await _entityGateway.todoManager
            .create(values: TodoValues.fromEditing(_editingTodo));
        break;
      case TodoItemStartModeUpdate:
        result = await _entityGateway.todoManager.update(
            id: _editingTodo.id, values: TodoValues.fromEditing(_editingTodo));
        break;
    }
    if (result is SuccessResult) {
      _appState.itemState.currentTodo = result.data;
      _appState.itemState.itemChanged = true;

      _controller.sink.add(PresentSaveCompleted());
    } else if (result is FailureResult)
      assert(false, "Unresolved error: ${result.description}");
    else if (result is DomainIssueResult)
      assert(false, "Unexpected Semantic error: reason ${result.reason}");
  }

  void eventCancel() {
    if (_appState.itemStartMode is TodoItemStartModeCreate)
      _controller.sink.add(PresentCreateCancelled());
    else
      _controller.sink.add(PresentEditingCancelled());
  }

  @override
  void dispose() {
    _controller.close();
  }
}
