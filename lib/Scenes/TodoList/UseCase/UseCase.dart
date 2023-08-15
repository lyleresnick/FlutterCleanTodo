//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

@visibleForTesting
class UseCase with StarterBloc<_UseCaseOutput> {
  final EntityGateway _entityGateway;

  final BehaviorSubject<List<Todo>> _toDoListSubject;
  final BehaviorSubject<Todo> _toDoListCallbackSubject;
  final BehaviorSubject<TodoItemStartMode> _itemStartModeSubject;

  late StreamSubscription<Todo> subscription;

  UseCase(this._entityGateway, this._toDoListSubject,
      this._toDoListCallbackSubject, this._itemStartModeSubject) {
    unawaited(_initialize());
  }

  Future<void> _initialize() async {
    subscription = _toDoListCallbackSubject.listen(null);
    final result = await _entityGateway.todoManager.all();
    switch (result) {
      case success(:final data):
        _toDoListSubject.value = data;
        _refreshPresentation();
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  void _refreshPresentation() {
    emit(presentModel(PresentationModel.fromEntities(_toDoListSubject.value)));
  }

  Future<void> eventCompleted(bool completed, int index) async {
    final result = await _entityGateway.todoManager
        .completed(_toDoListSubject.value[index].id, completed);
    switch (result) {
      case success(:final data):
        final todoList = _toDoListSubject.value;
        todoList[index] = data;
        _toDoListSubject.value = todoList;
        _refreshPresentation();
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  Future<void> eventDelete(int index) async {
    final result = await _entityGateway.todoManager
        .delete(_toDoListSubject.value[index].id);
    switch (result) {
      case success():
        final todoList = _toDoListSubject.value;
        todoList.removeAt(index);
        _toDoListSubject.value = todoList;
        _refreshPresentation();
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  void eventItemSelected(int index) {
    subscription.onData(_updateCallback(index));
    final id = _toDoListSubject.value[index].id;
    _itemStartModeSubject.value = TodoItemStartModeUpdate(id);
    emit(presentItemDetail());
  }

  void Function(Todo) _updateCallback(int index) {
    return (todo) {
      final todoList = _toDoListSubject.value;
      todoList[index] = todo;
      _toDoListSubject.value = todoList;
      _refreshPresentation();
    };
  }

  void eventCreate() {
    subscription.onData((todo) {
      final index = _toDoListSubject.value.length; // need index of added todo
      final todoList = _toDoListSubject.value..add(todo);
      _toDoListSubject.value = todoList;
      _refreshPresentation();
      subscription.onData(_updateCallback(index));
      _itemStartModeSubject.value = TodoItemStartModeUpdate(todo.id);
    });
    _itemStartModeSubject.value = TodoItemStartModeCreate();
    emit(presentItemDetail());
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
