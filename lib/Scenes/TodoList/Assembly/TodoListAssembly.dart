//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Scenes/TodoList/Presenter/TodoListPresenter.dart';
import 'package:flutter_todo/Scenes/TodoList/Router/TodoListRouter.dart';
import 'package:flutter_todo/Scenes/TodoList/UseCase/TodoListUseCase.dart';
import 'package:flutter_todo/Scenes/TodoList/View/TodoListScene.dart';

class TodoListAssembly {

    final TodoListScene scene;
    TodoListAssembly._(this.scene);

    factory TodoListAssembly(TodoListRouter router) {

        final useCase = TodoListUseCase(EntityGateway.entityGateway);
        final presenter = TodoListPresenter(useCase, router);
        final scene = TodoListScene(presenter);

        return TodoListAssembly._(scene);
    }
}