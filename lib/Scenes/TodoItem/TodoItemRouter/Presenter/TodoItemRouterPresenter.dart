//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/Common/Localize.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Router/TodoItemDisplayRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Router/TodoItemEditRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Router/TodoItemRouterRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemRouterUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemRouterUseCaseOutput.dart';


import 'TodoItemRouterPresenterOutput.dart';

class TodoItemRouterPresenter extends Bloc implements TodoItemDisplayRouter, TodoItemEditRouter  {

    final TodoItemRouterUseCase _useCase;
    final TodoItemRouterRouter router;

    final _controller = StreamController<TodoItemRouterPresenterOutput>();
    Stream<TodoItemRouterPresenterOutput> get stream => _controller.stream;

    TodoItemRouterPresenter(this._useCase, this.router) {
        _useCase.stream
            .listen((event) {
                if (event is PresentDisplayView) {
                    _controller.sink.add(ShowDisplayView());
                }
                else if (event is PresentEditView) {
                  _controller.sink.add(ShowEditView());
                }
                else if (event is PresentNotFound) {
                    final message = "todoNotFound"; //.localized
                    //final message = String(format: messageFormat, id)
                    _controller.sink.add(ShowMessageView(message));

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
        _controller.sink.add(ShowDisplayView());
    }


    @override
    void routeCreateCancelled() {
      router.routeCreateItemCancelled();
    }


    @override
    void dispose() {
        _useCase.dispose();
        _controller.close();
    }

}




