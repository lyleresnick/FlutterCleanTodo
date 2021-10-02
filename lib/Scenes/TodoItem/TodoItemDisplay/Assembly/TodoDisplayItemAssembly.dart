//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/AppState/TodoAppState.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Presenter/TodoItemDisplayPresenter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Router/TodoItemDisplayRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/UseCase/TodoItemDisplayUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/View/TodoItemDisplayScene.dart';

class TodoItemDisplayAssembly {

    final TodoItemDisplayScene scene;

    TodoItemDisplayAssembly._(this.scene);

    factory TodoItemDisplayAssembly(TodoItemDisplayRouter router) {
        final useCase = TodoItemDisplayUseCase(TodoAppState.instance);
        final presenter = TodoItemDisplayPresenter(useCase, router);
        final scene = TodoItemDisplayScene(presenter);

        return TodoItemDisplayAssembly._(scene);
    }
}
