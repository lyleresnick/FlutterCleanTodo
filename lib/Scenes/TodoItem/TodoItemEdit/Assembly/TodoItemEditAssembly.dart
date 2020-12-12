import 'package:flutter/foundation.dart';
import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Presenter/TodoItemEditPresenter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Router/TodoItemEditRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/View/TodoItemEditScene.dart';

import 'package:flutter_todo/Scenes/TodoItem/TodoItemEditMode.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemUseCaseState.dart';

class TodoItemEditAssembly {

    final TodoItemEditScene scene;
    TodoItemEditAssembly._({@required this.scene});

    factory TodoItemEditAssembly(TodoItemEditRouter router, TodoItemEditMode editMode, TodoItemUseCaseState useCaseState) {
        final useCase = TodoItemEditUseCase(entityGateway: EntityGateway.entityGateway, useCaseState: useCaseState, editMode: editMode);
        final presenter = TodoItemEditPresenter(useCase: useCase, router: router);
        final scene = TodoItemEditScene(presenter: presenter);

        return TodoItemEditAssembly._(scene: scene);
    }
}
