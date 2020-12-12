//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/TodoList/Router/TodoListRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Router/TodoItemRouterRouter.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/Presenter/TodoRootRouterPresenterOutput.dart';

class TodoRootRouterPresenter extends Bloc implements TodoItemRouterRouter, TodoListRouter {

    BuildContext todoListContext;
    BuildContext todoItemContext;


    final _controller = StreamController<TodoRootRouterPresenterOutput>();
    Stream<TodoRootRouterPresenterOutput> get stream => _controller.stream;

//    TodoItemRouterRouter

    void routeCreateItemCancelled() {
        _controller.sink.add(ShowPop());
    }

// TodoListRouter

    void routeDisplayItem(id, completion) {
        _controller.sink.add(ShowItem(id, completion));
    }

    void routeCreateItem(completion) {
        _controller.sink.add(ShowCreateItem(completion));
    }

    @override
    void dispose() {
        _controller.close();
    }

}
