//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_todo/Scenes/Common/BlocProvider.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Assembly/TodoItemRouterAssembly.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';
import 'package:flutter_todo/Scenes/TodoList/Assembly/TodoListAssembly.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/Presenter/TodoRootRouterPresenter.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/Presenter/TodoRootRouterPresenterOutput.dart';

class TodoRootRouterScene extends StatelessWidget {
  final TodoRootRouterPresenter _presenter;
  final navKey = GlobalKey<NavigatorState>();

  static const routeTodoItem = '/todoItem';
  static const routeTodoList = '/';

  TodoRootRouterScene(this._presenter) {
    _presenter.stream.listen((event) {
      if (event is ShowCreateItem) {
        navKey.currentState.pushNamed(routeTodoItem,
            arguments: TodoItemStartModeCreate(event.completion));
      } else if (event is ShowItem) {
        navKey.currentState.pushNamed(routeTodoItem,
            arguments: TodoItemStartModeUpdate(event.id, event.completion));
      } else if (event is ShowPop) {
        navKey.currentState.pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoRootRouterPresenter>(
        bloc: _presenter,
        child: Navigator(
          key: navKey,
          initialRoute: routeTodoList,
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            switch (settings.name) {
              case routeTodoList:
                builder = (_) => TodoListAssembly(_presenter).scene;
                break;
              case routeTodoItem:
                builder = (_) => TodoItemRouterAssembly(
                    _presenter, settings.arguments as TodoItemStartMode).scene;
                break;
              default:
                assert(false, 'Invalid route: ${settings.name}');
            }
            return MaterialPageRoute(builder: builder, settings: settings);
          },
        ));
  }
}
