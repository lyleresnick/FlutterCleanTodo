//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

@visibleForTesting
class UseCase with StarterBloc<_UseCaseOutput> {
  final EntityGateway _entityGateway;

  List<Todo> _todoList = [];
  final BehaviorSubject<Refresh> _toDoSceneRefreshSubject;
  final BehaviorSubject<TodoItemStartMode> _itemStartModeSubject;

  UseCase(this._entityGateway,
      this._toDoSceneRefreshSubject, this._itemStartModeSubject) {
    unawaited(_initialize());
  }

  Future<void> _initialize() async {
    _toDoSceneRefreshSubject.listen(_refresh);
    await _refresh(Refresh.yes);
  }

  Future<void> _refresh(_) async {
    emit(presentLoading());
    final result = await _entityGateway.todoManager.all();
    switch (result) {
      case success(:final data):
        _todoList = data;
        _refreshPresentation();
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  void _refreshPresentation() {
    emit(presentModel(PresentationModel.fromEntities(_todoList)));
  }

  Future<void> eventCompleted(bool completed, int index) async {
    final result = await _entityGateway.todoManager
        .completed(_todoList[index].id, completed);
    switch (result) {
      case success(:final data):
        _todoList[index] = data;
        _refreshPresentation();
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  Future<void> eventDelete(int index) async {
    final result = await _entityGateway.todoManager
        .delete(_todoList[index].id);
    switch (result) {
      case success():
        _todoList.removeAt(index);
        _refreshPresentation();
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  void eventItemSelected(int index) {
    final id = _todoList[index].id;
    _itemStartModeSubject.value = TodoItemStartModeUpdate(id);
    emit(presentItemDetail());
  }

  void eventCreate() {
    _itemStartModeSubject.value = TodoItemStartModeCreate();
    emit(presentItemDetail());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
