part of '../TodoItemEdit.dart';

class Assembly {
  final Scene scene;
  Assembly._(this.scene);

  factory Assembly(Router router) {
    late UseCase useCase;
    final toDoSceneRefreshSubject = TodoAppState.instance.toDoSceneRefreshSubject;
    final currentTodoSubject = TodoAppState.instance.currentTodoSubject;
    final itemStartModeSubject = TodoAppState.instance.itemStartModeSubject;
    switch (TodoAppState.instance.itemStartModeSubject.value) {
      case TodoItemStartModeCreate():
        useCase = TodoItemCreateUseCase(
            EntityGateway.entityGateway, toDoSceneRefreshSubject, currentTodoSubject, itemStartModeSubject);
      case TodoItemStartModeUpdate():
        useCase = TodoItemUpdateUseCase(
            EntityGateway.entityGateway, toDoSceneRefreshSubject, currentTodoSubject, itemStartModeSubject);
    }
    final presenter = Presenter(useCase, router);
    final scene = Scene(presenter);

    return Assembly._(scene);
  }
}
