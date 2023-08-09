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
      switch (event) {
        case presentBegin():
          _viewModelList = [];
        case presentString(:final field, :final value):
          final fieldName = localizedString(fieldNameToString(field));
          _viewModelList.add(TodoItemDisplayRowViewModel(fieldName, value));
        case presentBool(:final field, :final value):
          final fieldName = localizedString(fieldNameToString(field));
          _viewModelList.add(TodoItemDisplayRowViewModel(
              fieldName, localizedString(value ? "yes" : "no")));
        case presentPriority(:final field, :final value):
          final fieldName = localizedString(fieldNameToString(field));
          _viewModelList.add(TodoItemDisplayRowViewModel(
              fieldName, localizedString(priorityToString(value))));
        case presentDate(:final field, :final value):
          final fieldName = localizedString(fieldNameToString(field));
          _viewModelList
              .add(TodoItemDisplayRowViewModel(fieldName, localizedDate(value)));
        case presentEnd():
          emit(showFieldList(_viewModelList));
      }
      ;
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

  String get editLabel => localizedString("edit");

  @override
  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
