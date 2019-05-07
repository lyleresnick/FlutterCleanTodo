//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/Common/Localize.dart';
import 'package:flutter_todo/Scenes/TodoList/UseCase/TodoListPresentationModel.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

import '../UseCase/TodoItemRouterUseCase.dart';
import '../Router/TodoItemRouterRouter.dart';
import '../UseCase/TodoItemRouterUseCaseOutput.dart';
import '../../TodoItemDisplay/Router/TodoItemDisplayRouter.dart';
import '../../TodoItemEdit/Router/TodoItemEditRouter.dart';

import 'TodoItemRouterPresenterOutput.dart';

class TodoItemRouterPresenter implements TodoItemRouterUseCaseOutput, TodoItemDisplayRouter, TodoItemEditRouter  {

    final TodoItemRouterUseCase _useCase;
    final TodoItemRouterRouter _router;
    final TodoItemStartMode _startMode;

    TodoItemRouterPresenterOutput output;

    TodoItemRouterPresenter({TodoItemRouterUseCase useCase, TodoItemRouterRouter router, TodoItemStartMode startMode})
        : _useCase = useCase,
          _router = router,
          _startMode = startMode;

    void eventViewReady() {
        _useCase.eventViewReady(startMode: _startMode);
    }

    Future<bool> eventBack() async {
        _useCase.eventBack();
        return true;
    }

    String get titleLabel => localizeString('todo');

// TodoItemRouterUseCaseOutput

// TodoItemRouterBackUseCaseOutput

    @override
    void presentChanged(TodoListPresentationModel item) {
        _startMode.todoListChangedItemCallback(item);
    }

// TodoItemRouterViewReadyUseCaseOutput

    @override
    void presentViewReady(TodoItemStartMode startMode) {
        output.showViewReady(startMode);
    }

    @override
    void presentNotFound(String id) {
        final message = "todoNotFound"; //.localized
        //final message = String(format: messageFormat, id)
        output.showMessageView(message);
    }

//  TodoItemDisplayRouter

  @override
  void routeEditView() {
    output.showEditView();
  }

//  TodoItemEditRouter

    @override
    void routeSaveCompleted() {
        output.showDisplayView();
    }

    @override
    void routeEditingCancelled() {
        switch(_startMode.runtimeType) {
        case TodoItemStartModeUpdate:
            output.showDisplayView();
            break;
        case TodoItemStartModeCreate:
            _router.routeCreateItemCancelled();
            break;
        }
    }
}




