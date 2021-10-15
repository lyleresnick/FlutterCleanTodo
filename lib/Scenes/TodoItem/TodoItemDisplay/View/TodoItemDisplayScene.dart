//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/Scenes/Common/ActionDecoratedScene.dart';
import 'package:flutter_todo/Scenes/Common/BlocProvider.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Presenter/TodoItemDisplayPresenter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Presenter/TodoItemDisplayPresenterOutput.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Presenter/TodoItemDisplayRowViewModel.dart';

class TodoItemDisplayScene extends StatelessWidget
    implements ActionDecoratedScene {
  final TodoItemDisplayPresenter _presenter;

  TodoItemDisplayScene(this._presenter) {
    _presenter.eventViewReady();
  }

  @override
  Widget? leading() {
    return null;
  }

  @override
  List<Widget> actions() {
    return [
      _EditButton(
          label: _presenter.editLabel, onPressed: _presenter.eventModeEdit)
    ];
  }

  @override
  bool get automaticallyImplyLeading => true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoItemDisplayPresenter>(
        bloc: _presenter,
        child: StreamBuilder<TodoItemDisplayPresenterOutput>(
            stream: _presenter.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("Loading ...");
              }
              return snapshot.data!.when(showFieldList: (model) {
                return ListView.builder(
                  itemCount: model.length,
                  itemBuilder: (BuildContext context, int i) {
                    return _Row(row: model[i]);
                  },
                );
              });
            }));
  }
}

class _Row extends StatelessWidget {
  const _Row({
    Key? key,
    required this.row,
  }) : super(key: key);

  final TodoItemDisplayRowViewModel row;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 130),
                child: Text(
                  "${row.fieldName}:",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Expanded(
                child: Text(
                  row.value,
                  softWrap: true,
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.blue,
        ),
      ],
    );
  }
}

class _EditButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  const _EditButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS)
        ? CupertinoButton(
            child: Text(
              label,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: onPressed,
          )
        : IconButton(
            icon: Icon(Icons.edit),
            onPressed: onPressed,
          );
  }
}
