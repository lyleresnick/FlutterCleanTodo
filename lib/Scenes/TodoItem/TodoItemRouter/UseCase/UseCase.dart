//  Copyright (c) 2018 Lyle Resnick. All rights reserved.

part of '../TodoItemRouter.dart';

class UseCase with StarterBloc<UseCaseOutput> {
  final EntityGateway _entityGateway;
  final TodoAppState _appState;

  UseCase(this._entityGateway, this._appState) {
    _appState.itemState = TodoItemState();
    switch (_appState.itemStartMode.runtimeType) {
      case TodoItemStartModeCreate:
        _startCreate();
      case TodoItemStartModeUpdate:
        _startUpdate();
    }
  }

  void _startCreate() {
    emit(presentEditView());
  }

  Future<void> _startUpdate() async {
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
