//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../Common/ActionDecoratedScene.dart';

import '../Assembly/TodoDisplayItemAssembly.dart';
import '../Presenter/TodoItemDisplayPresenter.dart';
import '../Presenter/TodoItemDisplayPresenterOutput.dart';
import '../Router/TodoItemDisplayRouter.dart';

class TodoItemDisplayScene extends StatefulWidget implements ActionDecoratedScene {
    final TodoItemDisplayPresenter presenter;

    TodoItemDisplayScene({@required this.presenter});

    @override
    State<StatefulWidget> createState()  => TodoItemDisplaySceneState();

    factory TodoItemDisplayScene.assembled({@required TodoItemDisplayRouter router}) {
        return TodoItemDisplayAssembly(router).scene;
    }

    Widget leading(TargetPlatform platform) {
        return null;
    }

    List<Widget> actions(TargetPlatform platform) {

        return [
            editButton(presenter.editLabel, platform)
        ];
    }

    Widget editButton(String label, TargetPlatform platform) {

        return (platform == TargetPlatform.iOS )
            ? CupertinoButton(
                child: Text(label,
                    style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                    ),
                ),
                onPressed: presenter.eventModeEdit,
            )
            :  IconButton(
                icon: Icon(Icons.edit),
                onPressed: presenter.eventModeEdit,

            );
    }

    @override
    bool get automaticallyImplyLeading => true;
}

class TodoItemDisplaySceneState extends State<TodoItemDisplayScene> implements TodoItemDisplayPresenterOutput {
    TodoItemDisplayPresenter presenter;

    @override
    void initState() {
        super.initState();
        presenter = widget.presenter;
        presenter.output = this;

        presenter.eventViewReady();
    }

    @override
    Widget build(BuildContext context) {
        return ListView.builder(
          itemCount: presenter.rowCount,
          itemBuilder: (BuildContext context, int i) {
              final row = presenter.row(i);
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            ConstrainedBox(
                              constraints: BoxConstraints(minWidth: 130),
                              child: Text("${row.fieldName}:",
                                  style: TextStyle(fontSize: 17),),
                            ),
                            Expanded(
                              child: Text(row.value,
                                  softWrap: true,
                                  style: TextStyle(fontSize: 17),
                              ),
                            ),
                        ],
                    ),
                  ),
                  Divider(height: 1, color: Colors.blue,),
                ],
              );
          },
          );
    }


//    TodoItemDisplayPresenterOutput

  @override
  void show() {
    setState(() { });
  }
}