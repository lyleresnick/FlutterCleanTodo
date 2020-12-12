//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_todo/Scenes/Common/BlocProvider.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/View/TodoItemRouterScene.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';
import 'package:flutter_todo/Scenes/TodoList/View/TodoListScene.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/Assembly/TodoRootRooterAssembly.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/Presenter/TodoRootRouterPresenter.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/Presenter/TodoRootRouterPresenterOutput.dart';

class TodoRootRouterScene extends StatelessWidget {

    final TodoRootRouterPresenter presenter;

    TodoRootRouterScene({@required this.presenter}) {
        presenter.stream
            .listen((event) {
                if (event is ShowCreateItem) {
                    Navigator.of(presenter.todoListContext).pushNamed('/todoItem', arguments: TodoItemStartModeCreate(event.completion));
                }
                else if (event is ShowItem) {
                    Navigator.of(presenter.todoListContext).pushNamed('/todoItem', arguments: TodoItemStartModeUpdate(event.id, event.completion));
                }
                else if (event is ShowPop) {
                    Navigator.of(presenter.todoItemContext).pop();
                }

        });
    }

    factory TodoRootRouterScene.assembled() {
        return TodoRootRouterAssembly().scene;
    }

    @override
    Widget build(BuildContext context) {
        return BlocProvider<TodoRootRouterPresenter>(
          bloc: presenter,
          child: Navigator(
              initialRoute: '/',
              onGenerateRoute: (RouteSettings settings) {
                  WidgetBuilder builder;
                  switch (settings.name) {
                      case '/':
                          builder = (BuildContext context) {
                              presenter.todoListContext = context;
                              return TodoListScene.assembled(router: presenter);
                          };
                          break;
                      case '/todoItem':
                          builder = (BuildContext context) {
                              presenter.todoItemContext = context;
                              return TodoItemRouterScene.assembled(
                                      router: presenter,
                                      startMode: settings.arguments as TodoItemStartMode);
                          };
                          break;
                      default:
                          assert(false, 'Invalid route: ${settings.name}');
                  }
                  return MaterialPageRoute(builder: builder, settings: settings);
              },
          )
        );
    }
}
