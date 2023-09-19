//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemDisplay.dart';

class Assembly {

    final Scene scene;

    Assembly._(this.scene);

    factory Assembly(Router router) {
        final useCase = UseCase(TodoAppState.instance.currentTodoSubject.value!);
        final presenter = Presenter(useCase, router);
        final scene = Scene(presenter);

        return Assembly._(scene);
    }
}
