//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../../../EntityGateway/EntityGateway.dart';
import '../../../EntityGateway/TestEntityGateway.dart';
import '../View/TodoListScene.dart';
import '../Presenter/TodoListPresenter.dart';
import '../UseCase/TodoListUseCase.dart';

class TodoListAssembly {

    final TodoListScene scene;
    final TodoListPresenter presenter;
    final TodoListUseCase useCase;

    TodoListAssembly._({this.scene, this.useCase, this.presenter});

    factory TodoListAssembly() {

        final useCase = TodoListUseCase();
        final presenter = TodoListPresenter(useCase: useCase);
        final scene = TodoListScene(presenter: presenter);
        useCase.output = presenter;

        return TodoListAssembly._(scene: scene, useCase: useCase, presenter: presenter);
    }
}