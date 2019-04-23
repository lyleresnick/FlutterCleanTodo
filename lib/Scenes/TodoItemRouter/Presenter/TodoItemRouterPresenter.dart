//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../UseCase/TodoItemRouterUseCase.dart';
import 'TodoItemRouterPresenterOutput.dart';
import '../Router/TodoItemRouterRouter.dart';
import '../TodoItemStartMode.dart';
import '../UseCase/TodoItemRouterUseCaseOutput.dart';
import '../../TodoList/UseCase/TodoListPresentationModel.dart';
import '../../TodoItemDisplay/Router/TodoItemDisplayRouter.dart';
import '../../TodoItemEdit/Router/TodoItemEditRouter.dart';


class TodoItemRouterPresenter implements TodoItemRouterUseCaseOutput, TodoItemDisplayRouter, TodoItemEditRouter  {

    final TodoItemRouterUseCase _useCase;
    TodoItemRouterRouter router;
    TodoStartMode startMode;

    TodoItemRouterPresenterOutput output;

    TodoItemRouterPresenter({TodoItemRouterUseCase useCase}) : _useCase = useCase;

    void eventViewReady() {
        _useCase.eventViewReady(startMode: startMode);
    }

    void eventBack() {
        _useCase.eventBack();
    }

// TodoItemRouterUseCaseOutput

// TodoItemRouterBackUseCaseOutput

    @override
    void presentChanged(TodoListPresentationModel item) {
        startMode.todoListChangedItemCallback(item);
    }

// TodoItemRouterViewReadyUseCaseOutput
    @override
    void presentTitle() {
        output.show(_title);
    }

    String get _title  {
        return "todo";// .localized;
    }

    @override
    void presentViewReady(TodoStartMode startMode) {
        output.showViewReady(startMode);
    }

    @override
    void presentNotFound(String id) {
        final message = "todoNotFound"; //.localized
        //final message = String(format: messageFormat, id)
        output.showView(message);
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
        switch(startMode.runtimeType) {
        case TodoStartModeUpdate:
            output.showDisplayView();
            break;
        case TodoStartModeCreate:
            router.routeCreateItemCancelled();
            break;
        }
    }
}




