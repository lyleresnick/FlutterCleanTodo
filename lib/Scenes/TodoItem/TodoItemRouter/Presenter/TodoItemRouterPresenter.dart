//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/Scenes/Common/Localize.dart';
import 'package:flutter_todo/Scenes/Common/StarterBloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Router/TodoItemDisplayRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Router/TodoItemEditRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Router/TodoItemRouterRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemRouterUseCase.dart';

import 'TodoItemRouterPresenterOutput.dart';
import '../UseCase/TodoItemRouterUseCaseOutput.dart';

class TodoItemRouterPresenter
    with StarterBloc<TodoItemRouterPresenterOutput>
    implements TodoItemDisplayRouter, TodoItemEditRouter {
  final TodoItemRouterUseCase _useCase;
  final TodoItemRouterRouter router;

  TodoItemRouterPresenter(this._useCase, this.router) {
    _useCase.stream.listen((event) {
      switch(event) {
      case presentDisplayView():
        emit(showDisplayView());
      case presentEditView():
        emit(showEditView());
      case presentNotFound(:final id):
        final message = localizedString("todoNotFound");
        //final message = String(format: messageFormat, id)
        emit(showMessageView(message + ' ' + id));
    }
    });
  }

  void eventViewReady() {
    _useCase.eventViewReady();
  }

  Future<bool> eventBack() async {
    _useCase.eventBack();
    return true;
  }

  String get titleLabel => localizedString('todo');

//  TodoItemDisplayRouter

  @override
  void routeEditView() {
    emit(showEditView());
  }

//  TodoItemEditRouter

  @override
  void routeSaveCompleted() {
    emit(showDisplayView());
  }

  @override
  void routeEditingCancelled() {
    emit(showDisplayView());
  }

  @override
  void routeCreateCancelled() {
    router.routeCreateItemCancelled();
  }

  @override
  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
