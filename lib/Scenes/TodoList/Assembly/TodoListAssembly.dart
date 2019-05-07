//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../View/TodoListScene.dart';
import '../Presenter/TodoListPresenter.dart';
import '../UseCase/TodoListUseCase.dart';
import '../Router/TodoListRouter.dart';


class TodoListAssembly {

    final TodoListScene scene;
    final TodoListPresenter presenter;
    final TodoListUseCase useCase;

    TodoListAssembly._({this.scene, this.useCase, this.presenter});

    factory TodoListAssembly(TodoListRouter router) {

        final useCase = TodoListUseCase();
        final presenter = TodoListPresenter(useCase: useCase, router: router);
        final scene = TodoListScene(presenter: presenter);
        useCase.output = presenter;

        return TodoListAssembly._(scene: scene, useCase: useCase, presenter: presenter);
    }
}