//  Copyright (c) 2018 Lyle Resnick. All rights reserved.

part of '../TodoItemRouter.dart';

class UseCase with StarterBloc<_UseCaseOutput> {
  final EntityGateway _entityGateway;
  final TodoAppState _appState;

  UseCase(this._entityGateway, this._appState) {
    switch (_appState.itemStartMode!) {
      case TodoItemStartModeCreate():
        _startCreate();
      case TodoItemStartModeUpdate(:final itemId):
        _startUpdate(itemId);
    }
  }

  void _startCreate() {
    _appState.currentTodo = null;
    emit(presentEditView());
  }

  Future<void> _startUpdate(String itemId) async {
    final result = await _entityGateway.todoManager.fetch(itemId);
    switch (result) {
      case success(:final data):
        _appState.currentTodo = data;
        emit(presentDisplayView());
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
