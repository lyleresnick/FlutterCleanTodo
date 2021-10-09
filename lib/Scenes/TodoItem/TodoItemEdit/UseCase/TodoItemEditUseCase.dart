//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Managers/TodoValues.dart';
import 'package:flutter_todo/Scenes/AppState/TodoAppState.dart';
import 'package:flutter_todo/Scenes/Common/ErrorMessages.dart';
import 'package:flutter_todo/Scenes/Common/StarterBloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditPresentationModel.dart';
import 'package:flutter_todo/Entities/Todo.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

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
      completed: todo.completed
    );
  }
}

class TodoItemEditUseCase with StarterBloc<TodoItemEditUseCaseOutput> {

  late EditingTodo _editingTodo;

  late final EntityGateway _entityGateway;
  late final TodoAppState _appState;

  TodoItemEditUseCase(this._entityGateway, this._appState);

  void eventViewReady() {
    if (_appState.itemStartMode is TodoItemStartModeUpdate) {
      _editingTodo = EditingTodo.fromTodo(_appState.itemState.currentTodo);
    } else {
      _editingTodo = EditingTodo();
    }
    _refreshPresentation();
  }

  _refreshPresentation({ErrorMessage? errorMessage, bool showEditCompleteBy = false}) {
    streamAdd(PresentModel(
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

    if (_editingTodo.title == "") {
      _refreshPresentation(errorMessage: ErrorMessage.titleIsEmpty);
      return;
    }
    late Result result;
    switch (_appState.itemStartMode.runtimeType) {
      case TodoItemStartModeCreate:
        result = await _entityGateway.todoManager
            .create(TodoValues.fromEditing(_editingTodo));
        break;
      case TodoItemStartModeUpdate:
        result = await _entityGateway.todoManager.update( _editingTodo.id!, TodoValues.fromEditing(_editingTodo));
        break;
    }
    if (result is SuccessResult) {
      final todo = result.data as Todo;
      _appState.itemState.currentTodo = todo;
      switch (_appState.itemStartMode.runtimeType) {
        case TodoItemStartModeCreate:
          _appState.toDoList.add(todo);
          break;
        case TodoItemStartModeUpdate:
          _appState.toDoList[
            (_appState.itemStartMode as TodoItemStartModeUpdate).index] = todo;
          break;
      }
      _appState.itemState.itemChanged = true;
      streamAdd(PresentSaveCompleted());
    } else if (result is FailureResult)
      assert(false, "Unresolved error: ${result.description}");
    else if (result is DomainIssueResult)
      assert(false, "Unexpected Semantic error: reason ${result.reason}");
  }

  void eventCancel() {
    if (_appState.itemStartMode is TodoItemStartModeCreate)
      streamAdd(PresentCreateCancelled());
    else
      streamAdd(PresentEditingCancelled());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
