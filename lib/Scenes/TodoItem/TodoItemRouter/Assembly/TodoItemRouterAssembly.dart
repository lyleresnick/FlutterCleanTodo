//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Scenes/AppState/TodoAppState.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Presenter/TodoItemRouterPresenter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Router/TodoItemRouterRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemRouterUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/View/TodoItemRouterScene.dart';

class TodoItemRouterAssembly {

    final TodoItemRouterScene scene;
    TodoItemRouterAssembly._(this.scene);

    factory TodoItemRouterAssembly(TodoItemRouterRouter router) {

        final useCase = TodoItemRouterUseCase(EntityGateway.entityGateway, TodoAppState.instance);
        final presenter = TodoItemRouterPresenter(useCase, router);
        final scene = TodoItemRouterScene(presenter);

        return TodoItemRouterAssembly._(scene);
    }
}