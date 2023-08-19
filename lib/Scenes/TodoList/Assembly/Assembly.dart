//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

class Assembly {
  final Scene scene;
  Assembly._(this.scene);

  factory Assembly(Router router) {
    final useCase = UseCase(
        EntityGateway.entityGateway,
        TodoAppState.instance.toDoListSubject,
        TodoAppState.instance.toDoSceneRefreshSubject,
        TodoAppState.instance.itemStartModeSubject);
    final presenter = Presenter(useCase, router);
    final scene = Scene(presenter);

    return Assembly._(scene);
  }
}
