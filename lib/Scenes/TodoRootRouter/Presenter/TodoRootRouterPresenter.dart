//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/TodoList/Router/TodoListRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Router/TodoItemRouterRouter.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/Presenter/TodoRootRouterPresenterOutput.dart';

class TodoRootRouterPresenter implements TodoItemRouterRouter, TodoListRouter {

    TodoRootRouterPresenterOutput output;

//    TodoItemRouterRouter

    void routeCreateItemCancelled() {
        output.showPop();
    }

// TodoListRouter

    void routeDisplayItem(id, completion) {
        output.showItem(id, completion);
    }

    void routeCreateItem(completion) {
        output.showCreateItem(completion);
    }
}
