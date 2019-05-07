//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

abstract class TodoRootRouterPresenterOutput implements
        TodoRootRouterListPresenterOutput,
        TodoRootRouterItemPresenterOutput {}

abstract class TodoRootRouterListPresenterOutput {

    void showItem(String id, TodoListChangedItemCallback completion);
    void showCreateItem(TodoListChangedItemCallback completion);
}

abstract class TodoRootRouterItemPresenterOutput {
    void showPop();
}
