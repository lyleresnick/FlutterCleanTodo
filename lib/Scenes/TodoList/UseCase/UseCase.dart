//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

class UseCase with StarterBloc<UseCaseOutput> {
  final EntityGateway _entityGateway;
  final TodoAppState _appState;

  UseCase(this._entityGateway, this._appState);

  void eventViewReady() async {
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
    emit(presentModel(
        PresentationModel.fromEntities(_appState.toDoList)));
  }

  void eventCompleted(bool completed, int index) async {
    final result = await _entityGateway.todoManager
        .completed(_appState.toDoList[index].id, completed);
    switch (result) {
      case success(:final data):
        _appState.toDoList[index] = data;
        _refreshPresentation();
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  void eventDelete(int index) async {
    final result =
        await _entityGateway.todoManager.delete(_appState.toDoList[index].id);
    switch (result) {
      case success():
        _appState.toDoList.removeAt(index);
        _refreshPresentation();
      case failure(:final description):
        assert(false, "Unexpected error: $description");
      case networkIssue(:final issue):
        assert(false, "Unexpected Network issue: reason $issue");
    }
  }

  void eventItemSelected(int index) {
    _appState.itemStartMode =
        TodoItemStartModeUpdate(index, _refreshPresentation);
    emit(presentItemDetail());
  }

  void eventCreate() {
    _appState.itemStartMode = TodoItemStartModeCreate(_refreshPresentation);
    emit(presentItemDetail());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
