part of '../TodoItemEdit.dart';

class Assembly {
  final Scene scene;
  Assembly._(this.scene);

  factory Assembly(Router router) {
    late UseCase useCase;
    switch (TodoAppState.instance.itemStartMode!) {
      case TodoItemStartModeCreate():
        useCase = TodoItemCreateUseCase(
            EntityGateway.entityGateway, TodoAppState.instance);
      case TodoItemStartModeUpdate():
        useCase = TodoItemUpdateUseCase(
            EntityGateway.entityGateway, TodoAppState.instance);
    }
    final presenter = Presenter(useCase, router);
    final scene = Scene(presenter);

    return Assembly._(scene);
  }
}
