//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_todo/Scenes/Common/ActionDecoratedScene.dart';
import 'package:flutter_todo/Scenes/Common/BlocProvider.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/View/TodoItemDisplayScene.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/View/TodoItemEditScene.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Assembly/TodoItemRouterAssembly.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Presenter/TodoItemRouterPresenter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Presenter/TodoItemRouterPresenterOutput.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Router/TodoItemRouterRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemUseCaseState.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEditMode.dart';


class TodoItemRouterScene extends StatelessWidget {

    final TodoItemRouterPresenter presenter;
    final TodoItemUseCaseState useCaseState;

    TodoItemRouterScene({@required this.presenter, @required this.useCaseState}) {
        presenter.eventViewReady();
    }

    factory TodoItemRouterScene.assembled({@required TodoItemRouterRouter router, @required TodoItemStartMode startMode}) {
        return TodoItemRouterAssembly(router, startMode).scene;
    }

    @override
    Widget build(BuildContext context) {

        final platform = Theme.of(context).platform;
        return WillPopScope(
          onWillPop: presenter.eventBack,
          child: BlocProvider<TodoItemRouterPresenter>(
            bloc: presenter,
            child: StreamBuilder<TodoItemRouterPresenterOutput>(
                stream: presenter.stream,
                builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                        return Material(color: Colors.black);
                    }
                    final data = snapshot.data;
                    Widget body;

                    if (data is ShowViewReady) {
                        switch (data.startMode.runtimeType) {
                            case TodoItemStartModeCreate:
                                body = TodoItemEditScene.assembled(router: presenter, editMode: TodoItemEditMode.create, useCaseState: useCaseState);
                                break;
                            case TodoItemStartModeUpdate:
                                body = TodoItemDisplayScene.assembled(router: presenter, useCaseState: useCaseState);
                                break;
                        }
                    }
                    else if (data is ShowDisplayView)
                        body = TodoItemDisplayScene.assembled(router: presenter, useCaseState: useCaseState);
                    else if (data is ShowEditView)
                        body = TodoItemEditScene.assembled(router: presenter, editMode: TodoItemEditMode.update, useCaseState: useCaseState);
                    else if (data is ShowMessageView)
                        body = Text(data.message);
                    else
                        assert(false, "snapshot.data is: ${data.runtimeType}");

                    final decoratedScene = (body is ActionDecoratedScene) ? body as ActionDecoratedScene : null;
                    return Scaffold(
                        appBar: AppBar(
                            title: Text(presenter.titleLabel),
                            backgroundColor: Colors.lightGreen,
                            elevation: platform == TargetPlatform.iOS ? 0.0 : 4.0,
                            actions: decoratedScene?.actions(),
                            leading: decoratedScene?.leading(),
                            automaticallyImplyLeading: decoratedScene?.automaticallyImplyLeading ?? false,
                        ),
                        body: body,
                    );
              }
            )
          )
        );
    }
}

