//  Copyright (c) 2018 Lyle Resnick. All rights reserved.

part of '../TodoItemRouter.dart';

class UseCase with StarterBloc<UseCaseOutput> {
  final EntityGateway _entityGateway;
  final TodoAppState _appState;

  UseCase(this._entityGateway, this._appState) {
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
