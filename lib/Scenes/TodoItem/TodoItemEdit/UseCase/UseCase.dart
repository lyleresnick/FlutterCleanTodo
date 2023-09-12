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

abstract class UseCase with StarterBloc<_UseCaseOutput> {
  late EditingTodo _editingTodo;

  final BehaviorSubject<Refresh> _toDoSceneRefreshSubject;
  final BehaviorSubject<Todo?> _currentTodoSubject;
  final BehaviorSubject<TodoItemStartMode> _itemStartModeSubject;

  UseCase(this._toDoSceneRefreshSubject, this._currentTodoSubject,
      this._itemStartModeSubject) {
    _editingTodo = initialEditingTodo;
    _refreshPresentation();
  }

  EditingTodo get initialEditingTodo;
  Future<Result<Todo>> save(EditingTodo editingTodo);
  void cancel();

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
    final result = await save(_editingTodo);
    switch (result) {
      case success(:final data):
        _currentTodoSubject.value = data;
        _toDoSceneRefreshSubject.value = Refresh.yes;
        _itemStartModeSubject.value = TodoItemStartModeUpdate(data.id);
        emit(presentSaveCompleted());
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  void eventCancel() {
    cancel();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
