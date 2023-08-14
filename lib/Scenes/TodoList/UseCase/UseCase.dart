//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

@visibleForTesting
class UseCase with StarterBloc<_UseCaseOutput> {
  final EntityGateway _entityGateway;
  final TodoAppState _appState;

  UseCase(this._entityGateway, this._appState) {
    unawaited(_initialize());
  }

  Future<void> _initialize() async {
    final result = await _entityGateway.todoManager.all();
    switch (result) {
      case success(:final data):
        _appState.toDoList = data;
        _refreshPresentation();
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  void _refreshPresentation() {
    emit(presentModel(PresentationModel.fromEntities(_appState.toDoList!)));
  }

  Future<void> eventCompleted(bool completed, int index) async {
    final result = await _entityGateway.todoManager
        .completed(_appState.toDoList![index].id, completed);
    switch (result) {
      case success(:final data):
        _appState.toDoList![index] = data;
        _refreshPresentation();
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  Future<void> eventDelete(int index) async {
    final result =
        await _entityGateway.todoManager.delete(_appState.toDoList![index].id);
    switch (result) {
      case success():
        _appState.toDoList!.removeAt(index);
        _refreshPresentation();
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  void eventItemSelected(int index) {
    _appState.todoListCallback = _makeUpdateCallback(index);
    final id = _appState.toDoList![index].id;
    _appState.itemStartMode = TodoItemStartModeUpdate(id);
    emit(presentItemDetail());
  }

  void Function(Todo) _makeUpdateCallback(int index) {
    return (todo) {
      _appState.toDoList![index] = todo;
      _refreshPresentation();
    };
  }

  void eventCreate() {
    _appState.todoListCallback = (todo) {
      final index = _appState.toDoList!.length; // need index of added todo
      _appState.toDoList!.add(todo);
      _refreshPresentation();
      _appState.todoListCallback = _makeUpdateCallback(index);
      _appState.itemStartMode = TodoItemStartModeUpdate(todo.id);
    };
    _appState.itemStartMode = TodoItemStartModeCreate();
    emit(presentItemDetail());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
