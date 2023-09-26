part of '../TodoItemEdit.dart';

class Assembly {
  final Scene scene;
  Assembly._(this.scene);

  factory Assembly(Router router) {
    final useCase = UseCase(
        EntityGateway.entityGateway,
        TodoAppState.instance.toDoSceneRefreshSubject,
        TodoAppState.instance.currentTodoSubject,
        TodoAppState.instance.itemStartModeSubject);
    final presenter = Presenter(useCase, router);
    final scene = Scene(presenter);

    return Assembly._(scene);
  }
}
