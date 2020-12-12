//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/foundation.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Presenter/TodoItemDisplayPresenter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Router/TodoItemDisplayRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/UseCase/TodoItemDisplayUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/View/TodoItemDisplayScene.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemUseCaseState.dart';

class TodoItemDisplayAssembly {

    final TodoItemDisplayScene scene;

    TodoItemDisplayAssembly._({@required this.scene});

    factory TodoItemDisplayAssembly(TodoItemDisplayRouter router, TodoItemUseCaseState useCaseState) {
        final useCase = TodoItemDisplayUseCase(useCaseState: useCaseState);
        final presenter = TodoItemDisplayPresenter(useCase: useCase, router: router);
        final scene = TodoItemDisplayScene(presenter: presenter);

        return TodoItemDisplayAssembly._(scene: scene);
    }
}
