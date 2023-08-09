//  Copyright (c) 2018 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Scenes/AppState/TodoAppState.dart';
import 'package:flutter_todo/Scenes/Common/StarterBloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

import '../../../../Managers/Result.dart';
import 'TodoItemRouterUseCaseOutput.dart';
import '../../TodoItemState.dart';

class TodoItemRouterUseCase with StarterBloc<TodoItemRouterUseCaseOutput> {
  final EntityGateway _entityGateway;
  final TodoAppState _appState;

  TodoItemRouterUseCase(this._entityGateway, this._appState) {
    _appState.itemState = TodoItemState();
  }

  void eventViewReady() {
    switch (_appState.itemStartMode.runtimeType) {
      case TodoItemStartModeCreate:
        _startCreate();
        break;
      case TodoItemStartModeUpdate:
        _startUpdate();
        break;
      default:
        assert(false, "startMode.runtimeType is not defined");
    }
  }

  void _startCreate() {
    emit(presentEditView());
  }

  void _startUpdate() async {
    final startMode = _appState.itemStartMode as TodoItemStartModeUpdate;

    final result = await _entityGateway.todoManager
        .fetch(_appState.toDoList[startMode.index].id);
    switch (result) {
      case success(:final data):
        _appState.itemState.currentTodo = data;
        emit(presentDisplayView());
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  void eventBack() {
    if (_appState.itemState.itemChanged) {
      _appState.itemStartMode.todoListChangedItemCallback();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
