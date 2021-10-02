//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Scenes/AppState/TodoAppState.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditPresentationModel.dart';
import 'package:flutter_todo/Entities/Todo.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

import 'TodoItemEditUseCaseSaveTransformer.dart';
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
    if (_appState.itemStartMode is TodoItemStartModeUpdate ) {
      _controller.sink.add(PresentModel(
          TodoItemEditPresentationModel.fromEntity(
              _appState.itemState.currentTodo)));
      _editingTodo = EditingTodo.fromTodo(_appState.itemState.currentTodo);
    }
    else {
        _editingTodo = EditingTodo();
        _controller.sink.add(PresentModel(
            TodoItemEditPresentationModel.fromEditingTodo(_editingTodo)));
    }
  }

  void eventEditedTitle(String title) {
    _editingTodo.title = title;
  }

  void eventEditedNote(String note) {
    _editingTodo.note = note;
  }

  void eventCompleteByClear() {
    _editingTodo.completeBy = null;
    _controller.sink.add(PresentModel(
        TodoItemEditPresentationModel.fromEditingTodo(_editingTodo)));
  }

  void eventCompleteByToday() {
    _editingTodo.completeBy = DateTime.now();
    _controller.sink.add(PresentModel(
        TodoItemEditPresentationModel.fromEditingTodo(_editingTodo)));
  }

  void eventEnableEditCompleteBy() {
    _controller.sink.add(PresentEnableEditCompleteBy(_editingTodo.completeBy));
  }

  void eventEditedCompleteBy(DateTime completeBy) {
    _editingTodo.completeBy = completeBy;
    _controller.sink.add(PresentModel(
        TodoItemEditPresentationModel.fromEditingTodo(_editingTodo)));
  }

  void eventCompleted(bool completed) {
    _editingTodo.completed = completed;
  }

  void eventEditedPriority(Priority priority) {
    _editingTodo.priority = priority;
  }

  void eventSave() {
    final transformer = TodoItemEditUseCaseSaveTransformer(_entityGateway.todoManager, _appState);
    transformer.transform(_editingTodo, _controller.sink);
  }

  void eventCancel() {
    if(_appState.itemStartMode is TodoItemStartModeCreate)
      _controller.sink.add(PresentCreateCancelled());
    else
      _controller.sink.add(PresentEditingCancelled());
    }

  @override
  void dispose() {
    _controller.close();
  }
}
