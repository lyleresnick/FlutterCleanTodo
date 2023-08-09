//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/Common/StarterBloc.dart';
import 'package:flutter_todo/Scenes/TodoList/Router/TodoListRouter.dart';
import 'package:flutter_todo/Scenes/TodoList/UseCase/TodoListUseCase.dart';

import '../UseCase/TodoListUseCaseOutput.dart';
import 'TodoListViewModel.dart';
import 'TodoListPresenterOutput.dart';

class TodoListPresenter with StarterBloc<TodoListPresenterOutput> {
  final TodoListUseCase _useCase;
  final TodoListRouter _router;

  TodoListPresenter(this._useCase, this._router) {
    _useCase.stream.listen((event) {
      switch (event) {
        case presentModel(:final model):
          emit(showModel(TodoListViewModel.fromPresentation(model)));
        case presentItemDetail():
          _router.routeShowItemDetail();
      }
    });
  }

  void eventViewReady() {
    _useCase.eventViewReady();
  }

  void eventCompleted(int index) {
    _useCase.eventCompleted(true, index);
  }

  void eventNotCompleted(int index) {
    _useCase.eventCompleted(false, index);
  }

  void eventDelete(int index) {
    _useCase.eventDelete(index);
  }

  void eventCreate() {
    _useCase.eventCreate();
  }

  void eventItemSelected(int index) {
    _useCase.eventItemSelected(index);
  }

  @override
  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
