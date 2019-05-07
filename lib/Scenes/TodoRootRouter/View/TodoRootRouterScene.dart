//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/View/TodoItemRouterScene.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';
import 'package:flutter_todo/Scenes/TodoList/View/TodoListScene.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/Assembly/TodoRootRooterAssembly.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/Presenter/TodoRootRouterPresenter.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/Presenter/TodoRootRouterPresenterOutput.dart';

class TodoRootRouterScene extends StatefulWidget {

    final TodoRootRouterPresenter presenter;

    TodoRootRouterScene({@required this.presenter});

    @override
    State<StatefulWidget> createState() => TodoRootRouterSceneState();

    factory TodoRootRouterScene.assembled() {
        return TodoRootRouterAssembly().scene;
    }
}

class TodoRootRouterSceneState extends State<TodoRootRouterScene> implements TodoRootRouterPresenterOutput {

    TodoRootRouterPresenter presenter;

    @override
    void initState() {
        super.initState();
        presenter = widget.presenter;
        presenter.output = this;
    }

    BuildContext _todoListContext;
    BuildContext _todoItemContext;

    @override
    Widget build(BuildContext context) {
        return Navigator(
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings) {
                WidgetBuilder builder;
                switch (settings.name) {
                    case '/':
                        builder = (BuildContext context) {
                            _todoListContext = context;
                            return TodoListScene.assembled(router: presenter);
                        };
                        break;
                    case '/todoItem':
                        builder = (BuildContext context) {
                            _todoItemContext = context;
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
        );
    }

    // TodoRootRouterPresenterOutput

    @override
    void showCreateItem(completion) {
        Navigator.of(_todoListContext)
            .pushNamed('/todoItem', arguments: TodoItemStartModeCreate(completion));
    }

    @override
    void showItem(String id, completion) {
        Navigator.of(_todoListContext)
            .pushNamed('/todoItem' , arguments: TodoItemStartModeUpdate(id, completion));
    }

    @override
    void showPop() {
        Navigator.of(_todoItemContext).pop();
    }
}