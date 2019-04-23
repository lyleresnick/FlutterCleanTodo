//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../../TodoList/UseCase/TodoListPresentationModel.dart';
import '../TodoItemStartMode.dart';

abstract class TodoItemRouterUseCaseOutput implements
    TodoItemRouterViewReadyUseCaseOutput,
    TodoItemRouterBackUseCaseOutput {}


abstract class TodoItemRouterViewReadyUseCaseOutput {

    void presentTitle();
    void presentViewReady(TodoStartMode startMode);
    void presentNotFound(String id);
}

abstract class TodoItemRouterBackUseCaseOutput {
    void presentChanged(TodoListPresentationModel item);
}

