//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../View/TodoItemRouterScene.dart';
import '../Presenter/TodoItemRouterPresenter.dart';
import '../UseCase/TodoItemRouterUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';
import '../../TodoItemRouter/Router/TodoItemRouterRouter.dart';


class TodoItemRouterAssembly {

    final TodoItemRouterScene scene;
    final TodoItemRouterPresenter presenter;
    final TodoItemRouterUseCase useCase;

    TodoItemRouterAssembly._({this.scene, this.useCase, this.presenter});

    factory TodoItemRouterAssembly(TodoItemRouterRouter router, TodoItemStartMode startMode) {

        final useCase = TodoItemRouterUseCase();
        final presenter = TodoItemRouterPresenter(useCase: useCase, router: router, startMode: startMode);
        final scene = TodoItemRouterScene(presenter: presenter);
        useCase.output = presenter;

        return TodoItemRouterAssembly._(scene: scene, useCase: useCase, presenter: presenter);
    }
}