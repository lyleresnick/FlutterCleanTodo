part of '../TodoItemEdit.dart';

class Assembly {
  final Scene scene;
  Assembly._(this.scene);

  factory Assembly(Router router) {
    late UseCase useCase;
    final toDoListCallbackSubject = TodoAppState.instance.toDoListCallbackSubject;
    final currentTodoSubject = TodoAppState.instance.currentTodoSubject;
    switch (TodoAppState.instance.itemStartModeSubject.value) {
      case TodoItemStartModeCreate():
        useCase = TodoItemCreateUseCase(
            EntityGateway.entityGateway, toDoListCallbackSubject, currentTodoSubject);
      case TodoItemStartModeUpdate():
        useCase = TodoItemUpdateUseCase(
            EntityGateway.entityGateway, toDoListCallbackSubject, currentTodoSubject);
    }
    final presenter = Presenter(useCase, router);
    final scene = Scene(presenter);

    return Assembly._(scene);
  }
}
