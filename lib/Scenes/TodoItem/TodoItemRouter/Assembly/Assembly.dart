//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemRouter.dart';

class Assembly {

    final Scene scene;
    Assembly._(this.scene);

    factory Assembly(Router router) {

        final useCase = UseCase(EntityGateway.entityGateway, TodoAppState.instance);
        final presenter = Presenter(useCase, router);
        final scene = Scene(presenter);

        return Assembly._(scene);
    }
}