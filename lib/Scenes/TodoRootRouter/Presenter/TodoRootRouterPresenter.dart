//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/Common/StarterBloc.dart';
import 'package:flutter_todo/Scenes/TodoList/Router/TodoListRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Router/TodoItemRouterRouter.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/Presenter/TodoRootRouterPresenterOutput.dart';

class TodoRootRouterPresenter with StarterBloc<TodoRootRouterPresenterOutput>
    implements TodoItemRouterRouter, TodoListRouter {

//    TodoItemRouterRouter

  void routeCreateItemCancelled() {
    emit(TodoRootRouterPresenterOutput.showPop);
  }

// TodoListRouter

  @override
  void routeShowItemDetail() {
    emit(TodoRootRouterPresenterOutput.showRowDetail);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
