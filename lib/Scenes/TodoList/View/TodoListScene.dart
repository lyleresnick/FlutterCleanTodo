//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/Scenes/Common/BlocProvider.dart';
import 'package:flutter_todo/Scenes/TodoList/Assembly/TodoListAssembly.dart';
import 'package:flutter_todo/Scenes/TodoList/Presenter/TodoListPresenter.dart';
import 'package:flutter_todo/Scenes/TodoList/Presenter/TodoListPresenterOutput.dart';
import 'package:flutter_todo/Scenes/TodoList/Router/TodoListRouter.dart';
import 'TodoListCell.dart';

class TodoListScene extends StatelessWidget {
  final TodoListPresenter presenter;

  TodoListScene({@required this.presenter}) {
    presenter.eventViewReady();
  }

  factory TodoListScene.assembled({@required TodoListRouter router}) {
    return TodoListAssembly(router).scene;
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    return Scaffold(
      appBar: AppBar(
        title: Text(presenter.titleLabel),
        backgroundColor: Colors.lightGreen,
        elevation: platform == TargetPlatform.iOS ? 0.0 : 4.0,
        actions: _actions(platform),
      ),
      body: BlocProvider<TodoListPresenter>(
        bloc: presenter,
        child: SafeArea(
          child: StreamBuilder<TodoListPresenterOutput>(
              stream: presenter.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading ...");
                }
                final data = snapshot.data;
                if (data is ShowTodoList)
                  return ListView.builder(
                      itemCount: data.viewModelList.length,
                      itemBuilder: (context, index) => TodoListCell(
                          row: data.viewModelList[index], index: index));
                else
                  return null;
              }),
        ),
      ),
    );
  }

  List<Widget> _actions(TargetPlatform platform) {
    return [
      (platform == TargetPlatform.iOS)
          ? IconButton(
              iconSize: 34,
              icon: Icon(CupertinoIcons.add),
              onPressed: presenter.eventCreate,
            )
          : IconButton(
              icon: Icon(Icons.add),
              onPressed: presenter.eventCreate,
            )
    ];
  }
}
