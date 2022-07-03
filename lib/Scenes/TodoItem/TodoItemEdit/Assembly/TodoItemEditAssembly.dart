import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Scenes/AppState/TodoAppState.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Presenter/TodoItemEditPresenter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Router/TodoItemEditRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemCreateUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemUpdateUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/View/TodoItemEditScene.dart';

import '../../TodoItemStartMode.dart';

class TodoItemEditAssembly {
  final TodoItemEditScene scene;
  TodoItemEditAssembly._(this.scene);

  factory TodoItemEditAssembly(TodoItemEditRouter router) {
    late TodoItemEditUseCase useCase;
    switch (TodoAppState.instance.itemStartMode.runtimeType) {
      case TodoItemStartModeCreate:
        useCase = TodoItemCreateUseCase(
            EntityGateway.entityGateway, TodoAppState.instance);
        break;
      case TodoItemStartModeUpdate:
        useCase = TodoItemUpdateUseCase(
            EntityGateway.entityGateway, TodoAppState.instance);
        break;
    }
    final presenter = TodoItemEditPresenter(useCase, router);
    final scene = TodoItemEditScene(presenter);

    return TodoItemEditAssembly._(scene);
  }
}
