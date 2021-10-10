//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Scenes/AppState/TodoAppState.dart';
import 'package:flutter_todo/Scenes/Common/StarterBloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

import 'TodoListPresentationRowModel.dart';
import 'TodoListUseCaseOutput.dart';

class TodoListUseCase with StarterBloc<TodoListUseCaseOutput> {
  final EntityGateway _entityGateway;
  final TodoAppState _appState;

  TodoListUseCase(this._entityGateway, this._appState);

  void eventViewReady() async {
    final result = await _entityGateway.todoManager.all();
    result.when(success: (todoList) {
      _appState.toDoList = todoList;
      _refreshPresentation();
    }, failure: (code, description) {
      assert(false, "Unresolved error: $description");
    }, domainIssue: (reason) {
      assert(false, "Unexpected Semantic error: reason $reason");
    });
  }

  void _refreshPresentation() {
    streamAdd(PresentModel(_appState.toDoList
        .map((entity) => TodoListPresentationRowModel(entity))
        .toList()));
  }

  void eventCompleted(bool completed, int index) async {
    final result = await _entityGateway.todoManager
        .completed(_appState.toDoList[index].id, completed);
    result.when(success: (todo) {
      _appState.toDoList[index] = todo;
      _refreshPresentation();
    }, failure: (code, description) {
      assert(false, "Unresolved error: $description");
    }, domainIssue: (reason) {
      assert(false, "Unexpected Semantic error: reason $reason");
    });
  }

  void eventDelete(int index) async {
    final result =
        await _entityGateway.todoManager.delete(_appState.toDoList[index].id);
    result.when(success: (todo) {
      _appState.toDoList.removeAt(index);
      _refreshPresentation();
    }, failure: (code, description) {
      assert(false, "Unresolved error: $description");
    }, domainIssue: (reason) {
      assert(false, "Unexpected Semantic error: reason $reason");
    });
  }

  void eventItemSelected(int index) {
    _appState.itemStartMode =
        TodoItemStartModeUpdate(index, _refreshPresentation);
    streamAdd(PresentItemDetail());
  }

  void eventCreate() {
    _appState.itemStartMode = TodoItemStartModeCreate(_refreshPresentation);
    streamAdd(PresentItemDetail());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
