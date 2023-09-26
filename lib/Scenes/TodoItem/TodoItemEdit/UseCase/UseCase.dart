//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemEdit.dart';

class EditingTodo {
  String? id;
  String title;
  String note;
  DateTime? completeBy;
  Priority priority;
  bool completed;

  EditingTodo(
      {this.id,
      this.title = "",
      this.note = "",
      this.completeBy,
      this.priority = Priority.none,
      this.completed = false});

  factory EditingTodo.fromTodo(Todo todo) {
    return EditingTodo(
        id: todo.id,
        title: todo.title,
        note: todo.note,
        completeBy: todo.completeBy,
        priority: todo.priority,
        completed: todo.completed);
  }

  TodoValues toTodoValues() {
    return TodoValues(
      title: this.title,
      note: this.note,
      completeBy: this.completeBy,
      priority: this.priority,
      completed: this.completed,
    );
  }
}

@visibleForTesting
class UseCase with StarterBloc<_UseCaseOutput> {
  late EditingTodo _editingTodo;

  final PublishSubject<void> _toDoSceneRefreshSubject;
  final BehaviorSubject<Todo?> _currentTodoSubject;
  final BehaviorSubject<TodoItemStartMode> _itemStartModeSubject;
  late final _UseCaseDelegate _useCaseDelegate;

  UseCase(EntityGateway entityGateway, this._toDoSceneRefreshSubject,
      this._currentTodoSubject, this._itemStartModeSubject) {
    switch (TodoAppState.instance.itemStartModeSubject.value) {
      case TodoItemStartModeCreate():
        _useCaseDelegate = _CreateUseCaseDelegate(this, entityGateway);
      case TodoItemStartModeUpdate():
        _useCaseDelegate =
            _UpdateUseCaseDelegate(this, entityGateway, _currentTodoSubject);
    }

    _editingTodo = _useCaseDelegate.initialEditingTodo;
    _refreshPresentation();
  }

  void _refreshPresentation(
      {ErrorMessage? errorMessage,
      bool showEditCompleteBy = false,
      bool isWaiting = false}) {
    emit(presentModel(PresentationModel.fromEditingTodo(_editingTodo,
        errorMessage: errorMessage,
        showEditCompleteBy: showEditCompleteBy,
        isWaiting: isWaiting)));
  }

  void eventEditedTitle(String title) {
    _editingTodo.title = title;
  }

  void eventEditedNote(String note) {
    _editingTodo.note = note;
  }

  void eventCompleteBy(bool isOn) {
    if (isOn)
      _editingTodo.completeBy = DateTime.now();
    else
      _editingTodo.completeBy = null;
    _refreshPresentation();
  }

  void eventEnableEditCompleteBy() {
    _refreshPresentation(showEditCompleteBy: true);
  }

  void eventEditedCompleteBy(DateTime completeBy) {
    _editingTodo.completeBy = completeBy;
    _refreshPresentation();
  }

  void eventCompleted(bool completed) {
    _editingTodo.completed = completed;
  }

  void eventEditedPriority(Priority priority) {
    _editingTodo.priority = priority;
  }

  Future<void> eventSave() async {
    if (_editingTodo.title == "") {
      _refreshPresentation(errorMessage: ErrorMessage.titleIsEmpty);
      return;
    }
    _refreshPresentation(isWaiting: true);
    await Future.delayed(Duration(milliseconds: 500));
    final result = await _useCaseDelegate.save(_editingTodo);
    switch (result) {
      case success(:final data):
        _currentTodoSubject.value = data;
        _toDoSceneRefreshSubject.add(null);
        _itemStartModeSubject.value = TodoItemStartModeUpdate(data.id);
        emit(presentSaveCompleted());
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  void eventCancel() {
    _useCaseDelegate.cancel();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

abstract interface class _UseCaseDelegate {
  final EntityGateway _entityGateway;
  final UseCase _useCase;
  _UseCaseDelegate(this._useCase, this._entityGateway);
  EditingTodo get initialEditingTodo;
  Future<Result<Todo>> save(EditingTodo editingTodo);
  void cancel();
}

class _CreateUseCaseDelegate extends _UseCaseDelegate {
  _CreateUseCaseDelegate(super._useCase, super._entityGateway);

  @override
  EditingTodo get initialEditingTodo => EditingTodo();

  @override
  Future<Result<Todo>> save(EditingTodo editingTodo) {
    return _entityGateway.todoManager.create(editingTodo.toTodoValues());
  }

  @override
  void cancel() {
    _useCase.emit(presentCreateCancelled());
  }
}

class _UpdateUseCaseDelegate extends _UseCaseDelegate {
  final BehaviorSubject<Todo?> _currentTodoSubject;

  _UpdateUseCaseDelegate(super._useCase,
      super._entityGateway, this._currentTodoSubject);

  @override
  EditingTodo get initialEditingTodo =>
      EditingTodo.fromTodo(_currentTodoSubject.value!);

  @override
  Future<Result<Todo>> save(EditingTodo editingTodo) {
    return _entityGateway.todoManager
        .update(editingTodo.id!, editingTodo.toTodoValues());
  }

  @override
  void cancel() {
    _useCase.emit(presentEditingCancelled());
  }
}
