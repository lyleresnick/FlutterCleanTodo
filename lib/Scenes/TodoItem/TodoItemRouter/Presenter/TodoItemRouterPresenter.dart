//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/Common/Localize.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Router/TodoItemDisplayRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Router/TodoItemEditRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Router/TodoItemRouterRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemRouterUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemRouterUseCaseOutput.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';


import 'TodoItemRouterPresenterOutput.dart';

class TodoItemRouterPresenter extends Bloc implements TodoItemDisplayRouter, TodoItemEditRouter  {

    final TodoItemRouterUseCase useCase;
    final TodoItemRouterRouter router;
    final TodoItemStartMode startMode;

    final _controller = StreamController<TodoItemRouterPresenterOutput>();
    Stream<TodoItemRouterPresenterOutput> get stream => _controller.stream;

    TodoItemRouterPresenter({@required this.useCase, @required this.router, @required this.startMode}) {
        useCase.stream
            .listen((event) {
                if (event is PresentViewReady) {
                    _controller.sink.add(ShowViewReady(event.startMode));
                }
                else if (event is PresentChanged) {
                    startMode.todoListChangedItemCallback(event.item);
                }
                else if (event is PresentNotFound) {
                    final message = "todoNotFound"; //.localized
                    //final message = String(format: messageFormat, id)
                    _controller.sink.add(ShowMessageView(message));

                }
            });
    }

    void eventViewReady() {
        useCase.eventViewReady(startMode: startMode);
    }

    Future<bool> eventBack() async {
        useCase.eventBack();
        return true;
    }

    String get titleLabel => localizeString('todo');


//  TodoItemDisplayRouter

  @override
  void routeEditView() {
      _controller.sink.add(ShowEditView());
  }

//  TodoItemEditRouter

    @override
    void routeSaveCompleted() {
        _controller.sink.add(ShowDisplayView());
    }

    @override
    void routeEditingCancelled() {
        switch(startMode.runtimeType) {
        case TodoItemStartModeUpdate:
            _controller.sink.add(ShowDisplayView());
            break;
        case TodoItemStartModeCreate:
            router.routeCreateItemCancelled();
            break;
        }
    }

    @override
    void dispose() {
        useCase.dispose();
        _controller.close();
    }
}




