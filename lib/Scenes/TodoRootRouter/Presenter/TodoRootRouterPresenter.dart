//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/Common/StarterBloc.dart';
import 'package:flutter_todo/Scenes/TodoList/Router/TodoListRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Router/TodoItemRouterRouter.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/Presenter/TodoRootRouterPresenterOutput.dart';

class TodoRootRouterPresenter with StarterBloc<TodoRootRouterPresenterOutput>
    implements TodoItemRouterRouter, TodoListRouter {

//    TodoItemRouterRouter

  void routeCreateItemCancelled() {
    streamAdd(ShowPop());
  }

// TodoListRouter

  @override
  void routeShowItemDetail() {
    streamAdd(ShowRowDetail());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
