//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/TodoList/Router/TodoListRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Router/TodoItemRouterRouter.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/Presenter/TodoRootRouterPresenterOutput.dart';

class TodoRootRouterPresenter extends Bloc
    implements TodoItemRouterRouter, TodoListRouter {
  final _controller = StreamController<TodoRootRouterPresenterOutput>();
  Stream<TodoRootRouterPresenterOutput> get stream => _controller.stream;

//    TodoItemRouterRouter

  void routeCreateItemCancelled() {
    _controller.sink.add(ShowPop());
  }

// TodoListRouter

  @override
  void routeShowItemDetail() {
    _controller.sink.add(ShowRowDetail());
  }

  @override
  void dispose() {
    _controller.close();
  }
}
