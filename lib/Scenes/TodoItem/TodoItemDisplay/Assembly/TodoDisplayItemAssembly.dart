//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../View/TodoItemDisplayScene.dart';
import '../Presenter/TodoItemDisplayPresenter.dart';
import '../UseCase/TodoItemDisplayUseCase.dart';
import '../Router/TodoItemDisplayRouter.dart';


class TodoItemDisplayAssembly {

    final TodoItemDisplayScene scene;
    final TodoItemDisplayPresenter presenter;
    final TodoItemDisplayUseCase useCase;

    TodoItemDisplayAssembly._({this.scene, this.useCase, this.presenter});

    factory TodoItemDisplayAssembly(TodoItemDisplayRouter router) {
        final useCase = TodoItemDisplayUseCase();
        final presenter = TodoItemDisplayPresenter(useCase: useCase, router: router);
        final scene = TodoItemDisplayScene(presenter: presenter);
        useCase.output = presenter;

        return TodoItemDisplayAssembly._(
                scene: scene, useCase: useCase, presenter: presenter);
    }
}
