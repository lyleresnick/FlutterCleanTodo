//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/Scenes/Common/StarterBloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Router/TodoItemDisplayRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/UseCase/TodoItemDisplayUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/UseCase/TodoItemDisplayUseCaseOutput.dart';
import 'TodoItemDisplayPresenterOutput.dart';
import 'package:flutter_todo/Scenes/Common/Localize.dart';

import 'TodoItemDisplayRowViewModel.dart';

class TodoItemDisplayPresenter
    with StarterBloc<TodoItemDisplayPresenterOutput> {
  final TodoItemDisplayUseCase _useCase;
  final TodoItemDisplayRouter _router;
  late List<TodoItemDisplayRowViewModel> _viewModelList;

  TodoItemDisplayPresenter(this._useCase, this._router) {
    _useCase.stream.listen((event) {
      event.when(presentBegin: () {
        _viewModelList = [];
      }, presentString: (field, value) {
        final fieldName = localizeString(fieldNameToString(field));
        _viewModelList.add(TodoItemDisplayRowViewModel(fieldName, value));
      }, presentBool: (field, value) {
        final fieldName = localizeString(fieldNameToString(field));
        _viewModelList.add(TodoItemDisplayRowViewModel(
            fieldName, localizeString(value ? "yes" : "no")));
      }, presentPriority: (field, value) {
        final fieldName = localizeString(fieldNameToString(field));
        _viewModelList.add(TodoItemDisplayRowViewModel(
            fieldName, localizeString(priorityToString(value))));
      }, presentDate: (field, value) {
        final fieldName = localizeString(fieldNameToString(field));
        _viewModelList
            .add(TodoItemDisplayRowViewModel(fieldName, localizeDate(value)));
      }, presentEnd: () {
        streamAdd(TodoItemDisplayPresenterOutput.showFieldList(_viewModelList));
      });
    });
  }

  void eventViewReady() {
    _useCase.eventViewReady();
  }

  void eventModeEdit() {
    _router.routeEditView();
  }

  TodoItemDisplayRowViewModel row(int index) {
    return _viewModelList[index];
  }

  int get rowCount {
    return _viewModelList.length;
  }

  String get editLabel => localizeString("edit");

  @override
  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
