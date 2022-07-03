//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/Scenes/Common/Localize.dart';
import 'package:flutter_todo/Scenes/Common/StarterBloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Router/TodoItemDisplayRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Router/TodoItemEditRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Router/TodoItemRouterRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemRouterUseCase.dart';

import 'TodoItemRouterPresenterOutput.dart';

class TodoItemRouterPresenter
    with StarterBloc<TodoItemRouterPresenterOutput>
    implements TodoItemDisplayRouter, TodoItemEditRouter {
  final TodoItemRouterUseCase _useCase;
  final TodoItemRouterRouter router;

  TodoItemRouterPresenter(this._useCase, this.router) {
    _useCase.stream.listen((event) {
      event.when(presentDisplayView: () {
        streamAdd(TodoItemRouterPresenterOutput.showDisplayView());
      }, presentEditView: () {
        streamAdd(TodoItemRouterPresenterOutput.showEditView());
      }, presentNotFound: (String id) {
        final message = "todoNotFound"; //.localized
        //final message = String(format: messageFormat, id)
        streamAdd(TodoItemRouterPresenterOutput.showMessageView(message));
      });
    });
  }

  void eventViewReady() {
    _useCase.eventViewReady();
  }

  Future<bool> eventBack() async {
    _useCase.eventBack();
    return true;
  }

  String get titleLabel => localizeString('todo');

//  TodoItemDisplayRouter

  @override
  void routeEditView() {
    streamAdd(TodoItemRouterPresenterOutput.showEditView());
  }

//  TodoItemEditRouter

  @override
  void routeSaveCompleted() {
    streamAdd(TodoItemRouterPresenterOutput.showDisplayView());
  }

  @override
  void routeEditingCancelled() {
    streamAdd(TodoItemRouterPresenterOutput.showDisplayView());
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
