import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Presenter/TodoItemEditPresenter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Router/TodoItemEditRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/View/TodoItemEditScene.dart';

import 'package:flutter_todo/Scenes/TodoItem/TodoItemEditMode.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemUseCaseState.dart';

class TodoItemEditAssembly {

    final TodoItemEditScene scene;
    TodoItemEditAssembly._(this.scene);

    factory TodoItemEditAssembly(TodoItemEditRouter router, TodoItemEditMode editMode, TodoItemUseCaseState useCaseState) {
        final useCase = TodoItemEditUseCase(EntityGateway.entityGateway, useCaseState, editMode);
        final presenter = TodoItemEditPresenter(useCase, router);
        final scene = TodoItemEditScene(presenter);

        return TodoItemEditAssembly._(scene);
    }
}
