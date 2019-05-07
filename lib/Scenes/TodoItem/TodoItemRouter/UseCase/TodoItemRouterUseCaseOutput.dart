//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/TodoList/UseCase/TodoListPresentationModel.dart';
import '../../TodoItemStartMode.dart';

abstract class TodoItemRouterUseCaseOutput implements
    TodoItemRouterViewReadyUseCaseOutput,
    TodoItemRouterBackUseCaseOutput {}


abstract class TodoItemRouterViewReadyUseCaseOutput {

    void presentViewReady(TodoItemStartMode startMode);
    void presentNotFound(String id);
}

abstract class TodoItemRouterBackUseCaseOutput {
    void presentChanged(TodoListPresentationModel item);
}

