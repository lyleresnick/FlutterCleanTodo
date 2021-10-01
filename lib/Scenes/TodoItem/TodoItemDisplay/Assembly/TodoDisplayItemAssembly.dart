//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Presenter/TodoItemDisplayPresenter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Router/TodoItemDisplayRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/UseCase/TodoItemDisplayUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/View/TodoItemDisplayScene.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemUseCaseState.dart';

class TodoItemDisplayAssembly {

    final TodoItemDisplayScene scene;

    TodoItemDisplayAssembly._(this.scene);

    factory TodoItemDisplayAssembly(TodoItemDisplayRouter router, TodoItemUseCaseState useCaseState) {
        final useCase = TodoItemDisplayUseCase(useCaseState);
        final presenter = TodoItemDisplayPresenter(useCase, router);
        final scene = TodoItemDisplayScene(presenter);

        return TodoItemDisplayAssembly._(scene);
    }
}
