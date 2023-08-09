//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/Scenes/Common/BlocProvider.dart';
import 'package:flutter_todo/Scenes/Common/Localize.dart';
import 'package:flutter_todo/Scenes/TodoList/Presenter/TodoListPresenter.dart';
import 'package:flutter_todo/Scenes/TodoList/Presenter/TodoListPresenterOutput.dart';
import 'TodoListCell.dart';

class TodoListScene extends StatelessWidget {
  final TodoListPresenter _presenter;

  TodoListScene(this._presenter) {
    _presenter.eventViewReady();
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    return Scaffold(
        appBar: AppBar(
          title: Text(localizedString("todoList")),
          backgroundColor: Colors.lightGreen,
          elevation: platform == TargetPlatform.iOS ? 0.0 : 4.0,
          actions: _actions(platform),
        ),
        body: BlocProvider<TodoListPresenter>(
            bloc: _presenter,
            child: SafeArea(
                child: StreamBuilder<TodoListPresenterOutput>(
                    stream: _presenter.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text("Loading ...");
                      }
                      return switch(snapshot.data!) {
                          showModel(:final model) =>
                            ListView.builder(
                              itemCount: model.rows.length,
                              itemBuilder: (context, index) => TodoListCell(
                                  row: model.rows[index], index: index))
                      };
                    }))));
  }

  List<Widget> _actions(TargetPlatform platform) {
    return [
      (platform == TargetPlatform.iOS)
          ? IconButton(
              iconSize: 34,
              icon: Icon(CupertinoIcons.add),
              onPressed: _presenter.eventCreate,
            )
          : IconButton(
              icon: Icon(Icons.add),
              onPressed: _presenter.eventCreate,
            )
    ];
  }
}
