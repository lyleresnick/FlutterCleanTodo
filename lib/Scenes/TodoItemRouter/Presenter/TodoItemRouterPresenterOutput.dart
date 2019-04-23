//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../TodoItemStartMode.dart';

abstract class TodoItemRouterPresenterOutput implements
    TodoItemRouterViewReadyPresenterOutput,
    TodoItemRouterDisplayPresenterOutput,
    TodoItemRouterEditPresenterOutput {}


abstract class TodoItemRouterViewReadyPresenterOutput {

    void show(String title);
    void showViewReady(TodoStartMode startMode);
    void showView(String message);
}

abstract class TodoItemRouterDisplayPresenterOutput {
    void showDisplayView();
}

abstract class TodoItemRouterEditPresenterOutput {
    void showEditView();
}
