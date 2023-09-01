//  Copyright (c) 2018 Lyle Resnick. All rights reserved.

part of '../TodoItemRouter.dart';

class UseCase with StarterBloc<_UseCaseOutput> {
  final EntityGateway _entityGateway;

  final TodoItemStartMode _itemStartMode;
  final BehaviorSubject<Todo?> _currentTodoSubject;

  UseCase(this._entityGateway, this._itemStartMode, this._currentTodoSubject) {
    switch (_itemStartMode) {
      case TodoItemStartModeCreate():
        _startCreate();
      case TodoItemStartModeUpdate(:final itemId):
        _startUpdate(itemId);
    }
  }

  void _startCreate() {
    _currentTodoSubject.value = null;
    emit(presentEditView());
  }

  Future<void> _startUpdate(String itemId) async {
    emit(presentLoading());
    final result = await _entityGateway.todoManager.fetch(itemId);
    switch (result) {
      case success(:final data):
        _currentTodoSubject.value = data;
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
