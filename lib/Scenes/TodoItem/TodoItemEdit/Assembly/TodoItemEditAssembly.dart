import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Scenes/AppState/TodoAppState.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Presenter/TodoItemEditPresenter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Router/TodoItemEditRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/View/TodoItemEditScene.dart';

class TodoItemEditAssembly {

    final TodoItemEditScene scene;
    TodoItemEditAssembly._(this.scene);

    factory TodoItemEditAssembly(TodoItemEditRouter router) {
        final useCase = TodoItemEditUseCase(EntityGateway.entityGateway, TodoAppState.instance);
        final presenter = TodoItemEditPresenter(useCase, router);
        final scene = TodoItemEditScene(presenter);

        return TodoItemEditAssembly._(scene);
    }
}
