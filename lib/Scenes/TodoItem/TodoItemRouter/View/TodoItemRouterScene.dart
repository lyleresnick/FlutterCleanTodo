//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_todo/Scenes/Common/ActionDecoratedScene.dart';
import 'package:flutter_todo/Scenes/Common/BlocProvider.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Assembly/TodoDisplayItemAssembly.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Assembly/TodoItemEditAssembly.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Presenter/TodoItemRouterPresenter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/Presenter/TodoItemRouterPresenterOutput.dart';

class TodoItemRouterScene extends StatelessWidget {

    final TodoItemRouterPresenter _presenter;

    TodoItemRouterScene(this._presenter) {
        _presenter.eventViewReady();
    }

    @override
    Widget build(BuildContext context) {

        final platform = Theme.of(context).platform;
        return WillPopScope(
          onWillPop: _presenter.eventBack,
          child: BlocProvider<TodoItemRouterPresenter>(
            bloc: _presenter,
            child: StreamBuilder<TodoItemRouterPresenterOutput>(
                stream: _presenter.stream,
                builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                        return Material(color: Colors.black);
                    }
                    final data = snapshot.data;
                    late Widget body;

                    if (data is ShowDisplayView)
                        body = TodoItemDisplayAssembly(_presenter).scene;
                    else if (data is ShowEditView)
                        body = TodoItemEditAssembly(_presenter).scene;
                    else if (data is ShowMessageView)
                        body = Text(data.message);
                    else
                        assert(false, "snapshot.data is: ${data.runtimeType}");

                    final decoratedScene = (body is ActionDecoratedScene) ? body as ActionDecoratedScene : null;
                    return Scaffold(
                        appBar: AppBar(
                            title: Text(_presenter.titleLabel),
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

