//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_todo/Scenes/Common/BlocProvider.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Assembly/TodoItemRouterAssembly.dart';
import 'package:flutter_todo/Scenes/TodoList/Assembly/TodoListAssembly.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/Presenter/TodoRootRouterPresenter.dart';

class TodoRootRouterScene extends StatelessWidget {
  final TodoRootRouterPresenter _presenter;
  final navKey = GlobalKey<NavigatorState>();

  static const _routeTodoItem = '/todoItem';
  static const _routeTodoList = '/';

  TodoRootRouterScene(this._presenter) {
    _presenter.stream.listen((event) {
      event.when(
        showRowDetail: () {
          navKey.currentState!.pushNamed(_routeTodoItem);
        },
        showPop: () {
          navKey.currentState!.pop();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoRootRouterPresenter>(
        bloc: _presenter,
        child: Navigator(
          key: navKey,
          initialRoute: _routeTodoList,
          onGenerateRoute: (settings) {
            late WidgetBuilder builder;
            switch (settings.name) {
              case _routeTodoList:
                builder = (_) => TodoListAssembly(_presenter).scene;
                break;
              case _routeTodoItem:
                builder = (_) => TodoItemRouterAssembly(_presenter).scene;
                break;
              default:
                assert(false, 'Invalid route: ${settings.name}');
            }
            return MaterialPageRoute(builder: builder);
          },
        ));
  }
}
